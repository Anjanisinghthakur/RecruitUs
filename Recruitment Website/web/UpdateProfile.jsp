<%-- 
    Document   : UpdateProfile
    Created on : Apr 10, 2019, 6:57:58 AM
    Author     : hp
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link rel="stylesheet" href="styleUpdate.css">
    <%
    final int foreignkey = (int) request.getAttribute("foreignkey");
    %>
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
    <img src="LogoLoader?foreignkey=<%=foreignkey%>" class="image" width="50px" height="50px" border="5px solid black" align="center"> 
    <%
        String name="", headquarters="", type="", founded="", founder="", chairman="", ceo="", revenue="", status="";
   
     try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus", "root", null);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from allcompanies where serialno='"+foreignkey+"'");  
            while(rs.next())
            {
               name=rs.getString(2);
               headquarters=rs.getString(5);
               type=rs.getString(6); 
               founded=rs.getString(7);
               founder=rs.getString(8);
               chairman=rs.getString(9);
               ceo=rs.getString(10);
               revenue=rs.getString(11);
               status=rs.getString(13);
                
            }
            }
     catch(Exception ex)
     {
         
     }
    %> 
    <body>
        <div class="updatebox">
        <form action="ServertoUpdateProfile" method="post">
            <h1><p align="center">Update Here</p></h1>
        <br><label>Company's Name</label>
        <input type="text" name="name" value="<%=name%>" placeholder="Enter Company's Name here"><br><br>
        <label>Headquarters</label>
        <input type="text" name="headquarters" value="<%=headquarters%>" placeholder="Enter your Location here"><br><br>
        <label>Type</label>
        <input type="text" name="type" value="<%=type%>" placeholder="Enter Company Type here"><br><br>
        <label>Founder</label>
        <input type="text" name="founder" value="<%=founder%>" placeholder="Enter the Foundre's name here"><br><br>
        <label>Founded On</label>
        <input type="text" name="founded" value="<%=founded%>" placeholder="Enter Foundation year here"><br><br>
        <label>CEO</label>
        <input type="text" name="ceo" value="<%=ceo%>" placeholder="Enter CEO's name here"><br><br>
        <label>Chairman</label>
        <input type="text" name="chairman" value="<%=chairman%>" placeholder="Enter Chairman's name here"><br><br>
        <label>Revenue generated</label>
        <input type="text" name="revenue" value="<%=revenue%>" placeholder="Enter Chairman's name here"><br><br>
        <label>Short Description/Status</label>
        <input type="text" name="status" value="<%=status%>" placeholder="Enter Chairman's name here"><br><br>
        <input type="hidden" name="foreignkey" value="<%=foreignkey%>"/>
             <input type='submit' name="submit" value="Update">
        <a class="link" href="LoginPage1.jsp">Login</a>
      </form>
    </div>
    </body>
</html>
