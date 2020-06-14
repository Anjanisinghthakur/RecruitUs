<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%><%-- 
    Document   : MailSender
    Created on : Feb 23, 2019, 8:06:39 AM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mail Sender</title>
        <link rel="stylesheet" href="styleMailSender.css">
    </head>
    <%
    final int foreignkey=(Integer)request.getAttribute("foreignkey");%>
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
    <img src="LogoLoader?foreignkey=<%=foreignkey%>" class="image" width="50px" height="50px" border="5px solid black" align="center" border="10px black" border-radius="600px">
    <body>
        
        <div class="box">
            <h2>Send Mail</h2><br><br>
        <form action="SendMail" method="processRequest">
            <div class="emailinputBox">
                <input type="text" name="mail">
                <label>Candidate's Email</label>
            </div>
                <br><br>
                <div class="nameinputBox">
                <input type="text" name="name">
                <label>Candidate's Name</label>
               <span style="color:red;"><br>${errMsg}</span>
           </div>
           <div class="button" align="center">  
           <input type="hidden" name="foreignkey" value="<%=foreignkey%>"/>
             <input type='submit' name="submit" value="Send">
           </div>    
        </form>  
        </div>
    </body>
</html>
