/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PrivateMessage;

import com.servlet.db.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DigitalForce™
 */
@WebServlet(name = "SendPM", urlPatterns = {"/SendPM"})
public class SendPM extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendPM</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendPM at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        out.println("Entered");
    //ResultSet rs = null;
    String name = request.getParameter("title");
    String desc = request.getParameter("desc");
    String send = request.getParameter("sender");
    String receive = request.getParameter("receiver");
    
    try{
        out.println("Entered");
        con = DB.getConnection();
        //ob2.println("Connection complete!");
        st = con.createStatement();
        out.println("Entered"+name+desc+send+receive);
        st.executeUpdate("Insert into private_message(Title, Description, Sender, Receiver) values('"+name+"','"+desc+"','"+send+"', '"+receive+"')");
        out.println("Entered");
        response.sendRedirect(request.getContextPath()+"/Panels/user-profile.jsp");
    }
    catch(Exception e){
        response.sendRedirect(request.getContextPath()+"/Panels/user-profile.jsp");
    }
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
