<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile page</title>
        <link rel="stylesheet" href="styleProfile.css">
    </head>
    
    <%
        String  name, email, password, headquaters, type, founded, founder, chairman, ceo, revenue, status;
        final int foreignkey=(Integer)request.getAttribute("foreignkey");
        //final String emailofcompany=(String)request.getAttribute("email");
       // int foreignkey1=Integer.parseInt(request.getParameter("foreignkey1"));
       // final int foreignkey2 = Integer.parseInt(request.getParameter("foreignkeyfromProfilePage"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus", "root", null);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from allcompanies where serialno='"+foreignkey+"'");
            while (rs.next()) {
                //srno = Integer.toString(rs.getInt(1));
                name = rs.getString(2);
                email = rs.getString(3);
                password = rs.getString(4);
                headquaters = rs.getString(5);
                type = rs.getString(6);
                founded = rs.getString(7);
                founder = rs.getString(8);
                chairman = rs.getString(9);
                ceo = rs.getString(10);
                revenue = rs.getString(11);
                status=rs.getString(13);
    %>
  <div class="lnk"> <p align="center">
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=profile.jsp">PROFILE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=CandidateEvaluation.jsp">EVALUATE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=show.jsp">CANDIDATES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=fireemp.jsp">DISCARD</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=MailSender.jsp">MAIL</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=UpdateProfile.jsp">UPDATE PROFILE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=LoginPage1.jsp">LOG OUT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  
   </p>
  </div>
    <br>
    <div class="rotate">
    <img src="LogoLoader?foreignkey=<%=foreignkey%>" align="left" border= "10px black" class="logo">
    </div>
    <br>
    <div class="image"><img src="ImageLoader?foreignkey=<%=foreignkey%>" width="400" height="300" align="right" border="10px solid black" border-radius="600px"></div>
    <div class="name"><%=name%></div>
    <div class="status"><%=status%></div>
 
<table style="width: 50%;" >
    <tr><th align="left">Type</th> <td><%=type%></td></tr>
    <tr><th align="left">Founded</th> <td><%=founded%></td></tr>
    <tr><th align="left">Founder</th> <td><%=founder%></td></tr>
    <tr><th align="left">Headquarters</th> <td><%=headquaters%></td></tr>
    <tr><th align="left">Chairman</th> <td><%=chairman%></td></tr>
    <tr><th align="left">CEO</th> <td><%=ceo%></td></tr>
    <tr><th align="left">Revenue</th><td><%=revenue%></td></tr>
</table>
    <% }
            } catch (Exception e) {
            }
        %>
</html>
