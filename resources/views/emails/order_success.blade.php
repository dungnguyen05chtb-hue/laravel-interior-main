<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Xác nhận đơn hàng #{{ $order->id }}</title>
</head>

<body style="font-family: Arial, sans-serif; color: #333; line-height: 1.6;">
    <h2 style="color: #2a9d8f;">🎉 Cảm ơn bạn đã mua sắm tại Style House!</h2>

    <p>Xin chào <strong>{{ $order->user->name ?? 'Quý khách' }}</strong>,</p>

    <p>Chúng tôi rất vui thông báo rằng đơn hàng của bạn đã được <strong>thanh toán thành công</strong>. Dưới đây là
        thông tin chi tiết đơn hàng:</p>

    <table style="border-collapse: collapse;">
        <tr>
            <td style="padding: 6px 12px;">🧾 <strong>Mã đơn hàng:</strong></td>
            <td style="padding: 6px 12px;">#{{ $order->id }}</td>
        </tr>
        <tr>
            <td style="padding: 6px 12px;">💰 <strong>Tổng thanh toán:</strong></td>
            <td style="padding: 6px 12px;">{{ number_format($order->total_amount) }}đ</td>
        </tr>
        <tr>
            <td style="padding: 6px 12px;">⏰ <strong>Thời gian thanh toán:</strong></td>
            <td style="padding: 6px 12px;">
                {{ $order->payment && $order->payment->paid_at ? \Carbon\Carbon::parse($order->payment->paid_at)->format('H:i d/m/Y') : 'Chưa thanh toán' }}
            </td>


        </tr>
    </table>

    <p>Chúng tôi sẽ bắt đầu xử lý đơn hàng của bạn và giao đến trong thời gian sớm nhất.</p>

    <p>Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi qua email này hoặc số điện thoại hỗ trợ khách
        hàng.</p>

    <p style="margin-top: 20px;">Một lần nữa, cảm ơn bạn đã tin tưởng và đồng hành cùng
        <strong>{{ config('app.name') }}</strong>.
    </p>

    <p style="font-style: italic;">Chúc bạn một ngày thật vui vẻ và tràn đầy năng lượng! 💖</p>
    @if(isset($confirmUrl))
    <hr style="margin-top: 25px;">

    <h3 style="color: #2a9d8f;">Xác nhận nhận hàng</h3>

    <p>Nếu quý khách đã nhận được hàng, vui lòng bấm nút bên dưới để xác nhận:</p>

    <p>
        <a href="{{ $confirmUrl }}"
           style="background:#28a745;color:#fff;padding:12px 18px;text-decoration:none;border-radius:6px;display:inline-block;">
            Tôi đã nhận được hàng
        </a>
    </p>

    <p style="font-size: 13px; color: #777;">Link xác nhận có hiệu lực trong 7 ngày.</p>
@endif

    <hr style="margin-top: 30px;">
    <p style="font-size: 13px; color: #777;">Đây là email tự động, vui lòng không trả lời lại email này.</p>
</body>

</html>
