/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Problem;

import PrivateMessage.*;
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
@WebServlet(name = "ChattingServe", urlPatterns = {"/ChattingServe"})
public class AllocateProblem extends HttpServlet {

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
            out.println("<title>Servlet ChattingServe</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChattingServe at " + request.getContextPath() + "</h1>");
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
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        out.println("Entered");
    //ResultSet rs = null;
    String proid = request.getParameter("proid");
    String problem = request.getParameter("pname");
    String lead = request.getParameter("leader");
    String mem2 = request.getParameter("mem2");
    String mem3 = request.getParameter("mem3");
    String mem4 = request.getParameter("mem4");
    String mem5 = request.getParameter("mem5");
    String acdemy = request.getParameter("academic");
    
    int ID  = Integer.parseInt(proid);
    
    try{
        out.println("Entered");
        con = DB.getConnection();
        out.println("Connection complete!");
        st = con.createStatement();
        
        String sql = "Insert into groupProject_desc(Problem, Pro_ID, Mem1, Mem2, Mem3, Mem4, Mem5, Academic_Sup) values('"+problem+"',"+ID+",'"+lead+"','"+mem2+"','"+mem3+"', '"+mem4+"', '"+mem5+"', '"+acdemy+"')";
        //out.println("Entered"+send+receive);
        st.executeUpdate(sql);
        
        
        
        out.println("Entered");
        response.sendRedirect(request.getContextPath()+"/Panels/group-assign.jsp");
    }
    catch(Exception e){
        response.sendRedirect(request.getContextPath()+"/Panels/Error-box.jsp");
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
