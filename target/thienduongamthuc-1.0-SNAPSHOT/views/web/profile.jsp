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

        <style type="text/css">
            body{
                margin-top:20px;
                background:#f5f5f5;
            }
            /* ===========
               Profile
             =============*/
            .card-box {
                padding: 20px;
                box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.06), 0 2px 0 0 rgba(0, 0, 0, 0.02);
                -webkit-border-radius: 5px;
                border-radius: 5px;
                -moz-border-radius: 5px;
                background-clip: padding-box;
                margin-bottom: 20px;
                background-color: #ffffff;
            }
            .header-title {
                text-transform: uppercase;
                font-size: 15px;
                font-weight: 600;
                letter-spacing: 0.04em;
                line-height: 16px;
                margin-bottom: 8px;
            }
            .social-links li a {
                -webkit-border-radius: 50%;
                background: #EFF0F4;
                border-radius: 50%;
                color: #7A7676;
                display: inline-block;
                height: 30px;
                line-height: 30px;
                text-align: center;
                width: 30px;
            }

            /* ===========
               Gallery
             =============*/
            .portfolioFilter a {
                -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
                -moz-transition: all 0.3s ease-out;
                -ms-transition: all 0.3s ease-out;
                -o-transition: all 0.3s ease-out;
                -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
                -webkit-transition: all 0.3s ease-out;
                box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
                color: #333333;
                padding: 5px 10px;
                display: inline-block;
                transition: all 0.3s ease-out;
            }
            .portfolioFilter a:hover {
                background-color: #ffbe33 !important;
                color: #ffffff;
            }
            .portfolioFilter a.current {
                background-color: #228bdf;
                color: #ffffff;
            }
            .thumb {
                background-color: #ffffff;
                border-radius: 3px;
                box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
                margin-top: 30px;
                padding-bottom: 10px;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 10px;
                width: 100%;
            }
            .thumb-img {
                border-radius: 2px;
                overflow: hidden;
                width: 100%;
            }
            .gal-detail h4 {
                margin: 16px auto 10px auto;
                width: 80%;
                white-space: nowrap;
                display: block;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .gal-detail .ga-border {
                height: 3px;
                width: 40px;
                background-color: #228bdf;
                margin: 10px auto;
            }




            .tabs-vertical-env .tab-content {
                background: #ffffff;
                display: table-cell;
                margin-bottom: 30px;
                padding: 30px;
                vertical-align: top;
            }
            .tabs-vertical-env .nav.tabs-vertical {
                display: table-cell;
                min-width: 120px;
                vertical-align: top;
                width: 150px;
            }
            .tabs-vertical-env .nav.tabs-vertical li.active > a {
                background-color: #ffffff;
                border: 0;
            }
            .tabs-vertical-env .nav.tabs-vertical li > a {
                color: #333333;
                text-align: center;
                font-family: 'Roboto', sans-serif;
                font-weight: 500;
                white-space: nowrap;
            }
            .nav.nav-tabs > li.active > a {
                background-color: #ffffff;
                border: 0;
            }
            .nav.nav-tabs > li > a {
                background-color: transparent;
                border-radius: 0;
                border: none;
                color: #333333 !important;
                cursor: pointer;
                line-height: 50px;
                font-weight: 500;
                padding-left: 20px;
                padding-right: 20px;
                font-family: 'Roboto', sans-serif;
            }
            .nav.nav-tabs > li > a:hover {
                color: #ffbe33 !important;
            }
            .nav.tabs-vertical > li > a {
                background-color: transparent;
                border-radius: 0;
                border: none;
                color: #333333 !important;
                cursor: pointer;
                line-height: 50px;
                padding-left: 20px;
                padding-right: 20px;
            }
            .nav.tabs-vertical > li > a:hover {
                color: #ffbe33 !important;
            }
            .tab-content {
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
                color: #777777;
            }
            .nav.nav-tabs > li:last-of-type a {
                margin-right: 0px;
            }
            .nav.nav-tabs {
                border-bottom: 0;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
            }
            .navtab-custom li {
                margin-bottom: -2px;
            }
            .navtab-custom li a {
                border-top: 2px solid transparent !important;
            }
            .navtab-custom li.active a {
                border-top: 2px solid #ffbe33 !important;
            }
            .nav-tab-left.navtab-custom li a {
                border: none !important;
                border-left: 2px solid transparent !important;
            }
            .nav-tab-left.navtab-custom li.active a {
                border-left: 2px solid #ffbe33 !important;
            }
            .nav-tab-right.navtab-custom li a {
                border: none !important;
                border-right: 2px solid transparent !important;
            }
            .nav-tab-right.navtab-custom li.active a {
                border-right: 2px solid #ffbe33 !important;
            }
            .nav-tabs.nav-justified > .active > a,
            .nav-tabs.nav-justified > .active > a:hover,
            .nav-tabs.nav-justified > .active > a:focus,
            .tabs-vertical-env .nav.tabs-vertical li.active > a {
                border: none;
            }
            .nav-tabs > li.active > a,
            .nav-tabs > li.active > a:focus,
            .nav-tabs > li.active > a:hover,
            .tabs-vertical > li.active > a,
            .tabs-vertical > li.active > a:focus,
            .tabs-vertical > li.active > a:hover {
                color: #ffbe33 !important;
            }

            .nav.nav-tabs + .tab-content {
                background: #ffffff;
                margin-bottom: 20px;
                padding: 20px;
            }
            .progress.progress-sm .progress-bar {
                font-size: 8px;
                line-height: 5px;
            }
        </style>

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

        <title> Hồ sơ - TDAT </title>

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

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>


    </head>

    <body class="sub_page">

        <div class="hero_area">
            <%@include file="../layout/header.jsp"%>
        </div>


        <br><br/>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="text-center card-box">
                        <div class="member-card">
                            <c:set var="u" value="${sessionScope.user}" />
                            <div class="thumb-xl member-thumb m-b-10 center-block">
                                <img src="${pageContext.request.contextPath}/assets/images/${u.avatar_path}" class="img-circle img-thumbnail" alt="profile-image">
                            </div>
                            <div class>
                                <h4 class="m-b-5">${u.username}</h4>

                            </div>
                            <div class="text-left m-t-40">
                                <p class="text-muted font-13"><strong>Tên: </strong> <span class="m-l-15"> ${ u.username}</span></p>
                                <p class="text-muted font-13"><strong>Giới tính:  </strong><span class="m-l-15">${ u.gender}</span></p>
                                <p class="text-muted font-13"><strong>Email: </strong><span class="m-l-15"> ${ u.email}</span></p>

                            </div>

                        </div>
                    </div> 
                </div> 
                <div class="col-md-8 col-lg-9">
                    <div class>
                        <div class>
                            <ul class="nav nav-tabs navtab-custom">

                                <li class="active">
                                    <a href="#profile" data-toggle="tab" aria-expanded="true">

                                        <span class="hidden-xs">Lịch sử mua hàng</span>
                                    </a>
                                </li>
                                <li class>
                                    <a href="#settings" data-toggle="tab" aria-expanded="false">
                                        <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                        <span class="hidden-xs">Thông tin người dùng</span>
                                    </a>
                                </li>
                                <li class>
                                    <a href="#changepassword" data-toggle="tab" aria-expanded="false">
                                        <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                        <span class="hidden-xs">Thay đổi mật khẩu</span>
                                    </a>
                                </li>
                                <li class>
                                    <a href="#useraddress" data-toggle="tab" aria-expanded="false">
                                        <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                        <span class="hidden-xs">Địa chỉ giao hàng</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">

                                <div class="tab-pane active" id="profile">

                                    <div class="modal-body">
                                        <table class="table table-image">
                                            <thead>
                                                <tr>                    
                                                    <th scope="col">Stt</th>
                                                    <th scope="col">Tổng tiền</th>
                                                    <th scope="col">Phương thức thanh toán</th>
                                                    <th scope="col">Ngày mua</th>
                                                    <th scope="col">Trạng thái</th>
                                                    <th scope="col">Thao tác</th>
                                                </tr>
                                            </thead>

                                            <c:set var="n" value="0"/>
                                            <c:forEach items="${sessionScope.listOu}" var="i">
                                                <tbody>
                                                    <tr>                                                     
                                                        <td>${n = n +1}</td>
                                                        <td>${i.total_price}₫</td>
                                                        <td>${i.payment}</td>
                                                        <td>${i.status}</td>
                                                        <td>${i.start_date}</td>

                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${i.status == 'Đang xử lý'}">
                                                                    <a class="btn btn-dark btn-sm"  href="./userordercontroller?query=${i.id}" >
                                                                        Xem
                                                                    </a>
                                                                    <a class="btn btn-danger btn-sm"  href="./userordercontroller?query=${i.id}" >
                                                                        Hủy
                                                                    </a>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <a class="btn btn-dark btn-sm"  href="./userordercontroller?query=${i.id}" >
                                                                        Xem
                                                                    </a>
                                                                </c:otherwise>
                                                            </c:choose> 

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>                                       

                                        </table>                                     
                                    </div>

                                </div>


                                <div class="tab-pane" id="settings">

                                    <form action="updateprofilecontroller" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="FullName">Tên tài khoản</label>
                                            <input type="text" name="username" value="${u.username}" id="name" class="form-control">
                                        </div>
                                        <c:set var="n1" value="0"/>
                                        <c:forEach items="${u.adress}" var="i">
                                            <div class="form-group">
                                                <label for="Email">Địa chỉ ${n1 = n1 +1}</label>
                                                <input type="text" value="${i}" id="address" class="form-control" disabled="">
                                            </div>
                                        </c:forEach>                                       

                                        <div class="form-group">
                                            <label for="Email">Năm sinh</label>
                                            <input type="number" value="${u.birth_year}" id="Email" class="form-control" disabled="">
                                        </div>

                                        <div class="form-group">
                                            <label for="Email">Email</label>
                                            <input type="email" value="${u.email}" id="Email" class="form-control" disabled="">
                                        </div>

                                        <div class="form-group">
                                            <label for="profilePicture">Ảnh đại diện</label>
                                            <input type="file" class="form-control-file" id="profilePicture" name="profilePicture" accept="image/*">                                           
                                        </div>      

                                        <button class="btn btn-primary waves-effect waves-light w-md" type="submit">Cập nhật</button>
                                    </form>

                                </div>
                                <div class="tab-pane" id="changepassword">

                                    <form action="resetpasswordcontroller" method="post">
                                        <div class="form-group">
                                            <label for="Password">Mật khẩu hiện tại</label>
                                            <input type="password" placeholder="Nhập mật khẩu để thay đổi" id="Password" name="current" class="form-control">
                                        </div>  
                                        <div class="form-group">
                                            <label for="password">Mật khẩu mới</label>
                                            <div class="password-input d-flex align-items-center">
                                                <input type="password" placeholder="Nhập mật khẩu để thay đổi" class="form-control mr-2" id="password" name="password" required>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirmPassword">Nhập lại mật khẩu mới</label>
                                            <div class="password-input d-flex align-items-center">
                                                <input type="password" placeholder="Nhập mật khẩu để thay đổi" class="form-control mr-2" id="confirmPassword" name="confirmPassword" required>

                                            </div>
                                        </div>

                                        <script>
                                            // Function to validate password match
                                            function validatePassword() {
                                                var password = document.getElementById("password");
                                                var confirmPassword = document.getElementById("confirmPassword");

                                                if (password.value !== confirmPassword.value) {
                                                    confirmPassword.setCustomValidity("Mật khẩu không khớp");
                                                } else {
                                                    confirmPassword.setCustomValidity('');
                                                }
                                            }


                                            document.getElementById("password").addEventListener("input", validatePassword);
                                            document.getElementById("confirmPassword").addEventListener("input", validatePassword);
                                        </script>                       

                                        <button class="btn btn-primary waves-effect waves-light w-md" type="submit">Thay đổi</button>
                                    </form>
                                </div>

                                <div class="tab-pane" id="useraddress">
                                    <div class="modal-body">
                                        <table class="table table-image">
                                            <thead>
                                                <tr>     
                                                    <th scope="col">Stt</th>   
                                                    <th scope="col">Địa chỉ</th>                                     
                                                    <th scope="col">Xóa</th>
                                                </tr>
                                            </thead>

                                            <c:set var="n" value="0"/>
                                            <c:forEach items="${u.adress}" var="i">
                                                <tbody>
                                                    <tr>                                                             
                                                        <td>${n = n +1}</td> 
                                                        <td>${i}</td> 
                                                        <td>
                                                            <a class="btn btn-danger btn-sm"  href="./deleteaddresscontroller?query=${n}" >
                                                                Xóa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>

                                        </table>                                     
                                    </div>

                                    <form action="updateaddresscontroller" method="post">
                                        <div class="form-group">
                                            <select class="form-control" id="city" name="city">
                                                <option value="" selected>Chọn tỉnh thành</option>           
                                            </select>

                                            <select class="form-control" id="district" name="district">
                                                <option value="" selected>Chọn quận huyện</option>
                                            </select>

                                            <select class="form-control" id="ward" name="ward">
                                                <option value="" selected>Chọn phường xã</option>
                                            </select>
                                        </div>  

                                        <div class="form-group">
                                            <label for="Password">Thêm địa chỉ cụ thể</label>
                                            <input type="text" placeholder="Nhập địa chỉ" id="" name="address" class="form-control">
                                        </div>
                                        <button class="btn btn-primary waves-effect waves-light w-md" type="submit">Thêm</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>

        </div>

        <br><br/>
        <br><br/>

        <%@include file="/views/layout/footer.jsp" %> 

        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">

        </script>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
                                            var citis = document.getElementById("city");
                                            var districts = document.getElementById("district");
                                            var wards = document.getElementById("ward");
                                            var Parameter = {
                                                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                                                method: "GET",
                                                responseType: "application/json",
                                            };
                                            var promise = axios(Parameter);
                                            promise.then(function (result) {
                                                renderCity(result.data);
                                            });

                                            function renderCity(data) {
                                                for (const x of data) {
                                                    var opt = document.createElement('option');
                                                    opt.value = x.Name;
                                                    opt.text = x.Name;
                                                    opt.setAttribute('data-id', x.Id);
                                                    citis.options.add(opt);
                                                }
                                                citis.onchange = function () {
                                                    district.length = 1;
                                                    ward.length = 1;
                                                    if (this.options[this.selectedIndex].dataset.id != "") {
                                                        const result = data.filter(n => n.Id === this.options[this.selectedIndex].dataset.id);

                                                        for (const k of result[0].Districts) {
                                                            var opt = document.createElement('option');
                                                            opt.value = k.Name;
                                                            opt.text = k.Name;
                                                            opt.setAttribute('data-id', k.Id);
                                                            district.options.add(opt);
                                                        }
                                                    }
                                                };
                                                district.onchange = function () {
                                                    ward.length = 1;
                                                    const dataCity = data.filter((n) => n.Id === citis.options[citis.selectedIndex].dataset.id);
                                                    if (this.options[this.selectedIndex].dataset.id != "") {
                                                        const dataWards = dataCity[0].Districts.filter(n => n.Id === this.options[this.selectedIndex].dataset.id)[0].Wards;

                                                        for (const w of dataWards) {
                                                            var opt = document.createElement('option');
                                                            opt.value = w.Name;
                                                            opt.text = w.Name;
                                                            opt.setAttribute('data-id', w.Id);
                                                            wards.options.add(opt);
                                                        }
                                                    }
                                                };
                                            }
</script>