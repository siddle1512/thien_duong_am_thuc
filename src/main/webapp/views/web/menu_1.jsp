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

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    </head>

    <body class="sub_page">
        <div class="hero_area">
            <%@include file="../layout/header.jsp"%>
        </div>

        <!-- food section -->
        <section class="food_section layout_padding">
            <div class="container">

                <div class="heading_container heading_center">
                    <h2>
                        Thể loại các món
                    </h2>
                </div>

                <br><br/>



                <ul class="filters_menu">
                  
                        <a href="./menucontroller" class="pagination-link">Tất cả</a>
                   

                    <c:set var="c" value="${sessionScope.listcate}"/>
                    <c:forEach items="${c}" var="i">


                        <a href="./categorycontroller?id=${i.id}" class="pagination-link ${cid == i.id? 'active' : ''}">${i.name}</a>


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

                    <!--handle paging-->
                    <c:set var="currentPage" value="${requestScope.active == null? '1' : requestScope.active}" />
                    <c:set var="totalPages" value="${sessionScope.endPage}" />
                    <c:set var="pagesToShow" value="${1}" /> 

                    <c:set var="startPage" value="${requestScope.active == null? '1' : requestScope.active}" />
                    <c:set var="endPage" value="${(currentPage + pagesToShow < totalPages) ? currentPage + pagesToShow : totalPages}" />

                    <c:if test="${currentPage > 1}">
                        <a href="./endpagecatecontroller?id=${1}" class="pagination-link">«</a>
                        <a href="./endpagecatecontroller?id=${currentPage - 1}" class="pagination-link">‹</a> 
                    </c:if>

                    <c:forEach begin="${startPage-1 <= 0? startPage: startPage-1}" end="${endPage}" var="i">
                        <c:choose>
                            <c:when test="${i <= totalPages}">
                                <a href="./endpagecatecontroller?id=${i}" class="pagination-link ${currentPage == i ? 'active' : ''}">${i}</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a href="./endpagecatecontroller?id=${currentPage + 1}" class="pagination-link">›</a>
                    </c:if>

                    <c:if test="${endPage < totalPages}">

                        <a href="./endpagecatecontroller?id=${totalPages}" class="pagination-link">»</a>
                    </c:if>

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