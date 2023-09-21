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
    
    <%@ page import = "java.sql.*" %>
           <%
           Connection conn = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/webshopdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
               "root", "xxxx");

               Statement stmt = conn.createStatement();
               String sqlStr = "select* from products" + " where qty > 0 order by rating desc";
              %>
    <div class="header2">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px" >
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
                        <li onclick="location.href='login.jsp';"> Account </li>
                    </ul>
                </nav>
                <img src="images/cart.png" width="30px" height="30px" onclick="location.href='cart.jsp';">
            </div>
        </div>


    </div>
    <div class="small-container">
        <div class="productsHeader">
            <h1 class="productsPageTitle"> All Products </h1>
            
            <div class="selectionPanel">
                <form method="get">
                <input type="checkbox" id="vehicle1" name="checkbox1" value="checkbox1">
                <label for="checkbox1"> Checkbox 1 </label>
                <input type="checkbox" id="vehicle2" name="checkbox1" value="checkbox1">
                <label for="checkbox1"> Checkbox 2</label> <!--Place Holder!-->
                
                <select name="Brand" id="Brand">
                    <option value="Brand">Brand</option>
                    <option value="Patek Phillipe">Patek Phillipe</option>
                    <option value="Rolex">Rolex</option>
                    <option value="Vacheron Constantin">Vacheron Constantin</option>
                    <option value="Audemars Piguet">Audemars Piguet</option>
                   
                </select>


                <select name="sortBy" id="sortBy" class="sortBy">
                    <option value="sortBy">Sort By</option>
                    <option value="Name (ASC)">Name (ASC)</option>
                    <option value="Name (DESC)">Name (DESC)</option>
                    
                    <option value="Price">Price</option>
                    <option value="Rating">Rating</option>
                </select>

                <input type="submit" value="Search" />
                </form>
            </div>
        </div>

        <div class="row">
            <%
                String[] brand = request.getParameterValues("Brand");
                String[] sortBy = request.getParameterValues("sortBy");
                if (brand != null&&sortBy != null) {
            %>
        
        
            <%

            if (request.getParameter("sortBy").equals("Name (ASC)")){
                sqlStr = "select* from products where brand =" + "'" +request.getParameter("Brand")+"'"+" and qty > 0 order by model asc";
            
            }
            else if(request.getParameter("sortBy").equals("Name (DESC)")){
                sqlStr = "select* from products where brand =" + "'" +request.getParameter("Brand")+"'"+" and qty > 0 order by model desc";
            }
            else if(request.getParameter("sortBy").equals("Price")){
                sqlStr = "select* from products where brand =" + "'" +request.getParameter("Brand")+"'"+" and qty > 0 order by price asc";
            }
            else if(request.getParameter("sortBy").equals("Rating")){
                sqlStr = "select* from products where brand =" + "'" +request.getParameter("Brand")+"'"+" and qty > 0 order by rating desc";
            }
            else{
                sqlStr = "select* from products" + " where qty > 0 order by rating desc";
            }
            
        %>
        <%}%>
            <%
                ResultSet rset = stmt.executeQuery(sqlStr);
                while (rset.next()) {
                int id = rset.getInt("id");
                
            %>
            <div class="col-4">
                
                <button style=" border:hidden" onclick='location.href= "product.jsp?id=<%= rset.getInt("id")%>";'>
                
                    
                    <img src= <%= rset.getString("imgsrc") %> alt="">
                 </button>
                
               
                
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