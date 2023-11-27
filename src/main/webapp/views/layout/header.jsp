<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<div class="hero_area">
    <div class="bg-box">
        <img src="${pageContext.request.contextPath}/assets/images/hero-bg.jpg" alt="">
    </div>

    <!-- header section strats -->
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <a class="navbar-brand" href="./indexcontroller">
                    <span>
                        TDAT
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav  mx-auto ">
                        <li class="nav-item active">
                            <a class="nav-link" href="./indexcontroller">Trang chủ </a>
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
                        <!-- User -->
                        <div class="user_option">

                            <a href="">
                                <div class="user-avatar">
                                    <!-- Replace 'avatar_image_url' with the actual URL of the user's avatar -->
                                    <img src="${pageContext.request.contextPath}/assets/images/<%=imagepath%>" alt="User Avatar" class="avatar-img">
                                </div>
                            </a>

                            

                            <a href="./logoutcontroller" class="order_online">
                                Thoát
                            </a>
                        </div>
                        <!-- End User -->

                        <%}%>          
                    </ul>

                </div>
            </nav>
        </div>
    </header>
    <!-- end header section -->
</div>