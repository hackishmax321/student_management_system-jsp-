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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ishan Gayantha
 */
@WebServlet(name = "Nservelet", urlPatterns = {"/Nservelet"})
public class Nservelet extends HttpServlet {

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
            out.println("<title>Servlet Nservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Nservelet at " + request.getContextPath() + "</h1>");
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
        Statement st = null, st2 = null, st3 = null, st4= null;
        ResultSet rs = null, rs2 = null, rs3 = null, rs4= null;
        
        try {
        Class.forName("com.mysql.jdbc.Driver"); 
        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
        out.println("Connection Completed");
        //String query = "Select * from users2 where FirstName = ? AND Password Like ?;";
        //PreparedStatement st = con.prepareStatement(query);
        st = con.createStatement();
        st2 = con.createStatement();
        st3 = con.createStatement();
        st4 = con.createStatement();
        out.println("Statement Completed");
        //st.executeUpdate("Insert into users (Name, Password) values('"+nam+"','"+pa+"');");  //-- Register --
        //st.setString(1, nam);
        //st.setString(2, pa);
        //out.println(st);
        
        //Varify Request Form
        //if(request.getHeader()){
            
        //}
        
        rs = st.executeQuery("Select * from users2 where FirstName = '"+nam+"'");
        out.println("Execution Complete!"+rs);
        rs2 = st2.executeQuery("Select * from university where Username = '"+nam+"'");
        out.println("Execution Complete!"+rs2);
        rs3 = st3.executeQuery("Select * from industry where ChiefPerson = '"+nam+"'");
        out.println("Execution Complete!"+rs3);
        rs4 = st4.executeQuery("Select * from site_admin where Username = '"+nam+"'");
        
        String sty="";
        if(rs.next()){
            sty = rs.getString(9);//9
            if(sty.equals(pa)){
                out.println("Login Successful!");
                if(rs.getString(10).endsWith("0")){response.sendRedirect("Web Forms/waiting_page.jsp");}
                //Create session 
                HttpSession se = request.getSession();
                se.setMaxInactiveInterval(5*60);
                se.setAttribute("username", nam);
                se.setAttribute("user-role", "Undergraduate");
                se.setAttribute("university", rs.getString(7));
                se.setAttribute("ID", rs.getString(8));
                se.setAttribute("phone", rs.getString(5));
                se.setAttribute("email", rs.getString(6));
                
                //Cookies settings
                Cookie username = new Cookie("username", request.getParameter("uname"));
                Cookie passw = new Cookie("password", request.getParameter("pass"));
                username.setMaxAge(60*60*2);
                passw.setMaxAge(60*60*2);
                
                response.addCookie( username );
                response.addCookie( passw );
                
                response.sendRedirect("Panels/user-profile.jsp");
            } else {
                out.println("Login Failded enter valid Information!");
                response.sendRedirect("Web Forms/login.jsp");
            }
           
        } else if(rs2.next()){
            sty = rs2.getString(9);
            String sty2 = rs2.getString(10);
            out.println(sty);
            if(sty.equals(pa)){
                out.println("Login Successful!");
                
                //Create session 
                HttpSession se = request.getSession();
                se.setMaxInactiveInterval(5*60);
                se.setAttribute("username", nam);
                if(sty2.endsWith("min")){
                    se.setAttribute("user-role", "Admin");
                } else se.setAttribute("user-role", "Staff");
                se.setAttribute("university", rs2.getString(7));
                se.setAttribute("ID", rs2.getString(8));
                se.setAttribute("phone", rs2.getString(5));
                se.setAttribute("email", rs2.getString(6));
                
                response.sendRedirect("Panels/user-profile.jsp");
            } else {
                out.println("Login Failded enter valid Information!");
                response.sendRedirect("Web Forms/login.jsp");
            }
        }
        
        else if(rs3.next()){
            sty = rs3.getString(6);
            out.println(sty);
            if(sty.equals(pa)){
                out.println("Login Successful!");
                
                //Create session 
                HttpSession se = request.getSession();
                se.setMaxInactiveInterval(5*60);
                se.setAttribute("username", nam);
                se.setAttribute("user-role", "Industry");
                se.setAttribute("university", rs3.getString(2));
                se.setAttribute("ID", " ");
                se.setAttribute("phone", rs3.getString(4));
                se.setAttribute("email", rs3.getString(5));
                
                response.sendRedirect("Panels/user-home.jsp");
            } else {
                out.println("Login Failded enter valid Information!");
                response.sendRedirect("Web Forms/login.jsp");
            }
        } else if(rs4.next()){
            sty = rs4.getString(5);
            
            
            if(sty.equals(pa)){
                out.println("Login Successful!");
                
                //Create session 
                HttpSession se = request.getSession();
                se.setMaxInactiveInterval(5*60);
                se.setAttribute("username", nam);
                out.println("Login Successful!");
                se.setAttribute("user-role", "Super Admin");
                se.setAttribute("university", "Site-Hackish");
                
                se.setAttribute("ID", rs4.getString(1));
                se.setAttribute("phone", rs4.getString(4));
                se.setAttribute("email", rs4.getString(5));
                out.println("Login Successful!");
                
                response.sendRedirect("Panels/user-home.jsp");
            } else {
                out.println("Login Failded enter valid Information!");
                response.sendRedirect("Web Forms/login.jsp");
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
