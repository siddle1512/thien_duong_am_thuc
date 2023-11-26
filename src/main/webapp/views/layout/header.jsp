<%@page contentType="text/html" pageEncoding="UTF-8"%> 
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
                                                <th scope="col"></th>
                                                <th scope="col">Món ăn</th>
                                                <th scope="col">Giá</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Tổng</th>
                                                <th scope="col">Xóa</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="w-25">
                                                    <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/vans.png" class="img-fluid img-thumbnail" alt="Sheep">
                                                </td>
                                                <td>Gà rán</td>
                                                <td>35000₫</td>
                                                <td class="qty"><input type="text" class="form-control" id="input1" value="2"></td>
                                                <td>35000₫</td>
                                                <td>
                                                    <a href="#" class="btn btn-danger btn-sm">
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table> 
                                    <div class="d-flex justify-content-end">
                                        <h4><span class="price text-success">35000₫</span></h4>
                                    </div>
                                </div>
                                <div class="modal-footer border-top-0 d-flex justify-content-between">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success">Checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </li>
                    <%}%>          
                </ul>

            </div>
        </nav>
    </div>
</header>
<!-- end header section -->