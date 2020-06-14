/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/UpdatePassword"})
public class UpdatePassword extends HttpServlet {

    private Connection con;
    private Statement st;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(true);
        String email=null;
        int foreignkey=0;
        email=(String)request.getSession().getAttribute("email");
        foreignkey=(int)request.getSession().getAttribute("foreignkey");
        String newpassword=request.getParameter("pass");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
            st=con.createStatement();
            int i=st.executeUpdate("update allcompanies set password='"+newpassword+"' where serialno='"+foreignkey+"' and email='"+email+"'");
            if(i>0)
            {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Password Changed! Get back to Login Page');");
                        out.println("location='LoginPage1.jsp';");
                        out.println("</script>");
            }
            else
            {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('OOPS! Error occurred, Enter Password Again ');");
                        out.println("location='NewPassword.jsp';");
                        out.println("</script>");
                
            }
        out.print(newpassword);
        out.print(email);
        out.print(foreignkey);
        }
        catch(Exception ex)
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('OOPS! Error occurred, Enter Password Again '"+ex+"');");
            out.println("location='NewPassword.jsp';");
            out.println("</script>");
        }
       
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
