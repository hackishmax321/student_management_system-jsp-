/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Comment;

import com.servlet.db.DB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DigitalForce™
 */
@MultipartConfig(maxFileSize = 16177215)
public class AddReply extends HttpServlet {

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
            out.println("<title>Servlet AddReply</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddReply at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        out.println("Button Clicked!");
        //if(request.getParameter("addissue")!= null){
            InputStream inputStream = null;
            out.println("Button Clicked!");
            
        String sender=request.getParameter("user");    
        String proID=request.getParameter("probid");
        String comment=request.getParameter("comment");
        String title=request.getParameter("title");
        Part filePart = request.getPart("file");
        //out.println("Button "+sender+" "+proID+" "+comment+" "+title);
        if (filePart != null) 
        {
            inputStream = filePart.getInputStream();
            
        }
        int i = Integer.parseInt(proID);
        System.out.println("Er"+i);
        DB dao = new DB();
        Connection conn;
        try {
            conn = dao.getConnection();
            out.println("Connection completed!");
            String sql = "INSERT INTO forum_reply(id, image, comment, title, Sender, QuestID) VALUES (?,?,?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    out.println("Connection completed!");
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(2, inputStream, (int) filePart.getSize());
                        
                    }
                    statement.setString(1,null);
                    statement.setString(3,comment);
                    statement.setString(4,title);
                    statement.setInt(6, i);
                    statement.setString(5,sender);
                    statement.executeUpdate();
                    out.println("Connection completed! 457");
                    response.sendRedirect(request.getContextPath()+"/Panels/quest-page.jsp?g="+i+"");
        } catch (SQLException ex) {
            Logger.getLogger(addservlet2.class.getName()).log(Level.SEVERE, null, ex);
        }
        //response.sendRedirect(request.getContextPath()+"/Panels/quest-page.jsp");
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
