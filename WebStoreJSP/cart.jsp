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

               Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
               ResultSet.CONCUR_UPDATABLE);
               Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
               ResultSet.CONCUR_UPDATABLE);
               String sqlStr = "SELECT cart.product_id, cart.qty, products.model, products.price, products.imgsrc FROM CART LEFT JOIN products ON cart.product_id = products.id";
              %>

              
              

              
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


    <div class="orders">
        <div class="small-container-2">
            <div class="left-container">
                <h1 class="ordersTitle"> Your orders </h1>
                <div class="orderList">
                    <ul>
                        <il class="order">
                <%
                ResultSet rset = stmt.executeQuery(sqlStr);
                int numval;
                while (rset.next()) {
                 %>
                 <div class="orderContainer">
                                <img src=<%= rset.getString("imgsrc") %> alt="">
                               <div class="orderText">
                                <h4> <%= rset.getString("model") %></h4>

                                <p> $<%= rset.getDouble("price") %> </p>

                                <p> Qty: <%= rset.getInt("qty") %></p>
                                <button>Remove From Cart</button>
                               </div>
                            </div><%}%>
                        </il>
                    </ul>
                </div>
            </div>

            
            <%
            rset.beforeFirst();
            double total=0;
            while (rset.next()){
                total+= rset.getDouble("price")*rset.getInt("qty");
            }
            %>
            
            <div class="right-container">
                <h1> Order Summary</h1>
                <h3> Subtotal : $<%=total%></h3>
                <h3> Delivery: $10 </h3>
                <h3> Total: $<%=total+10.0 %> </h3>
                <form method="POST">
                    <input type="hidden" id="checkedOut" name="checkedOut" value="1" />
                    <input type="submit" value="CheckOut" />

                </form>
                <% 
                
                String CheckOut=request.getParameter("checkedOut");
                    if (CheckOut != null) {
                        rset.beforeFirst();
                        while (rset.next()){
                         String sqlStr2 = "UPDATE products SET qty = qty-"+rset.getInt("qty")+" WHERE products.id = "+rset.getInt("product_id");
                          int rowcount = stmt2.executeUpdate(sqlStr2);
                        }
                    }
                    %>
                
           </div>
        </div>
    </div>
    





</body>

</html>