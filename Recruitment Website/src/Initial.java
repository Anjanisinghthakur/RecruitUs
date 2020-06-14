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
@WebServlet(urlPatterns = {"/Initial"})
public class Initial extends HttpServlet {

    private Connection con;
    private ResultSet rs;
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
        String password=request.getParameter("password");
        String name = request.getParameter("username").toLowerCase();
        int c1=0,c2=0; 
        int foreignkey;
        String email;
        String s3 = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
            String q1="select * from allcompanies";
            st=con.createStatement();
            rs=st.executeQuery(q1);
            while(rs.next())
            {
               String s1;
               s1 =rs.getString(4);
               String s2;
               s2 = (rs.getString(2).toLowerCase());
               //out.println(s2);
              if(password.equals(s1))                  
              {
                 c1++; 
                 s3=s1;
              }   
              if(name.equals(s2))                  
              {
                 c2++; 
                 s3=s1;
              }     
            }
            if(c1==0||c2==0){
                
               request.setAttribute("errMsg", "Invalid company name or password");
               RequestDispatcher d=request.getRequestDispatcher("LoginPage1.jsp");
               d.forward(request,response);
            }
            
            else
            {
                String q2="select serialno from allcompanies where password='"+password+"'and name='"+name+"'";
                st=con.createStatement();
                rs=st.executeQuery(q2);
                while(rs.next())
                {
                   // email=rs.getString(3);
                foreignkey=rs.getInt(1);
                //HttpSession session=request.getSession(true);
                // request.setAttribute("email",email);
                request.setAttribute("foreignkey",foreignkey);
                RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                rd.forward(request,response);
                }
            }
                }
        catch(ClassNotFoundException | SQLException ex){
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
    }// </editor-fold>
}
