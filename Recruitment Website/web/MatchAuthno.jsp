<!--<%--
    Document   : MatchAuthno
    Created on : Mar 17, 2019, 11:01:39 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

      <h1 align="center">Enter your Authentication Number</h1>
    <p align="center">  A unique Authentication Number is sent on your mail for your request to change the password.<br> Please enter that Authentication Number here.
    </p>
    <link rel="stylesheet" href="styleNewPassword.css">
    <body>
      <div class="box">
        <form action="MatchAuthnoServer" method="post" onsubmit="return validateLogin()">
          <%
                final String email = (String) request.getAttribute("email");
                final int foreignkey = (int) request.getAttribute("foreignkey");
            %>
            
            <%=email%>
        <label>Authentication Number</label>
        <input type="text" name="otp" placeholder="Enter Authentication number here"><br>
      <%
            session.setAttribute("email", email);
            session.setAttribute("foreignkey", foreignkey);
            %>
        <input type="submit" name="submit" value="Submit">
        <span style="color:red;"><br>${errMsg}</span>
     </form>
     </div>
    </body>
</html>
