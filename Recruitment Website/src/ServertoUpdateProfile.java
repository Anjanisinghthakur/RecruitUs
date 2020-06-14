/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/ServertoUpdateProfile"})
public class ServertoUpdateProfile extends HttpServlet {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    Statement st;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
        String name=request.getParameter("name");
        String headquarters=request.getParameter("headquarters");
        String type=request.getParameter("type");
        String founder=request.getParameter("founder");
        String founded=request.getParameter("founded");
        String ceo=request.getParameter("ceo");
        String chairman=request.getParameter("chairman");
        String revenue=request.getParameter("revenue");
        String status=request.getParameter("status");
        try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null); 
           st=con.createStatement();
           int i=st.executeUpdate("update allcompanies set name='"+name+"', location='"+headquarters+"',type='"+type+"',founder='"+founder+"',founded='"+founded+"',ceo='"+ceo+"',chairman='"+chairman+"',revenue='"+revenue+"',status='"+status+"' where serialno='"+foreignkey+"'");
           if(i>0)
           {
             request.setAttribute("foreignkey",foreignkey);
             RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
             rd.forward(request,response);  
           }
        }
        catch(Exception ex)
        {
           request.setAttribute("foreignkey",foreignkey);
           RequestDispatcher rd=request.getRequestDispatcher("UpdateProfile.jsp");
           rd.forward(request,response);   
        }
    }

   

}
