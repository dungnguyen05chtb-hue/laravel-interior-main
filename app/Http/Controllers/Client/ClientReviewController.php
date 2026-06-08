<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Review;
use App\Models\OrderItem;
use Illuminate\Support\Facades\Auth;

class ClientReviewController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'order_item_id' => 'required|exists:order_items,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string|max:500',
        ]);

        $orderItem = OrderItem::with('order')->find($request->order_item_id);

        if (!$orderItem) {
            return redirect()->back()->with('error', 'Sản phẩm không tồn tại.');
        }

        if ($orderItem->order->user_id !== Auth::id()) {
            return redirect()->back()->with('error', 'Bạn không có quyền đánh giá sản phẩm này.');
        }

        if ($orderItem->order->status !== 'completed') {
            return redirect()->back()->with('error', 'Chỉ được đánh giá khi đơn hàng đã hoàn tất.');
        }

        Review::updateOrCreate(
            [
                'user_id' => Auth::id(),
                'order_item_id' => $request->order_item_id,
            ],
            [
                'rating' => $request->rating,
                'comment' => $request->comment,
                'is_visible' => 1,
            ]
        );

        return redirect()->back()->with('success', 'Cảm ơn bạn đã đánh giá sản phẩm!');
    }
}