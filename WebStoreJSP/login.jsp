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
    <div class="container2">

        <div class="login">
            <form action="myAccount.jsp" method="post">
                <label for="username">User Name: </label><br>
                <input type="text" name="username" /><br /><br />
                <label for="password">Password: </label><br>
                <input type="text" id="password" name="password">
                <br>
                <br>
                <input type="submit" value="login" />
                <br>
                <br>
                <p onclick="location.href='newAccount.jsp'"> New Account </p>
            </form>
            <% String str=request.getRequestURL()+"?"+request.getQueryString(); 
            try{ 
                String id=str.split("=")[1];
                if (id.equals("logInFailure")){ 
                    out.print("<div style=\"color:rgb(122, 2, 2)\"> Incorrect Password/UserName</div>");
        }
        if (id.equals("CreatedNewAccount")){ 
            out.print("<div style=\"white\"> New Account Created </div>");
        }

        }

        catch(Exception e){

        }
        %>
    </div>
    </div>
    </div>

    

</body>

</html>