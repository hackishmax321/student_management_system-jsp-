package Comment;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Comment.DAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KAVINDA
 */
@MultipartConfig(maxFileSize = 16177215)
public class addservlet2 extends HttpServlet {

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
            out.println("<title>Servlet addservlet2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addservlet2 at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException 
    {
        if(request.getParameter("addissue")!= null){
            InputStream inputStream = null;
            
        String comment=request.getParameter("comment");
        String title=request.getParameter("title");
        Part filePart = request.getPart("file");
        
        if (filePart != null) 
        {
            inputStream = filePart.getInputStream();
        }
        
        DAO dao=new DAO();
        Connection conn;
        try {
            conn = dao.ConnectionDB();
            String sql = "INSERT INTO images VALUES (?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(2, inputStream, (int) filePart.getSize());
                    }
                    statement.setString(3,comment);
                    statement.setString(4,title);
                    statement.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addservlet2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addservlet2.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("problems.jsp");
        }
        
        else if(request.getParameter("addcomment")!= null){
        
            
        String comment = request.getParameter("comment");
        String email = request.getParameter("email");
        String id = (String)request.getParameter("id");
        int id2 = Integer.parseInt(id);
        
        DAO dao=new DAO();
        Connection conn;
        try {
            conn = dao.ConnectionDB();
            String sql = "INSERT INTO comments VALUES (?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, email);
                    statement.setInt(2,id2);
                    statement.setString(3,comment);
                    statement.setString(4,null);
                    statement.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addservlet2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addservlet2.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("id",id);
        request.getRequestDispatcher("DisplayComments.jsp").forward(request, response);
        }
            
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
