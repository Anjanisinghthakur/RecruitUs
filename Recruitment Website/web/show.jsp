<%-- 

    Document   : show
    Created on : Jan 26, 2019, 7:26:57 AM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates</title>
    </head>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    int totalnumberofcandidates=0;
    final int foreignkey=(Integer)request.getAttribute("foreignkey");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null); 
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from table2 where foreignkey='"+foreignkey+"' order by total desc");%>
    
    <div class="lnk">
    <p align="center">
        
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=profile.jsp">PROFILE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=CandidateEvaluation.jsp">EVALUATE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=show.jsp">CANDIDATES</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;   
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=fireemp.jsp">DISCARD</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=MailSender.jsp">MAIL</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=UpdateProfile.jsp">UPDATE PROFILE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <a class="link" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=LoginPage1.jsp">LOG OUT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </p>
    </div>
    <img src="LogoLoader?foreignkey=<%=foreignkey%>"  class="image" align="center" height=50px" width="50px" border="5px black">
     <br><a class="plink" href="ServerforForeignkey?foreignkey=<%=foreignkey%>&nameofjsppage=DeleteAll.jsp">Delete all the candidates</a>
     <br><br><a class="plink" href="SendMailtoALL?foreignkey=<%=foreignkey%>" >Send Joining Mail to all candidates</a>
    <style>
        body
        {
          background: url(bground2.jpg);
          background-size: cover;
          margin: 0;
        }
        table th,td
        {
            border: 2px solid black;
        }
        table th{
            color: blue;
        }

        
.link
{
   color: cyan;
  text-shadow:-1px -1px 0 #000,1px -1px 0 #000, -1px 1px 0 #000,1px 1px 0 #000;
  text-decoration: none;
  font-weight: bold;
  font-family: serif;
  font-size: 20px;

}

.link:hover
{
  color: mediumorchid;
  background: cyan;
  
}

.lnk
{
  color: mediumorchid;
  background: cyan;
  background: rgb(0,0,156);
  width: 100%;
  height:100%;
  top: 100%;
  padding: 10px;
}

.plink
{
    font-size: 20px;
    text-decoration: none;
    color: black;
    margin: 50px;
}

.plink:hover
{
    font-style: italic;
    text-decoration: underline;
    color: blue;
    
}

.total
{
    font-size: 20px;
    padding-left: 30px;
}
.image{
            margin-top: -100px; 
            margin-left: 10px;
            border-radius: 50%;
            -webkit-transition-duration: 0.8s;
            -moz-transition-duration: 0.8s;
            -o-transition-duration: 0.8s;
            
            -webkit-transition-property: -webkit-transform;
            -moz-transition-property: -moz-transform;
            -o-transition-property: -o-transform;
            transition-property: transform;
            overflow: hidden;
        }
        
        .image:hover{
       
            -webkit-transform: rotate(360deg);
            -moz-transform: rotate(360deg);
            -o-transform: rotate(360deg);
        }
      


</style>
    


    
   <br><br><br><br><br><table class="table" cellpadding="13" align="center">
    <tr>
        <th>Email</th>
        <th>Name</th>
        <th>Contact Number</th>
        <th>Technical Skills</th>
        <th>Management Skills</th>    
        <th>Communication Skills</th>    
        <th>Academics</th>    
        <th>Total</th>    
        <th>Remarks</th>    
    </tr>
  
   <% while(rs.next())
    {
        totalnumberofcandidates++;
    %>
    <tr>
        <td><p align="center"><%=rs.getString(1)%></td>
        <td><p align="center"><%=rs.getString(2)%></td>
        <td><p align="center"><%=rs.getString(3)%></td>
        <td><p align="center"><%=rs.getString(4)%></td>
        <td><p align="center"><%=rs.getString(5)%></td>
        <td><p align="center"><%=rs.getString(6)%></td>
        <td><p align="center"><%=rs.getString(7)%></td>
        <td><p align="center"><%=rs.getString(8)%></td>
        <td><p align="center"><%=rs.getString(9)%></td>
        <%
        }
        %>
        </table>
        <% if(totalnumberofcandidates==0)
        { %>
        You don't have any candidates yet
        <%
            }
        else{
%>
<div class="total"><br><br>Total Number of candidates: <%=totalnumberofcandidates%></div>
        <%
            }%>
       </body>
</html>

