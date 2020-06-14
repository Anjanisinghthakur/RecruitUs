
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet(urlPatterns = {"/ServertoChangeImage"})
@MultipartConfig(fileSizeThreshold=1024*1024*2,
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50)
public class ServertoChangeImage extends HttpServlet {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private Statement st;   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
       
       Part part=request.getPart("photo");       
        InputStream photo=null;
        if(part!=null)
        {
            long fileSize=part.getSize();
            String fileContent=part.getContentType();
            photo=part.getInputStream();
        }
         
        try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
          
           ps=con.prepareStatement("update allcompanies set photo=? where `serialno`=?");
           ps.setInt(1, foreignkey);
           out.println(foreignkey);
           ps.setBlob(12,photo);
           
           int i=ps.executeUpdate();
            if(i>0)
            {
             request.setAttribute("foreignkey",foreignkey);
             RequestDispatcher rd=request.getRequestDispatcher("UpdateProfile.jsp");
             rd.forward(request,response);  
            }           
        }
        catch(Exception ex)
        {
            out.println(ex);
        }
    }
}
