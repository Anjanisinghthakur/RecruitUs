<%-- 
    Document   : index
    Created on : Jan 26, 2019, 6:25:18 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evaluation page</title>
        <link rel="stylesheet" href="styleEvaluationPage (1).css">
    </head>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
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
     </p>
    </div>
  <img src="LogoLoader?foreignkey=<%=foreignkey%>" class="image" width="50px" height="50px" border="5px solid black" align="center">
    <body>
        <h1 class="HeadingMain" align="center">Candidate Evaluation</h1>
        <form action="Main" method="post" onsubmit="return validateLogin()" >
                    <div class="general" align="center">
                    <h2 class="Heading2">General Information</h2><br><br>
                    <label>Candidate Name</label><br>
                     <input type="text" name="candidateName" placeholder="Enter the Candidate's name here."><br><br><br>
                     <label>Candidate E-mail</label><br>
                     <input type="text" name="candidateEmail" placeholder="Enter the Candidate's e-mail here."><br>
                     <span style="color:red;"><br>${errMsg}</span><br><br><br>
                     <label>Candidate's Phone</label><br>
                     <input type="text" name="candidatePhone" placeholder="Enter the Candidate's phone number here."><br><br><br>
                </div>    
                <br>
            <div class="evaluate" align ="center">
            <h2 class="Heading2">Evaluate Here(Out of 10)</h2><br><br>
            <label>Technical Skills</label><br>
            <input type="text" name="technicalskills" placeholder="Enter marks here."><br>
            <span style="color:blue;"><br>${errMsg1}</span><br><br>
            <label>Management Skills</label><br>
            <input type="text" name="managementskills" placeholder="Enter marks here."><br>
            <span style="color:blue;"><br>${errMsg2}</span><br><br>
            <label>Communication Skills</label><br>
            <input type="text" name="communicationskills" placeholder="Enter marks here."><br>
            <span style="color:blue;"><br>${errMsg3}</span><br><br>
            <label>Academics</label><br>
            <input type="text" name="academics" placeholder="Enter marks here."><br>
            <span style="color:blue;"><br>${errMsg4}</span><br><br>
            <label>Remarks</label><br>
            <input name="remarks" name="remarks" placeholder="Give Remarks here"><br><br>
            <br>
            <div class="button" align="center">  
             <input type="hidden" name="foreignkey" value="<%=foreignkey%>"/>
             <input type='submit' name="submit" value="submit">
           </div>
        </form>
    </body>

