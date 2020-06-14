/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.*;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
//import javax.mail.MessagingException;
import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/RegistrationServer"})
@MultipartConfig(fileSizeThreshold=1024*1024*2,
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50)
public class RegistrationServer extends HttpServlet {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private Statement st;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name, email, password, headquarters, type, founded, founder, chairman, ceo, revenue, status;
        name=request.getParameter("name");
        email=request.getParameter("email");
        password=request.getParameter("password");
        headquarters=request.getParameter("headquarters");
        type=request.getParameter("type");
        founder=request.getParameter("founder");
        founded=request.getParameter("founded");
        chairman=request.getParameter("chairman");
        ceo=request.getParameter("ceo");
        revenue=request.getParameter("revenue");
        Part part=request.getPart("photo");
        InputStream photo=null;
        if(part!=null)
        {
            long fileSize=part.getSize();
            String fileContent=part.getContentType();
            photo=part.getInputStream();
        }
        Part partlogo=request.getPart("logo");
        InputStream logo=null;
        if(partlogo!=null)
        {
            long fileSize=part.getSize();
            String fileContent=partlogo.getContentType();
            logo=partlogo.getInputStream();
        }
        status=request.getParameter("status");
        if(name==null)
        {
            request.setAttribute("errMsg", "Enter the name of Company");
            RequestDispatcher d=request.getRequestDispatcher("RegistrationPage.jsp");
            d.forward(request,response);
        }
        int lastserialno=0;
        int lastotp=0;
         final String username="recruitus.website@gmail.com";
        final String pass="recruitus123";

        Properties p=new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		Session s=Session.getInstance(p,
				new javax.mail.Authenticator(){
                  
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(username,pass);
			}
			
		}						
				);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
            st=con.createStatement();
            rs =st.executeQuery("select max(serialno) from allcompanies");
           // out.print(rs);
            while(rs.next())
            {
                lastserialno=rs.getInt(1);
            }
            int newserialno=lastserialno+1;
              Message message=new MimeMessage(s);
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                        //message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("anjani.thakur.sbg@gmail.com"));
			message.setSubject("Hi");
			message.setText("Your company "+name+" has successfully registered into RecruitUs");
			Transport.send(message);
            ps=con.prepareStatement("insert into allcompanies(serialno,name,email,password,location,type,founded,founder,chairman,ceo,revenue,photo,status,logo) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, newserialno);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, headquarters);
            ps.setString(6, type);
            ps.setString(7,founded);
            ps.setString(8,founder);
            ps.setString(9, chairman);
            ps.setString(10, ceo);
            ps.setString(11, revenue);
            ps.setBlob(12, photo);
            ps.setString(13, status);
            ps.setBlob(14, logo);
            int a=ps.executeUpdate();
            if(a>0)
            {
                      
                        request.setAttribute("foreignkey",newserialno);
                        RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                        rd.forward(request,response);
            }     
        }
        catch(ClassNotFoundException | SQLException ex)
        {
        out.print(ex);
        } catch (MessagingException ex) {
           request.setAttribute("errMsg","Wrong Email");
           RequestDispatcher rd=request.getRequestDispatcher("RegistrationPage.jsp");
           rd.forward(request,response);
        }
      }
}
