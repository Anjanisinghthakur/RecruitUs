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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/SendMailtoALL"})
public class SendMailtoALL extends HttpServlet {
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
        int foreignkey=Integer.parseInt(request.getParameter("foreignkey"));
        //String nameofjsppage=(String)(request.getParameter("nameofjsppage"));
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
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/recruitus","root",null);
            st=con.createStatement();
            ResultSet rs =st.executeQuery("select * from table2 where foreignkey='"+foreignkey+"'");
            while(rs.next())
            {
                        Message message=new MimeMessage(s);
			message.setFrom(new InternetAddress("algoxentechnologies@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rs.getString(1)));
			message.setSubject("job offer letter from AlgoXentechnologies");
			message.setText("Dear "+rs.getString(2)+",\nWe have carefully assessed your skills, abilities and knowledge and we are really impressed. For these reasons we would like to offer you the job as a trainee in our company.\nIf you accept this offer, the training will start from 15 july 2019. We would like to have response by 15 june 2019.\nWe are looking forward to having you in our team.\n\nBest regards\n");
			Transport.send(message);
                        /*out.println("<script type=\"text/javascript\">");
                        out.println("alert('Joining Mail Sent to all candidates');");
                        out.println("location='show.jsp';");
                        out.println("</script>");*/
            }
                request.setAttribute("foreignkey",foreignkey);
                RequestDispatcher rd=request.getRequestDispatcher("show.jsp");
                rd.forward(request,response);
            }
        catch(Exception ex)
        {
            /*out.println(ex);*/
             request.setAttribute("foreignkey",foreignkey);
             RequestDispatcher rd=request.getRequestDispatcher("show.jsp");
             rd.forward(request,response);
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
