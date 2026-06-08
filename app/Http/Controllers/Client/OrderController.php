<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Models\Coupon;
use App\Mail\OrderSuccessMail;
use App\Mail\OrderCancelledMail;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;


class OrderController extends Controller
{
    public function checkout(Request $request)
    {
        $user = auth()->user();
        $selectedItemIds = $request->input('selected_items', []);

        if (empty($selectedItemIds)) {
            return redirect()->route('client.carts.index')->with('error', 'Vui lòng chọn sản phẩm để thanh toán.');
        }

        $cart = Cart::where('user_id', $user->id)->first();

        if (!$cart) {
            return redirect()->route('client.carts.index')->with('error', 'Không tìm thấy giỏ hàng.');
        }

        $items = CartItem::with('variant.product')
            ->where('cart_id', $cart->id)
            ->whereIn('id', $selectedItemIds)
            ->get();

        if ($items->isEmpty()) {
            return redirect()->route('client.carts.index')->with('error', 'Không tìm thấy sản phẩm đã chọn.');
        }

        $productTotal = 0;
        foreach ($items as $item) {
            $productTotal += $item->variant->price * $item->quantity;
        }

        $shippingArea = $request->input('shipping_area');
        $shippingFee = $shippingArea === 'outer' ? 30000 : 0;

        $discountId = session('applied_coupon_id');
        $discountAmount = session('discount_amount', 0);
        $total = max(0, $productTotal + $shippingFee - $discountAmount);

        DB::beginTransaction();

        try {
            $order = Order::create([
                'user_id' => $user->id,
                'total_amount' => $total,
                'payment_method' => 'cod',
                'status' => 'pending',
                'shipping_name' => $request->shipping_name,
                'shipping_phone' => $request->shipping_phone,
                'shipping_address' => $request->shipping_address,
                'shipping_area' => $shippingArea,
                'shipping_fee' => $shippingFee,
                'discount_id' => $discountId,
                'discount_amount' => $discountAmount,
                'booking_code' => 'ORD-' . now()->format('Ymd') . '-' . str_pad(Order::max('id') + 1, 5, '0', STR_PAD_LEFT),
            ]);

            //  Tăng số lượt sử dụng mã giảm giá
            if ($discountId) {
                $coupon = Coupon::find($discountId);
                if ($coupon) {
                    $coupon->increment('used_count');
                }
            }

            foreach ($items as $item) {
                $variant = $item->variant;

                if ($variant->stock_quantity < $item->quantity) {
                    DB::rollBack();
                    return redirect()->route('client.carts.index')->with('error', 'Sản phẩm "' . ($variant->name ?? $variant->product->translations->first()->name ?? '---') . '" không đủ hàng.');
                }

                $variant->stock_quantity -= $item->quantity;
                $variant->save();

                OrderItem::create([
                    'order_id' => $order->id,
                    'variant_id' => $variant->id,
                    'quantity' => $item->quantity,
                    'unit_price' => $variant->price,
                    'total_price' => $variant->price * $item->quantity,
                    'variant_name' => $variant->name ?? $variant->product->translations->first()->name ?? '---',
                    'base_price_snapshot' => $variant->product->base_price ?? $variant->price,
                ]);
            }

            Payment::create([
                'order_id' => $order->id,
                'user_id' => $user->id,
                'amount' => $total,
                'method' => 'cod',
                'status' => 'pending',
                'transaction_code' => null,
                'paid_at' => null,
            ]);

            CartItem::where('cart_id', $cart->id)
                ->whereIn('id', $selectedItemIds)
                ->delete();

            session()->forget(['applied_coupon_id', 'discount_amount', 'cart_count']);

            DB::commit();

            return redirect()->route('client.orders.history')->with('success', 'Đặt hàng thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('client.carts.index')->with('error', 'Có lỗi xảy ra khi xử lý đơn hàng.');
        }
    }

    //  Thêm shippingForm
    public function shippingForm(Request $request)
    {
        $selectedItemIds = $request->input('selected_items', []);

        if (empty($selectedItemIds)) {
            return redirect()->route('client.carts.index')->with('error', 'Vui lòng chọn sản phẩm để thanh toán.');
        }

        $paymentMethod = 'cod';

        $cart = Cart::where('user_id', auth()->id())->first();

        $items = CartItem::with('variant.product')
            ->where('cart_id', $cart->id)
            ->whereIn('id', $selectedItemIds)
            ->get();

        if ($items->isEmpty()) {
            return redirect()->route('client.carts.index')->with('error', 'Không tìm thấy sản phẩm đã chọn.');
        }

        return view('client.orders.shipping', compact('items', 'paymentMethod', 'cart'));
    }

    
    public function cancel(Order $order)
    {
        // Kiểm tra quyền hủy
        if ($order->user_id !== auth()->id()) {
            abort(403, 'Không có quyền hủy đơn này.');
        }

        if ($order->status !== 'pending') {
            return back()->with('error', 'Chỉ có thể hủy đơn đang chờ xử lý.');
        }

        DB::beginTransaction();

        try {
            // Load danh sách item và variant
            $order->load(['items.variant', 'user']);

            foreach ($order->items as $item) {
                // Tăng lại tồn kho cho variant
                if ($item->variant) {
                    $item->variant->increment('stock_quantity', $item->quantity);
                }
            }

            // Cập nhật trạng thái đơn hàng
            $order->status = 'cancelled';
            $order->cancel_reason = 'Người dùng đã tự hủy đơn'; // có thể thay bằng request input nếu muốn
            $order->save();

            // Gửi email thông báo hủy
            if (!empty($order->user?->email)) {
                Mail::to($order->user->email)
                    ->send(new OrderCancelledMail($order, $order->cancel_reason));
            }

            DB::commit();

            return back()->with('success', 'Đơn hàng đã được hủy.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Hủy đơn hàng thất bại: ' . $e->getMessage());
            return back()->with('error', 'Có lỗi xảy ra khi hủy đơn hàng.');
        }
    }

    public function reorder($id)
    {
        $oldOrder = Order::with('items.variant.product')->findOrFail($id);

        if ($oldOrder->user_id !== auth()->id()) {
            abort(403, 'Bạn không có quyền mua lại đơn này.');
        }

        $user = auth()->user();
        $cart = Cart::firstOrCreate(['user_id' => $user->id]);

        foreach ($oldOrder->items as $item) {
            if ($item->variant && $item->variant->product) {

                // Kiểm tra tồn kho
                if ($item->variant->stock_quantity < $item->quantity) {
                    continue; // bỏ qua nếu không đủ hàng
                }

                // Tìm sản phẩm đã có trong giỏ
                $cartItem = CartItem::where('cart_id', $cart->id)
                    ->where('variant_id', $item->variant_id)
                    ->first();

                if ($cartItem) {
                    $cartItem->quantity += $item->quantity;
                    $cartItem->save();
                } else {
                    CartItem::create([
                        'cart_id'    => $cart->id,
                        'variant_id' => $item->variant_id,
                        'quantity'   => $item->quantity,
                    ]);
                }
            }
        }

        // Cập nhật session giỏ hàng
        session(['cart_count' => $cart->items->sum('quantity')]);

        return redirect()->route('client.carts.index')
            ->with('success', 'Sản phẩm đã được thêm lại vào giỏ hàng.');
    }


    public function retryPayment(Order $order)
    {
        return redirect()->route('client.orders.history')
        ->with('error', 'Hiện chỉ hỗ trợ thanh toán khi nhận hàng.');
    }


    public function history()
    {
        $orders = Order::with(['items.variant.product', 'payment'])
            ->where('user_id', auth()->id())
            ->orderByDesc('created_at')
            ->get();

        $cart = auth()->user()->cart()->with('items.variant.product.translations')->first();

        return view('client.orders.history', compact('orders', 'cart'));
    }

    public function confirm(Order $order)
    {
        // 1. Kiểm tra quyền
        if ($order->user_id !== auth()->id()) {
            abort(403, 'Bạn không có quyền xác nhận đơn hàng này.');
        }

        // 2. Chỉ cho xác nhận khi đơn đang ở trạng thái shipping
        if ($order->status !== 'shipping') {
            return back()->with('error', 'Chỉ có thể xác nhận khi đơn hàng đang giao.');
        }

        $oldStatus = $order->status;

        // 3. Cập nhật đơn hàng thành completed
        $order->status = 'completed';
        $order->save();

        // 4. Nếu có payment -> ép thành "paid"
        if ($order->payment) {
            $order->payment->status = 'paid';   // hoặc 'success' tùy DB của bạn
            $order->payment->save();
        }

        // 5. Ghi log trạng thái (nếu có bảng logs)
        if (method_exists($order, 'statusLogs')) {
            $order->statusLogs()->create([
                'old_status' => $oldStatus,
                'new_status' => 'completed',
                'changed_by' => auth()->id(),
                'changed_at' => now(),
            ]);
        }

        return back()->with('success','Cảm ơn bạn đã nhận hàng!');
    }
    public function confirmByEmail(Order $order)
{
    if ($order->status === 'completed') {
        return redirect()->route('client.home')
            ->with('success', 'Đơn hàng đã được xác nhận trước đó.');
    }

    if ($order->status !== 'shipping') {
        return redirect()->route('client.home')
            ->with('error', 'Chỉ có thể xác nhận khi đơn hàng đang giao.');
    }

    $oldStatus = $order->status;

    $order->status = 'completed';
    $order->save();

    if ($order->payment) {
        $order->payment->status = 'paid';
        $order->payment->save();
    }

    if (method_exists($order, 'statusLogs')) {
        $order->statusLogs()->create([
            'old_status' => $oldStatus,
            'new_status' => 'completed',
            'changed_by' => null,
            'changed_at' => now(),
        ]);
    }

    return redirect()->route('client.home')
        ->with('success', 'Cảm ơn bạn đã xác nhận nhận hàng. Đơn hàng đã hoàn tất.');
}
}
