<%@page import="fu.siddle.thegoiamthuc.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String imagepath = null;

    List<User> ul = (List<User>) session.getAttribute("listuserlogin");

    if (ul != null) {
        imagepath = ul.get(0).getAvatar_path();

    }

%>
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

        <title> Thông tin - TDAT </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/stylepayment.css">
        <!-- responsive style -->
        <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">

        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    </head>

    <body class="sub_page">

        <div class="hero_area">
            <%@include file="../layout/header.jsp"%>
        </div>

        <br><br/>

        <div class="container">
            <form action="" method="post">
                <div class="row">

                    <div class="col-12 mt-4">
                        <div class="card p-3">
                            <p class="mb-0 fw-bold h4">Đơn thanh toán của bạn</p>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card p-3">

                            <div class="card-body border p-0">

                                <div class="collapse show p-3 pt-0" id="collapseExample">
                                    <div class="row">


                                        <table class="table table-image">
                                            <thead>
                                                <tr>                    
                                                    <th scope="col">Món ăn</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Tổng</th>

                                                </tr>
                                            </thead>

                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:set var="t" value="0"/>

                                            <c:forEach items="${o.items}" var="i">

                                                <tbody>
                                                    <tr>
                                                        <td>${i.fooditem.name}</td>
                                                        <td>${i.price}₫</td>
                                                        <td>${i.quantity}</td>
                                                        <td>${i.price*i.quantity}₫</td>

                                                    </tr>
                                                </tbody>

                                            </c:forEach>
                                        </table>                               

                                        <div class="col-lg-5 mb-lg-0 mb-3">
                                            <p class="h4 mb-0">Tổng kết</p>
                                            <p class="mb-0"><span class="fw-bold">Khách hàng: </span><span class="c-green"><%=ul.get(0).getUsername()%></span>
                                            </p>
                                            <p class="mb-0">
                                                <span class="fw-bold">Tổng tiền: </span>
                                                <span class="c-green">${s}₫</span>
                                            </p>                                       

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">

                        <br><br/>
                        <form action="checkoutcontroller" method="post">
                            <c:set var="u" value="${sessionScope.user}" />
                            <div class="form-group">
                                <label for="loaiSanPham">Chọn địa chỉ giao hàng</label>
                                <select class="form-control" id="loaiSanPham">
                                    <c:forEach items="${u.adress}" var="i">
                                        <option value="loai1">${i}</option>
                                    </c:forEach>

                                </select>

                            </div>
                            
                            <div class="form-group">
                                <a class="btn btn-dark" href="./profilecontroller">Thêm địa chỉ</a> 
                            </div>
                            
                            <div class="form-group">
                                <label for="loaiSanPham">Chọn phương thức thanh toán</label>
                                <select class="form-control" id="loaiSanPham" name="payment">                                  
                                    <option value="Vnpay">Vnpay</option>  
                                    <option value="Tiền mặt">Tiền mặt</option> 
                                </select>
                            </div>

                            <input type="submit" class="btn btn-dark" onclick="" value="Thanh toán"/>
                        </form>

                    </div>

                </div>

        </div>

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