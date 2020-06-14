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
import java.sql.SQLException;
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
@WebServlet(urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {
private Connection con;
private Statement ps;
 String en;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int foreignkey;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email=request.getParameter("email");
        foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
       //out.print(email);
    /*    try{
        en=s;
         }
        catch(NumberFormatException e)
           {
               if(en == null)
               {
               request.setAttribute("errMsg", "Enter Email");
               RequestDispatcher d=request.getRequestDispatcher("fireemp.jsp");
               d.forward(request,response);
               }
              /* else
               {
               request.setAttribute("errMsg", "Wrong Email number");
               RequestDispatcher d=request.getRequestDispatcher("fireemp.jsp");
               d.forward(request,response);
               }
           }*/
        int c1=0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
            ps=con.createStatement();
            //ps.setString(,"k@gmail.com");
            int c =ps.executeUpdate("delete from table2 where email='"+email+"'and serialno='"+foreignkey+"'");
            //out.println(c);
            c1=0;
            if(c==1)
            {
            c1++;
            }
            if(c1>0)
            {  
                request.setAttribute("foreignkey",foreignkey);
                RequestDispatcher rd=request.getRequestDispatcher("show.jsp");
                rd.forward(request,response);
            }
            else if(c1==0)
            {
               request.setAttribute("errMsg", "Enter Email");
               request.setAttribute("foreignkey",foreignkey);
               RequestDispatcher d=request.getRequestDispatcher("fireemp.jsp");
               d.forward(request,response);
            }
                }
        catch(ClassNotFoundException | SQLException ex){
                request.setAttribute("errMsg", "Wrong Email");
                request.setAttribute("foreignkey",foreignkey);
                RequestDispatcher rd=request.getRequestDispatcher("fireemp.jsp");
                rd.forward(request,response);        }
        
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
