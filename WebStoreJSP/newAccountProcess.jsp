
<% 

try{
    String username=request.getParameter("usernameNew"); 
String password=request.getParameter("passwordNew"); 
String passwordResubmit=request.getParameter("passwordResubmit"); 
String address=request.getParameter("address"); 
String email=request.getParameter("email"); 
int phone = Integer.parseInt(request.getParameter("phone"));


}


catch(Exception e){
    response.sendRedirect("newAccount.jsp");
}
String username=request.getParameter("usernameNew"); 
String password=request.getParameter("passwordNew"); 
String passwordResubmit=request.getParameter("passwordResubmit"); 
String address=request.getParameter("address"); 
String email=request.getParameter("email"); 
int phone = Integer.parseInt(request.getParameter("phone"));

%>

<%@ page import="java.sql.*" %>
        <% Connection
            conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/webshopdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"
            , "root" , "xxxx" ); Statement stmt=conn.createStatement();  %>


<% 
String sqlStr= "SELECT id FROM Customers ORDER BY id DESC LIMIT 1";
ResultSet rset = stmt.executeQuery(sqlStr);
rset.next();
int newID = rset.getInt("id") +1;
%>

<% 

String insertStr= "INSERT INTO customers (id, username, passwrd, address, phone, email) VALUES (" + Integer.toString(newID) + ",\"" + username + "\"" + ",\"" + password + "\"" + ",\" " + address + "\"" + ", " + Integer.toString(phone)  + ", \"" + email + "\"" +");";

long rowId = stmt.executeUpdate(insertStr);
out.print("Account Created! Redirecting to Login Page");

response.sendRedirect("login.jsp?id=CreatedNewAccount");

%>