<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <% String inputUsername = request.getParameter("username"); %> 
    <% String inputPassword = request.getParameter("password"); %> 

<%@ page import="java.sql.*" %>
        <% Connection
            conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/webshopdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"
            , "root" , "xxxx" ); Statement stmt=conn.createStatement();  %>
        <%
        try{
        String sqlStr = "select passwrd from customers where username= \"" + inputUsername + "\";" ;
        ResultSet rset = stmt.executeQuery(sqlStr);
        rset.next();
        String password = rset.getString("passwrd");
        if (!password.equals(inputPassword)){
            response.sendRedirect("login.jsp?=logInFailure");
        }
        }
        catch(Exception e) {
            response.sendRedirect("login.jsp?=logInFailure");
        }
       
%>

<% 
%>

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

<body>
    <div class="header2">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" onclick="location.href='index.html';">
                </div>

                <nav>
                    <ul>
                        <li onclick="location.href='index.html';"> Home</li>
                        <li onclick="location.href='products.html';"> Products</li>
                        <li onclick="location.href='login.html';"> Account </li>
                    </ul>
                </nav>
                <img src="images/cart.png" width="30px" height="30px" onclick="location.href='cart.jsp';">
            </div>
        </div>



    </div>


    <div class="orders">
        <div class="small-container-2">
            <div class="left-container">
                <h1 class="ordersTitle"> Your orders </h1>
                <div class="orderList">
                    <ul>
                        <il class="order">
                            <div class="orderContainer">
                                <img src="images/product-4.jpg" alt="">
                                <h4> Red-Printed TShirt</h4>

                                <p> $50.00 </p>

                                <p> Qty: 1</p>
                            </div>
                        </il>
                    </ul>
                </div>
            </div>
            <div class="right-container">
                <h1> Perks</h1>
                <h3> Points: 100 </h3>
                <h3> Coupons: </h3>
               <div class="coupon">
                <p>
                    Free Delivery for orders over $100
                </p>
                <button class="useCoupon"> Use Coupon</button>
               </div>
            
           </div>
        </div>
    </div>
    





</body>

</html>


</body>
</html>