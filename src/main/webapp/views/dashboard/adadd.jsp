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
    </head>

    <body id="reportsPage">

        <%@include file="../layout/headerad.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Xin chào, ${sessionScope.username} (Admin) <b></b></p>
                </div>
            </div>



            <!--Order part-->
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Tạo sản phẩm</h2>
                    <form action="adaddcontroller" method="POST">
                        <div class="form-group">
                            <label for="name">Tên sản phẩm</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="form-group">
                            <select name="category_id">
                                <option value="1">Đồ ăn</option>
                                <option value="2">Nước uống</option>
                                <option value="3">Thức ăn nhẹ</option>
                                <option value="4">Gà rán</option>
                                <option value="5">Burger</option>
                                <option value="6">Combo</option>
                                <option value="7">Món tráng miệng</option>
                            </select>
                        </div>
                        <!-- You can add more options (non-binary, etc.) if needed -->


                        <div class="form-group">
                            <label for="price">Giá tiền</label>
                            <input type="number" class="form-control" id="price" name="price" required>
                        </div>

                        <div class="form-group">
                            <label for="image">Ảnh sản phẩm</label>
                            <input type="text" class="form-control mr-2" id="image" name="image" required>
                        </div>

                        <button type="submit" class="btn btn-dark">Tạo sản phẩm</button>
                    </form>
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
<script>

</script>
</body>

</html>