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
           </head>
           <style>
               body{
                   margin: 30%;
               }
               
               .link{
                   color: black;
                   font-weight: normal;
                   text-decoration: none;
               }
               
               .link hover{
                   color: red;
                   font-weight: bold;
                   text-decoration: underline;
               }
           </style>
           <body> 
               <%
    final int foreignkey = (int) request.getAttribute("foreignkey");
    final String email = (String)request.getAttribute("email");
   
     try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus", "root", null);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select email from allcompanies where serialno='"+foreignkey+"'");            //while(rs.next())           
     }
     catch(Exception ex)
     {
         
     }
    %>
    <a href="SendAuthno?foreignkey=<%=foreignkey%>&email=<%=email%>" class="link">Click on link to send you authentication number</a>      
           </body>
           </html>
          
    