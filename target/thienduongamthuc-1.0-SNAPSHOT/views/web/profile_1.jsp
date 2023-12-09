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

                                <li class="">
                                    <a href="./profilecontroller" >
                                        <span class="hidden-xs">Quay lại</span>
                                    </a>
                                </li>

                                <li class="active">
                                    <a href="#profile" data-toggle="tab" aria-expanded="true">

                                        <span class="hidden-xs">Chi tiết đơn hàng</span>
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
                                                    <th scope="col">Món ăn</th>
                                                    <th scope="col">Số lượng</th>
                                                

                                                </tr>
                                            </thead>

                                            <c:set var="n" value="0"/>
                                            <c:forEach items="${sessionScope.listOdata}" var="i">
                                                <tbody>
                                                    <tr>                                                     
                                                        <td>${n = n +1}</td>
                                                   
                                                        <td>${i.foodname}</td>
                                                        <td>${i.amout}</td>                                                       
                                                    </tr>
                                                </tbody>
                                            </c:forEach>

                                        </table>                                     
                                    </div>
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