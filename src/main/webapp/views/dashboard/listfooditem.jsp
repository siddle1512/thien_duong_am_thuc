<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.siddle.thegoiamthuc.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<User> listU = (List<User>) session.getAttribute("listU");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Quản lý - TDAT</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png" type="">
    </head>

    <body id="reportsPage">

        <%@include file="../layout/headerad.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Xin chào, ${sessionScope.username} (Admin) <b></b></p>
                </div>
            </div>
            <!-- row -->

            <!--Order part-->
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Danh các món ăn</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Stt</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Loại sản phẩm</th>
                                <th scope="col">Giá tiền</th>
                                <th scope="col">Ảnh sản phẩm</th>
                                <th scope="col" style="padding-left: 60px;">Mục chỉnh sửa</th>
                            </tr>

                        </thead>
                        <tbody>
                            <c:set var="n" value="0"/>
                            <c:forEach items="${sessionScope.listf}" var="i">
                                <tr>                                                                     
                                    <th scope="row"><b>${n = n +1}</b></th>
                                    <td><b>${i.name}</b></td>
                                    <td><b>${i.category_id}</b></td>
                                    <td><b>${i.price}₫</b></td>
                                    <td><img src="${i.image}" alt="không có ảnh" width="70px"></img</td>
                                    <td><a class="btn btn-danger btn-sm"  href="./addeletecontroller?query=${i.id}" >Xóa</a>  <a class="btn btn-dark btn-sm"  href="./adupdatecontroller?query=${i.id}" >Sửa</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--End Order part-->

        </div>
    </div>

    <br><br/>
    <br><br/>
    <%@include file="../layout/footerad.jsp" %>

</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
<!-- https://momentjs.com/ -->
<script src="${pageContext.request.contextPath}/assets/js/Chart.min.js"></script>
<!-- http://www.chartjs.org/docs/latest/ -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="${pageContext.request.contextPath}/assets/js/tooplate-scripts.js"></script>

</body>

</html>