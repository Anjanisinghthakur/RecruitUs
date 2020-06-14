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
    <link rel="stylesheet" href="styleNewPassword.css">
    <body>
      <div class="box">
        <form action="UpdatePassword" method="post" onsubmit="return validateLogin()" >
          <%
                final int foreignkey=(int)request.getAttribute("foreignkey");
                final String email=(String)request.getAttribute("email");
                session.setAttribute("foreignkey", foreignkey);
                session.setAttribute("email", email);
                %>
                
                <%=email%><br>
        <label>Enter new password</label>
        <input type="text" name="pass" placeholder="Enter password here">
        <input type="submit" name="submit" value="Change">
        <span style="color:red;"><br>${errMsg}</span>
        </form>
        </div>
    </body>
</html>
