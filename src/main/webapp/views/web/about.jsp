<%@page import="fu.siddle.thegoiamthuc.model.User"%>
<%@page import="java.util.List"%>
<%
    String imagepath = null;

    List<User> ul = (List<User>) session.getAttribute("listuserlogin");

    if (ul != null) {
        imagepath = ul.get(0).getAvatar_path();

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png" type="">

        <title> Login-Page </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
        <!-- responsive style -->
        <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet" />
    </head>

    <body>
        <div class="hero_area">
            <div class="bg-box">
                <img src="https://cdn.dribbble.com/users/3951514/screenshots/7288432/media/866b49d81c982fdecd5a22de44c5e677.gif" alt="">
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.html">
                            <span>
                                Thiên Đường Ẩm Thực
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item active">
                                    <a class="nav-link" href="./indexcontroller">Trang chủ <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./menucontroller">Thực đơn</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./aboutcontroller">Thông tin</a>
                                </li>

                                <%if (imagepath == null) {%>
                                <li class="nav-item">
                                    <a class="nav-link" href="./registercontroller">Đăng kí</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="./logincontroller">Đăng nhập</a>
                                </li>
                                <%} else {%>             
                                <li class="nav-item">
                                    <a class="nav-link" href="./logoutcontroller">Đăng xuất</a>
                                </li>

                                <!-- User Avatar -->
                                <li class="nav-item">
                                    <div class="user-avatar">
                                        <!-- Replace 'avatar_image_url' with the actual URL of the user's avatar -->
                                        <img src="<%=imagepath%>" alt="User Avatar" class="avatar-img">
                                    </div>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="./indexcontroller"><%=ul.get(0).getUsername()%></a>
                                </li

                                <li class="nav-item">
                                    <a class="nav-link" href="./CartController">                                    <svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{
                                                fill:#ffffff
                                            }</style><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                                    </a>
                                </li>
                                <%}%>          
                            </ul>

                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->


        </div>

        <!-- about section -->
        <section class="about_section layout_padding">
            <div class="container  ">

                <div class="row">
                    <div class="col-md-6 ">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/assets/images/about-img.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="detail-box">
                            <div class="heading_container">
                                <h2>
                                    Chúng Tôi Là Thế Giới Ẩm Thực
                                </h2>
                            </div>
                            <p>
                                Ăn là thich - đã thích là hết tiền.
                            </p>
                            <a href="./HomeController">
                                Nhiều hơn
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end about section -->

        <%@include file="/views/layout/footer.jsp" %>

        <!-- jQery -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
        <!-- owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- custom js -->
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
    </body>

</html>