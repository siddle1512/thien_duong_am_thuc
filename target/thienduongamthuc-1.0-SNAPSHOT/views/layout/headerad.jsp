<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.siddle.thegoiamthuc.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="" id="home">
    <nav class="navbar navbar-expand-xl">
        <div class="container h-100">
            <a class="navbar-brand" href="./adindexcontroller">
                <h1 class="tm-site-title mb-0">Admin - TDAT</h1>
            </a>
            <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars tm-nav-icon"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto h-100">
                    <li class="nav-item">
                        <a class="nav-link" href="./adindexcontroller">
                            Trang chủ
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <span>
                                Kiểm tra
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="./adstatuscheckcontroller">Xác nhận đơn hàng</a>                       

                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">                              
                            <span>
                                Món ăn
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="./adlistfooditemcontroller">Danh sách món ăn</a>
                            <a class="dropdown-item" href="./adaddcontroller">Thêm móna ăn</a>

                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link d-block" href="./logoutcontroller">
                            Admin - <b>Thoát</b>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
