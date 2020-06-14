<%-- 
    Document   : fireemp
    Created on : Jan 26, 2019, 1:35:49 PM
    Author     : hp
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Candidates</title>
        <link rel="stylesheet" href="styleDeleteCandidates.css">
    </head>
    <% final int foreignkey=(Integer)request.getAttribute("foreignkey");%>
    <div class="lnk">
    <p align="center">
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=profile.jsp">PROFILE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=CandidateEvaluation.jsp">EVALUATE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=show.jsp">CANDIDATES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=fireemp.jsp">DISCARD</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=MailSender.jsp">MAIL</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=UpdateProfile.jsp">UPDATE PROFILE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=LoginPage1.jsp">LOG OUT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     </p></div>
     <<img src="LogoLoader?foreignkey=<%=foreignkey%>"  class="image" width="50px" height="50px" align="center" border="5px solid black">
    <body>
        <div class="box">
        <h2>Discard a Candidate</h2><br><br>
        <form action="Delete" action="post" onsubmit="return validateLogin()">
            <%%>
            <div class="inputBox">
            <input type="text" name="email">
            <label>Enter E-mail</label>
            </div>
            <div class="button" align="center">  
            <input type="hidden" name="foreignkey" value="<%=foreignkey%>"/>
             <input type='submit' name="submit" value="Discard">
            </div>
            <span style="color:red;"><br>${errMsg}</span>
        </form>  
        </div>
        </body>          
        </html>
