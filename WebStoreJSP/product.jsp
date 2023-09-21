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
    <%@ page import="java.sql.*" %>
        <% Connection
            conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/webshopdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"
            , "root" , "xxxx" ); Statement stmt=conn.createStatement();  %>
        <%
        String str=request.getRequestURL()+"?"+request.getQueryString();
        String id = str.split("=")[1];
%>


       
    <div class=" header2">
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
                            <% String sqlStr = "SELECT * from PRODUCTS where id =" + id + "" ; %>
                            <%
                            ResultSet rset = stmt.executeQuery(sqlStr);
                            rset.next();
                        %>


                                <div class="small-container">
                                    <div class="productSite">
                                        <div class="imgPanel">
                                            <img src="images/buy-1.jpg" class="product-img">
                                            <img src="images/buy-1.jpg " class="product-img">
                                            <img src="images/buy-3.jpg" class="product-img">
                                            <img src="images/buy-1.jpg" class="product-img">
                                        </div>
                                        <div class="mainImage" style="width:50%">
                                            <img src= <%= rset.getString("imgsrc") %> alt="">
                                        </div>
                                        
                                        <div class="product-info" style="width:50%">
                                            <h1> <%= rset.getString("model") %></h1>
                                            <div class="rating">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            
                                            </div>
                                            <p> $<%= rset.getDouble("price") %> </p>
                                            <h3> $<%= rset.getString("About") %> </h3>

                                            <form method="POST">
                                                <input id ="qty" name="qty" type="text" placeholder="Quantity">
                                            
                                            <input type="submit" value="Add to Cart" />
                                            
                                         </form>   
                                            <%
                                            String qty=request.getParameter("qty");
                                            if (qty != null) {
                                                String sqlStr2 = "INSERT INTO cart (product_id, qty)" + " VALUES (" + id + ","+qty+")";
                                                int rowcount = stmt.executeUpdate(sqlStr2);
                                            }  
                                            %>

                                        </div>
                                    </div>


                                </div>







</body>

</html>