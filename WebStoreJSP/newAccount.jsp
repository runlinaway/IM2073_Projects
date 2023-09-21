<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <title> WebShop </title>
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400;1,600;1,700&display=swap"
        rel="stylesheet">
    <script src="https://use.fontawesome.com/1c3ff7f28d.js"></script>

</head>
<%@ page import="java.sql.*" %>
        <% Connection
            conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/webshopdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"
            , "root" , "xxxx" ); Statement stmt=conn.createStatement();  %>

<body>
    <div class="header2">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" onclick="location.href='index.jsp';">
                </div>




                <nav>
                    <ul>
                        <li onclick="location.href='index.jsp';"> Home</li>
                        <li onclick="location.href='products.jsp';"> Products</li>
                        <li onclick="location.href='login.jsp';"> Account </li>
                    </ul>
                </nav>
                <img src="images/cart.png" width="30px" height="30px" onclick="location.href='cart.jsp';">
            </div>


        </div>

    </div>
    <div class="container2"  >

        <div class="newAccountPanel">
            <form action="newAccountProcess.jsp" method="post"> 
            <label for="usernameNew">User Name:</label><br>
            <input type="text" id="usernameNew" name="usernameNew"><br>
            <label for="email">Email</label><br>
            <input type="text" name="email" id="email">
            <br>
            <label for="passwordNew">Password: </label><br>
            <input type="text" id="passwordNew" name="passwordNew">
            <br>
            <label for="phone">Phone: </label><br>
            <input type="text"  inputmode="numeric" id="phone" name="phone">
            <br>
            <label for="address">Address: </label><br>
            <input type="text" id="address" name="address">
     
            <br>
            <button style="margin-top:10px">Create new account </button>
            <br>
            <br>
            </form>
        </div>
    </div>
    </div>





</body>

</html>