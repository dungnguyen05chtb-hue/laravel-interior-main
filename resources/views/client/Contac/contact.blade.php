@extends('layouts.contact')

@section('contact')
    <div class="main-content">
        <div id="wrapper-site">
            <div id="content-wrapper">

                <!-- breadcrumb -->
                <nav class="breadcrumb-bg">
                    <div class="container no-index">
                        <div class="breadcrumb">
                            <ol>
                                <li>
                                    <a href="{{ url('/client') }}">
                                        <span>Home</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>Contact</span>
                                    </a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </nav>
                <div id="main">
                    <div class="page-home">
                        <div class="container">
                            <h1 class="text-center title-page">Liên hệ với chúng tôi</h1>
                            <div class="row-inhert">
                                <div class="header-contact">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-md-4">
                                            <div class="item d-flex">
                                                <div class="item-left">
                                                    <div class="icon">
                                                        <i class="zmdi zmdi-email"></i>
                                                    </div>
                                                </div>
                                                <div class="item-right d-flex">
                                                    <div class="title">Email:</div>
                                                    <div class="contact-content">
                                                        <a href="mailto:support@domain.com">dungnguyen05chtb@gamil.com</a>
                                                        <br>
                                                        <a href="mailto:contact@domain.com">contact@noithat.com</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 col-md-4">
                                            <div class="item d-flex">
                                                <div class="item-left">
                                                    <div class="icon">
                                                        <i class="zmdi zmdi-home"></i>
                                                    </div>
                                                </div>
                                                <div class="item-right d-flex">
                                                    <div class="title">Address:</div>
                                                    <div class="contact-content">
                                                        Đường Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 col-md-4">
                                            <div class="item d-flex justify-content-end  last">
                                                <div class="item-left">
                                                    <div class="icon">
                                                        <i class="zmdi zmdi-phone"></i>
                                                    </div>
                                                </div>
                                                <div class="item-right d-flex">
                                                    <div class="title">Hotline:</div>
                                                    <div class="contact-content">
                                                        0891 234 567
                                                        <br>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="contact-map">
                                    <div id="map">
                                        <iframe
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7451.496827326615!2d105.74610611050427!3d20.962616189967108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313452efff394ce3%3A0x391a39d4325be464!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBQaGVuaWthYQ!5e0!3m2!1svi!2s!4v1780619619744!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                                            allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div class="input-contact">
                                    <p class="text-intro text-center">"Chúng tôi luôn sẵn sàng lắng nghe bạn!"
                                        Nếu bạn có bất kỳ câu hỏi, góp ý hoặc yêu cầu hỗ trợ, hãy điền thông tin vào form
                                        liên hệ bên dưới.
                                        Đội ngũ của chúng tôi sẽ phản hồi sớm nhất có thể để mang đến cho bạn trải nghiệm
                                        tốt nhất.
                                    </p>

                                    <p class="icon text-center">
                                        <a href="#">
                                            <img src="/img/other/contact_mess.png" alt="img">
                                        </a>
                                    </p>

                                    <div class="d-flex justify-content-center">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <div class="contact-form">

                                                <!-- Hiển thị thông báo thành công -->
                                                @if (session('success'))
                                                    <div class="alert alert-success">{{ session('success') }}</div>
                                                @endif

                                                <!-- Hiển thị lỗi validation -->
                                                @if ($errors->any())
                                                    <div class="alert alert-danger text-start">
                                                        <ul class="mb-0">
                                                            @foreach ($errors->all() as $error)
                                                                <li>{{ $error }}</li>
                                                            @endforeach
                                                        </ul>
                                                    </div>
                                                @endif

                                                <form action="{{ route('client.contact.send') }}" method="post"
                                                    enctype="multipart/form-data">
                                                    @csrf
                                                    <div class="form-fields">
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <input
                                                                    class="form-control @error('name') is-invalid @enderror"
                                                                    name="name" placeholder="Your name"
                                                                    value="{{ old('name') }}" required>
                                                                @error('name')
                                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                            <div class="col-md-6 margin-bottom-mobie">
                                                                <input
                                                                    class="form-control @error('email') is-invalid @enderror"
                                                                    name="email" type="email"
                                                                    value="{{ old('email') }}" placeholder="Your email"
                                                                    required>
                                                                @error('email')
                                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <textarea class="form-control @error('message') is-invalid @enderror" name="message" placeholder="Message"
                                                                    rows="8" required>{{ old('message') }}</textarea>
                                                                @error('message')
                                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <button class="btn" type="submit" name="submitMessage">
                                                            <img class="img-fl" src="/img/other/contact_email.png"
                                                                alt="img">
                                                            Send message
                                                        </button>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection
