<%-- 
    Document   : Setting
    Created on : Apr 10, 2019, 6:53:04 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
             final int foreignkey=(Integer)request.getAttribute("foreignkey");
        %>
      <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=UpdateProfile.jsp">UPDATE PROFILE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    </a>
    <body>
       
    </body>
</html>
