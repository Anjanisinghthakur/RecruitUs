<%-- 
    Document   : RegistrationPage
    Created on : Mar 22, 2019, 8:13:55 AM
    Author     : hp
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Register</title>
         <link rel="stylesheet" href="styleRegistrationPage.css">
    </head>
    <body>
      <div class="register-box">
      <h1>Register Here</h1>
      <form action="RegistrationServer" method="post" enctype="multipart/form-data" onsubmit="return validateLogin()"/>
        <label>Company's Name</label>
        <input type="text" name="name" placeholder="Enter Company's Name here"><br><br>
        <label>Email</label>
        <input type="text" name="email" placeholder="Enter Company's Email here"><br>
            <span style="color:red;"><br>${errMsg}</span><br><br>
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your Password here"><br><br>
        <label>Headquarters</label>
        <input type="text" name="headquarters" placeholder="Enter your Location here"><br><br>
        <label>Type</label>
        <input type="text" name="type" placeholder="Enter Company Type here"><br><br>
        <label>Founder</label>
        <input type="text" name="founder" placeholder="Enter the Foundre's name here"><br><br>
        <label>Founded On</label>
        <input type="text" name="founded" placeholder="Enter Foundation year here"><br><br>
        <label>CEO</label>
        <input type="text" name="ceo" placeholder="Enter CEO's name here"><br><br>
        <label>Chairman</label>
        <input type="text" name="chairman" placeholder="Enter Chairman's name here"><br><br>
        <label>Revenue generated</label>
        <input type="text" name="revenue" placeholder="Enter Chairman's name here"><br><br>
        <label>Short Description/Status </label>
        <textarea name="status" rows="8" cols="80" placeholder="Enter Company's description here"></textarea><br><br>
        <label>Profile Photo</label><br>
        <input type="file" name="photo" value="Select a Photo"><br><br><br>
        <label>Company's Logo</label><br>
        <input type="file" name="logo" value="Select a Photo" background="blue"><br><br><br>
        <input type="submit" name="submit" value="Register"/><br><br>
        <a class="link" href="LoginPage1.jsp">Login</a>
      </form>
    </div>
  </body>
</html>

