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

        <title> Register-Page </title>

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
        <!-- responsive style -->
        <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet" />
    </head>

    <body>
        <div class="hero_area">
            <div class="bg-box">
                <img src="https://cdn.dribbble.com/users/3951514/screenshots/7288432/media/866b49d81c982fdecd5a22de44c5e677.gif" alt="">
            </div>
            <%@include file="/views/layout/header.jsp" %>

            <section class="register_section layout_padding-bottom">
                <div class="register_container">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 offset-md-3">
                                <div class="box">
                                    <h2>Đăng ký</h2>
                                    <form action="registercontroller" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="username">Tên đăng nhập</label>
                                            <input type="text" class="form-control" id="username" name="username" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="email">Năm sinh</label>
                                            <input type="number" class="form-control" id="email" name="birth_year" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="gender">Giới tính</label>
                                            <div>
                                                <input type="radio" id="male" name="gender" value="nam" required>
                                                <label for="male">Nam</label>
                                            </div>
                                            <div>
                                                <input type="radio" id="female" name="gender" value="nữ" required>
                                                <label for="female">Nữ</label>
                                            </div>
                                            <!-- You can add more options (non-binary, etc.) if needed -->
                                        </div>

                                        <div class="form-group">
                                            <label for="username">Địa chỉ</label>
                                            <input type="text" class="form-control" id="username" name="adress" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="username">Email</label>
                                            <input type="email" class="form-control" id="username" name="email" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="password">Mật khẩu</label>
                                            <div class="password-input d-flex align-items-center">
                                                <input type="password" class="form-control mr-2" id="password" name="password" required>
                                                <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="profilePicture">Ảnh đại diện</label>
                                            <input type="file" class="form-control-file" id="profilePicture" name="profilePicture" accept="image/*">
                                            <!-- 'accept="image/*"' ensures only image files can be uploaded -->
                                        </div>

                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </form>
                                    <div class="form-footer">
                                        <p>Bạn đã có tài khoản? <a href="./logincontroller">Đăng nhập</a></p>
                                    </div>　
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Add jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Add JavaScript for toggling password visibility -->
        <script>
            $(document).ready(function () {
                $(".toggle-password").on('click', function () {
                    var $passwordField = $($(this).attr('toggle'));

                    if ($passwordField.attr('type') === 'password') {
                        $passwordField.attr('type', 'text');
                    } else {
                        $passwordField.attr('type', 'password');
                    }
                });
            });
        </script>

        <style>
            /* Additional styles for the login form */
            .login_area {
                /* Add your login area background or style here */
            }

            .login_container {
                padding: 50px 0;
            }

            .box {
                background: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .box h2 {
                margin-bottom: 30px;
                text-align: center;
            }

            .form-group {
                margin-bottom: 30px;
            }

            label {
                font-weight: bold;
                color: #333;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 15px;
                border-radius: 5px;
                border: 1px solid #ccc;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                outline: none;
                border-color: #007bff;
            }

            button {
                width: 100%;
                padding: 15px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #0056b3;
            }

            .form-footer {
                margin-top: 20px;
                text-align: center;
            }

            .form-footer a {
                color: #007bff;
                text-decoration: none;
                transition: color 0.3s;
            }

            .form-footer a:hover {
                color: #0056b3;
            }
        </style>       

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