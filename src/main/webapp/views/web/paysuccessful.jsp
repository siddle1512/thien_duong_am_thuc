<%@page import="fu.siddle.thegoiamthuc.model.Fooditem"%>
<%@page import="fu.siddle.thegoiamthuc.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>TDAT - Thanh toán thành công</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 50px;
            }
            .success-message {
                font-size: 24px;
                color: green;
                margin-bottom: 20px;
            }
            .go-back-button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                text-decoration: none;
            }
            .go-back-button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="success-message">
            <p>Bạn đã thanh toán thành công!</p>
        </div>
        <a href="./indexcontroller" class="go-back-button">Trở về</a>
    </body>
</html>
