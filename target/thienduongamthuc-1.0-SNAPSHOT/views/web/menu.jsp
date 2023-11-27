<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.siddle.thegoiamthuc.model.Category"%>
<%@page import="fu.siddle.thegoiamthuc.model.Fooditem"%>
<%@page import="fu.siddle.thegoiamthuc.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String imagepath = null;

    List<User> ul = (List<User>) session.getAttribute("listuserlogin");

    List<Fooditem> listfood = (List<Fooditem>) session.getAttribute("listfood");

    List<Category> listcate = (List<Category>) session.getAttribute("listcate");

    if (ul != null) {
        imagepath = ul.get(0).getAvatar_path();

    }

    int countP = (int) session.getAttribute("endPage");

    String keysearch = (String) session.getAttribute("keysearch");

%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
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

        <title> Thực đơn - TDAT </title>

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

    <body class="sub_page">
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

                                    <a class="cart_link" href="" data-toggle="modal" data-target="#cartModal">
                                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                        <g>
                                        <g>
                                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                              c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                        </g>
                                        </g>
                                        <g>
                                        <g>
                                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                              C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                              c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                              C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                        </g>
                                        </g>
                                        <g>
                                        <g>
                                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                              c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                        </g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        </svg>
                                    </a>
                                    <h6>${sessionScope.size}</h6>
                                    <a href="./logoutcontroller" class="order_online">
                                        Thoát
                                    </a>
                                </div>
                                <!-- End User -->


                                <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header border-bottom-0">
                                                <h5 class="modal-title" id="exampleModalLabel">
                                                    Rỏ hàng của bạn
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-body">



                                                <table class="table table-image">
                                                    <thead>
                                                        <tr>                    
                                                            <th scope="col">Món ăn</th>
                                                            <th scope="col">Giá</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Tổng</th>
                                                            <th scope="col">Xóa</th>
                                                        </tr>
                                                    </thead>

                                                    <c:set var="s" value="${0}"/>
                                                    <c:set var="o" value="${sessionScope.cart}"/>
                                                    <c:set var="t" value="0"/>

                                                    <c:forEach items="${o.items}" var="i">

                                                        <tbody>
                                                            <tr>
                                                                <td>${i.fooditem.name}</td>
                                                                <td>${i.price}₫</td>
                                                                <td>${i.quantity}</td>
                                                                <td>${i.price*i.quantity}₫</td>

                                                                <!--sum-->
                                                                ${s = s + i.price*i.quantity}
                                                                <td>
                                                                    <a href="./processcontroller?fid=${i.fooditem.id}" class="btn btn-danger btn-sm">
                                                                        <i class="fa fa-times"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </tbody>

                                                    </c:forEach>
                                                </table> 

                                                <div class="d-flex justify-content-end">
                                                    <h4><span class="price text-success">Tổng cộng ${sessionScope.size} món: ${s}₫</span></h4>
                                                </div>
                                            </div>
                                            <div class="modal-footer border-top-0 d-flex justify-content-between">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                                                <a href="https://scontent.fsgn2-7.fna.fbcdn.net/v/t1.15752-9/405336103_879670187103411_7919669060763491826_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeGjg0gL174ILbEyA8eVev3DvS9vFKXRmNq9L28UpdGY2mS_LcZ8nO68hUky-7e1CqR9XkBRLO3peh6Cbu_vxjI3&_nc_ohc=vB17AMc0VRMAX8Cxh8V&_nc_ht=scontent.fsgn2-7.fna&oh=03_AdSE0hCFlD_5Ae-zDr5wjfNCxkn71G3Im0Kc6cvZo5IMRg&oe=658C61F6">
                                                    Đi đên thanh toán
                                                </a>
                                                <!--
                                                <button type="button" class="btn btn-success">Đi đên thanh toán</button>
                                                -->

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%}%>          
                            </ul>

                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
        </div>

        <!-- food section -->
        <section class="food_section layout_padding">
            <div class="container">

                <div class="heading_container heading_center">
                    <h2>
                        Các món 
                    </h2>
                </div>

                <br><br/>

                <div class="heading_container heading_center">
                    <form action="./searchcontroller" method="get" class="search-form">
                        <div class="input-group">
                            <input type="text" class="form-control" name="query" value="${keysearch}" required>
                            <button type="submit" class="btn btn-dark">Tìm kiếm</button>
                        </div>
                    </form>
                </div>

                <ul class="filters_menu">
                    <li class="active" >
                        <a href="./menucontroller" class="white-text">All</a>
                    </li>

                    <c:set var="c" value="${sessionScope.listcate}"/>
                    <c:forEach items="${c}" var="i">

                        <li>
                            <a href="./categorycontroller?id=${i.id}" class="black-text ">${i.name}</a>
                        </li>

                    </c:forEach>
                </ul>

                <div class="filters-content">
                    <div class="row grid">
                        <%for (Fooditem f : listfood) {%>
                        <!--part-->
                        <div class="col-sm-6 col-lg-4 all pizza">
                            <div class="box">

                                <div class="img-box">
                                    <img src="<%=f.getImage()%>" alt="">
                                </div>
                                <div class="detail-box">
                                    <h5>
                                        <%=f.getName()%>
                                    </h5>
                                    <div class="options">
                                        <h6>
                                            <%=f.getPrice()%>₫
                                        </h6>
                                        <a href="./detailcontroller?id=<%=f.getId()%>">
                                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                            <g>
                                            <g>
                                            <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                                  c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                            </g>
                                            </g>
                                            <g>
                                            <g>
                                            <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                                  C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                                  c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                                  C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                            </g>
                                            </g>
                                            <g>
                                            <g>
                                            <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                                  c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                            </g>
                                            </g>                                                                                             
                                            </svg>
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--end part-->
                        <%}%>
                    </div>
                </div>
            </div>
        </section>
        <!--end food section -->

        <div class="heading_container heading_center">
            <div class="pagination">
                <div class="pagination-links">

                    <c:forEach  begin="1" end="${sessionScope.endPage}" var="i">
                        <a href="./endpagecontroller?id=${i}" class="pagination-link ${requestScope.active == i ? "active" : " "}  ">${i}</a>
                    </c:forEach>

                </div>
            </div>
        </div>

        <br><br/>
        <br><br/>

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