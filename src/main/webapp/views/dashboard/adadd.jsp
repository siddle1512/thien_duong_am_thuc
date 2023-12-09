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



            <!--Order part-->
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Thêm món ăn mới</h2>
                    <form action="adaddcontroller" method="POST">
                        <div class="form-group">
                            <label for="name">Tên món ăn</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="form-group">
                            <label for="loaiSanPham">Chọn thể loại món</label>
                            <select class="form-control" name="category_id" id="loaiSanPham">
                                <c:forEach items="${sessionScope.listC}" var="i">
                                    <option value="${i.id}">${i.name}</option>
                                </c:forEach>

                            </select>
                        </div>
                        <!-- You can add more options (non-binary, etc.) if needed -->

                        <div class="form-group">
                            <label for="quantityInput">Giá tiền</label>
                            <input id="quantityInput" class="form-control" type="number" name="price" value="200" min="1000" max="1000000" required/>
                        </div>

                        <script>
                            // JavaScript code
                            document.addEventListener('DOMContentLoaded', function () {
                                // Get the input element
                                const quantityInput = document.getElementById('quantityInput');

                                // Add event listener for input change
                                quantityInput.addEventListener('change', function () {
                                    // Get the value entered by the user
                                    let enteredValue = parseInt(this.value);

                                    // Check if the entered value is less than 1 or greater than 100
                                    if (enteredValue < 1000 || isNaN(enteredValue)) {
                                        // If the value is less than 1 or not a number, set it to 1
                                        this.value = 1000;
                                    } else if (enteredValue > 1000000) {
                                        // If the value is greater than 100, set it to 100
                                        this.value = 1000000;
                                    }
                                });
                            });
                        </script>

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