<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    <%
        //private Connection con;
         //private Statement ps;
 
        int foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus", "root", null);
            String query="delete from table2 where foreignkey='"+foreignkey+"'";
            Statement st=con.createStatement();
            int c =st.executeUpdate(query);
            if(c==1)
            {
           //HttpSession s=request.getSession();
           request.setAttribute("foreignkey",foreignkey);
           RequestDispatcher rd=request.getRequestDispatcher("show.jsp");
           rd.forward(request,response);
            }
            else
            {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('No Candidates Available');");
                        request.setAttribute("foreignkey",foreignkey);
                        RequestDispatcher rd=request.getRequestDispatcher("show.jsp");
                        rd.forward(request,response);
                        //out.println("location='show.jsp';");
                        //out.println("</script>");
           //HttpSession s=request.getSession();
           //response.sendRedirect("show.jsp");
                
            }
            
        }
        catch(Exception e)
        {
            %>
            <%=e%><%
        }
        %>
        