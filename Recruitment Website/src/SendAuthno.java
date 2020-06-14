/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/SendAuthno"})
public class SendAuthno extends HttpServlet {

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
        int foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
        String email=(String)request.getParameter("email");
        int otp=foreignkey+462589;
        final String username="recruitus.website@gmail.com";
        final String password="recruitus123";
		Properties p=new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		Session s=Session.getInstance(p,
				new javax.mail.Authenticator(){
                  
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(username,password);
			}
			
		}						
				);
		try{
                        Message message=new MimeMessage(s);
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                        //message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("anjani.thakur.sbg@gmail.com"));
			message.setSubject("Authentication number to set password");
			message.setText("Your authentication number is "+otp+" your email is "+email);
			Transport.send(message);
                        request.setAttribute("email",email);
                        request.setAttribute("foreignkey",foreignkey);
                        RequestDispatcher rd=request.getRequestDispatcher("MatchAuthno.jsp");
                        rd.forward(request,response);
			/*out.println("<script type=\"text/javascript\">");
                        out.println("alert('Authentication number Sent');");
                        out.println("location='MatchAuthno.jsp';");
                        out.println("</script>");*/
		}
		catch(MessagingException e)
		{
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('No Internet connection');");
                        out.println("location='AuthnoCatch.jsp';");
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
