/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginReg;

import LoginReg.beans.LogBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ishan Gayantha
 */
@WebServlet(name = "UniNservelet", urlPatterns = {"/UniNservelet"})
public class UniNservelet extends HttpServlet {

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
            out.println("<title>Servlet UniNservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UniNservelet at " + request.getContextPath() + "</h1>");
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
        String nam = request.getParameter("uname");
        String pa = request.getParameter("pass");
        
        LogBean log = new LogBean();
        
        log.setuname(nam);
        log.setpass(pa);
        
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        try {
        Class.forName("com.mysql.jdbc.Driver"); 
        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
        out.println("Connection Completed");
        //String query = "Select * from users2 where FirstName = ? AND Password Like ?;";
        //PreparedStatement st = con.prepareStatement(query);
        st = con.createStatement();
        //st2 = con.createStatement();
        out.println("Statement Completed");
        //st.executeUpdate("Insert into users (Name, Password) values('"+nam+"','"+pa+"');");  //-- Register --
        //st.setString(1, nam);
        //st.setString(2, pa);
        //out.println(st);
        
        //Varify Request Form
        //if(request.getHeader()){
            
        //}
        
        rs = st.executeQuery("Select * from university where FirstName = '"+nam+"'");
        out.println("Execution Complete!"+rs);
        //rs2 = st2.executeQuery("Select * from university-users where FName = '"+nam+"'");
        //out.println("Execution Complete!"+rs2);
        
        String sty="";
        if(rs.next()){
            sty = rs.getString(4);//9
            out.println(sty);
            if(sty.equals(pa)){
                out.println("Login Successful!");
                
                //Create session 
                HttpSession se = request.getSession();
                se.setMaxInactiveInterval(5*60);
                se.setAttribute("username", nam);
                
                response.sendRedirect("Secondary/home-user.jsp");
            } else {
                out.println("Login Failded enter valid Information!");
            }
           
        }
        else{
            out.println("Login Failded!");
        }
        
        } 
        catch (SQLException | NullPointerException | ClassNotFoundException ex) {
            Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) { Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, e);}
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) { Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, e);}
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) { Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, e);}
            }
        }
        
        
        out.println("Progress Completed!");
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
