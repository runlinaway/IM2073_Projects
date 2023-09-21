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
    <link rel="stylesheet" type="text/css" href="style.css">
    <title> WebShop </title>
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400;1,600;1,700&display=swap"
        rel="stylesheet">
    <script src="https://use.fontawesome.com/1c3ff7f28d.js"></script>

</head>

<body>
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" onclick="location.href='index.jsp';">
                </div>

                <div class="search" style:"width: 100%" style="display: flex">
                   
                    <input type="text" placeholder="Search by Ref No.">
                    <br>
                    
                    <input type="submit" value="Search" style= "height: 30px;align-self:center">
                    
                </div>
                <nav>
                    <ul>
                        <li onclick="location.href='index.jsp';"> Home</li>
                        <li onclick="location.href='products.jsp';"> Products</li>
                        <li onclick="location.href='login.html';"> Account </li>
                    </ul>
                </nav>
                <img src="images/cart.png" width="30px" height="30px" onclick="location.href='cart.jsp';">
            </div>
        </div>
       
            <div class="row">
                <div class="col-2">
                    <h1> Find your Grail <br> With Us</h1>
                    <p> Luxury <br> For All </p>
                    <a href="" class="btn"> Our Collections </a>
                </div>
                <div class="col-2">
                    <img src="images/image1.webp" alt="">
                </div>
            </div>
        
    </div>
    <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!--featured categories -->
    <div class="categories">
        <div class="small-container">

            <div class="row">
                <div class="col-3">
                    <img src="images/category-1.png" alt="">
                </div>
                <div class="col-3">
                    <img src="images/category-2.webp" alt="">
                </div>
                <div class="col-3">
                    <img src="images/category-3.jpg" alt="">
                </div>
            </div>

        </div>
    </div>


    <!--featured products -->
    <%@ page import = "java.sql.*" %>
    <%
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/webshopdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
        "root", "xxxx");

        Statement stmt = conn.createStatement();
        String sqlStr = "select* from products where rating = 5"+" and qty > 0 order by model asc";
        ResultSet rset = stmt.executeQuery(sqlStr);
    %>
    
    <div class="small-container">
        <h2 class="title"> Featured Products </h2>
        <div class="row">
            
            <%
            while (rset.next()) {
            int id = rset.getInt("id");
            %>
            <div class="col-4">
                <img src= <%= rset.getString("imgsrc") %> alt="" onclick="location.href='product.jsp?id=<%= rset.getInt("id")%>';">
                <h4> <%= rset.getString("model") %></h4>
                <div class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star-o" aria-hidden="true"></i>

                </div>
                <p> $<%= rset.getDouble("price") %> </p>
            </div>
            <% }%>
            <%
                rset.close();
                stmt.close();
                conn.close();
    
            %>
        </div>
    </div>
</body>

</html>