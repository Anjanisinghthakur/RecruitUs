/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
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
@WebServlet(urlPatterns = {"/MatchAuthnoServer"})
public class MatchAuthnoServer extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(true);
        String otp1=request.getParameter("otp");
        int otp;
        otp=Integer.parseInt(otp1);
        String email=null;
        int foreignkey=0;
        email=(String)request.getSession().getAttribute("email");
        foreignkey=(int)request.getSession().getAttribute("foreignkey");
        out.println(email);
        out.println(foreignkey);
        out.println(otp);
        int authfromdatabase;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
            st=con.createStatement();
            ResultSet rs =st.executeQuery("select serialno from allcompanies  where email='"+email+"'" );
            while(rs.next())
            {
                authfromdatabase=rs.getInt(1);
                authfromdatabase=authfromdatabase+462589;
                if(authfromdatabase==otp)
                {
                    //out.print("matched");
            request.setAttribute("email",email);
            request.setAttribute("foreignkey",foreignkey);
            RequestDispatcher rd=request.getRequestDispatcher("NewPassword.jsp");
            rd.forward(request,response);
                }
                else
                {
            request.setAttribute("email",email);
            request.setAttribute("foreignkey",foreignkey);
            request.setAttribute("errMsg","Wrong Authentication  Number");
            RequestDispatcher rd=request.getRequestDispatcher("MatchAuthno.jsp");
            rd.forward(request,response);
                }
                //out.println(authfromdatabase);
            }
        }
        catch(Exception ex)
        {
            out.println(ex);
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
    }// </editor-fold
}
