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
@WebServlet(urlPatterns = {"/Main"})
public class Main extends HttpServlet {

    private Connection con;
    private PreparedStatement ps;
    int tm;
    int foreignkey;
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
        String name=request.getParameter("candidateName");
        String email=request.getParameter("candidateEmail");
        String phone=request.getParameter("candidatePhone");
        String ts=request.getParameter("technicalskills");
        String cs=request.getParameter("communicationskills");
        String ms=request.getParameter("managementskills");
        String acad=request.getParameter("academics");
        String remarks=request.getParameter("remarks");
        foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
        int c=0;
        if(Integer.parseInt(ts)>10)
        {
            c++;
            request.setAttribute("errMsg1", "Technical marks should be less than 10");
            RequestDispatcher d=request.getRequestDispatcher("CandidateEvaluation.jsp");
            d.forward(request,response);             
        }
        if(Integer.parseInt(ms)>10)
        {
            c++;
            request.setAttribute("errMsg2", "management marks should be less than 10");
            RequestDispatcher d=request.getRequestDispatcher("CandidateEvaluation.jsp");
            d.forward(request,response);             
        }
        if(Integer.parseInt(cs)>10)
        {
            c++;
            request.setAttribute("errMsg3", "communication marks should be less than 10");
            RequestDispatcher d=request.getRequestDispatcher("CandidateEvaluation.jsp");
            d.forward(request,response);             
        }
          if(Integer.parseInt(acad)>10)
        {
            c++;
            request.setAttribute("errMsg4", "academic marks should be less than 10");
            RequestDispatcher d=request.getRequestDispatcher("CandidateEvaluation.jsp");
            d.forward(request,response);             
        }
       try{
         tm=Integer.parseInt(ts)+Integer.parseInt(cs)+Integer.parseInt(ms)+Integer.parseInt(acad);
       }
       catch(NumberFormatException e)
       {
               c++;
               request.setAttribute("errMsg", "Enter marks");
               RequestDispatcher d=request.getRequestDispatcher("CandidateEvaluation.jsp");
               d.forward(request,response);           
       }
        try{
            if(c==0){
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
          
            ps=con.prepareStatement("insert into table2(email,name,phone,techsk,mansk,commsk,acad,remarks,total,foreignkey)values(?,?,?,?,?,?,?,?,?,?)");
           // ps.setInt(1,Integer.parseInt(phone));
            ps.setString(1, email);
            ps.setString(2, name);
            ps.setString(3, phone);
            //ps.setString(, );
            ps.setString(4, ts);
            ps.setString(5, ms);
            ps.setString(6, cs);
            //ps.setString(7, ms);
            ps.setString(7, acad);
           
            ps  .setString(8, remarks);
            ps.setString(9, Integer.toString(tm));
            ps.setInt(10, foreignkey);
            int a=ps.executeUpdate();
            
            if(a>0)
            {
                request.setAttribute("foreignkey",foreignkey);
                RequestDispatcher rd=request.getRequestDispatcher("show.jsp");
                rd.forward(request,response);
            }
            
            }
            
                }
        catch(ClassNotFoundException | SQLException ex){
        
        {
           // out.println(ex);
            request.setAttribute("errMsg", "candidate already exist");
            RequestDispatcher d=request.getRequestDispatcher("CandidateEvaluation.jsp");
            d.forward(request,response);
        }
        
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
