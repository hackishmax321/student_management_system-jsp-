/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginReg;

import LoginReg.beans.RegBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
//import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ishan Gayantha
 */
public class RegServlet extends HttpServlet {

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
            out.println("<title>Servlet RegServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegServlet at " + request.getContextPath() + "</h1>");
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
        
        String url = request.getHeader("referer");
        
        if(url.endsWith("register.jsp")){
            
            String nam = request.getParameter("fname");
            String lnam = request.getParameter("lname");
            String dob = request.getParameter("bdate");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String uni = request.getParameter("uniname");
            String uniId = request.getParameter("uniid");
            String pa = request.getParameter("pass");
            String cpa = request.getParameter("cpass");

            RegBean re = new RegBean();
            re.setfname(nam);
            re.setlname(lnam);
            
            //set entered data fixed while throwing errors
            request.getSession().setAttribute("usedname", nam);
            request.getSession().setAttribute("usedfname", lnam);
            request.getSession().setAttribute("usedmobile", mobile);
            request.getSession().setAttribute("usedemail", email);
            request.getSession().setAttribute("useduni", uni);
            request.getSession().setAttribute("color", null);
            request.getSession().setAttribute("color2", null);
            request.getSession().setAttribute("color3", null);

            try {
            //set Date and cast it for DoB field 
            SimpleDateFormat dformat=new SimpleDateFormat("MM/dd/yyyy");         
            java.util.Date date = dformat.parse(dob);
            java.sql.Date realDate = new java.sql.Date(date.getTime());

            //set DB connection
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
            out.println("Connection Completed");
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            
            request.getSession().setAttribute("username", "notexist");
            
            ResultSet rs = st2.executeQuery("Select FirstName from users2 where FirstName='"+nam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register.jsp");
                response.sendError(500);
                
            }
            rs = st2.executeQuery("Select * from university where Username='"+nam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register.jsp");
                response.sendError(500);
                
            }
            
            rs = st2.executeQuery("Select * from industry where Name='"+nam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register.jsp");
                response.sendError(500);
                
            }
            
            if(mobile.length()!=10){
                request.getSession().setAttribute("color2", "#ff6b81");
                response.sendRedirect("Web Forms/register.jsp");
            }
            
            if((pa.equals(cpa))&&(pa!="")&&((pa.length()>=8)&&(pa.length()<=20))){
                 st.executeUpdate("Insert into users2 (FirstName, LastName, DoB, PhoneNo, Email, University, UniID, Password) values('"+nam+"', '"+lnam+"', '"+realDate+"','"+mobile+"', '"+email+"', '"+uni+"', '"+uniId+"', '"+pa+"');");  //-- Register --
                 out.println("Insertion Completed");
                 request.getSession().removeAttribute("usedname");
                 request.getSession().removeAttribute("usedfname");
                 request.getSession().removeAttribute("usedmobile");
                 request.getSession().removeAttribute("usedemail");
                 request.getSession().removeAttribute("useduni");
                 
                 request.getSession().removeAttribute("color");
                 request.getSession().removeAttribute("color2");
                 request.getSession().removeAttribute("color3");
                 
                 response.sendRedirect("Web Forms/waiting_page.jsp");
            } else {
                out.println("Insertion Failded!");
                request.getSession().setAttribute("color3", "#ff6b81");
                response.sendRedirect("Web Forms/register.jsp");
            }
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(RegServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if(url.endsWith("register_ind.jsp")){
            
            String cnam = request.getParameter("cname");
            String ynam = request.getParameter("yname");
            
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            
            String pa = request.getParameter("pass");
            String cpa = request.getParameter("cpass");

            //RegBean re = new RegBean();
            //re.setfname(nam);
            //re.setlname(lnam);

            //set entered data fixed while throwing errors
            request.getSession().setAttribute("usedname", ynam);
            request.getSession().setAttribute("usedfname", cnam);
            request.getSession().setAttribute("usedmobile", mobile);
            request.getSession().setAttribute("usedemail", email);
            
            request.getSession().setAttribute("color", null);
            request.getSession().setAttribute("color2", null);
            request.getSession().setAttribute("color3", null);

            try {
            
            //set DB connection
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
            out.println("Connection Completed");
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            
            request.getSession().setAttribute("username", "notexist");
            
            ResultSet rs = st2.executeQuery("Select FirstName from users2 where FirstName='"+ynam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register_ind.jsp");
                response.sendError(500);
                
            }
            rs = st2.executeQuery("Select * from university where Username='"+ynam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register_ind.jsp");
                response.sendError(500);
                
            }
            
            rs = st2.executeQuery("Select * from industry where Name='"+ynam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register_ind.jsp");
                response.sendError(500);
                
            }
            
            if(mobile.length()!=10){
                request.getSession().setAttribute("color2", "#ff6b81");
                response.sendRedirect("Web Forms/register_ind.jsp");
            }
            
            if((pa.equals(cpa))&&(pa!="")&&((pa.length()>=8)&&(pa.length()<=20))){
                 st.executeUpdate("Insert into industry (Name, ChiefPerson, ContactNo, Email, InPassword) values('"+cnam+"', '"+ynam+"', '"+mobile+"', '"+email+"', '"+pa+"');");  //-- Register --
                 out.println("Insertion Completed");
                 request.getSession().removeAttribute("usedname");
                 request.getSession().removeAttribute("usedfname");
                 request.getSession().removeAttribute("usedmobile");
                 request.getSession().removeAttribute("usedemail");
                 
                 request.getSession().removeAttribute("color");
                 request.getSession().removeAttribute("color2");
                 request.getSession().removeAttribute("color3");
                 
                 response.sendRedirect("Web Forms/login.jsp");
            } else {
                out.println("Insertion Failded!");
                request.getSession().setAttribute("color3", "#ff6b81");
                response.sendRedirect("Web Forms/register_ind.jsp");
            }
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if(url.endsWith("register_uni.jsp")){
            
            String nam = request.getParameter("fname");
            String unam = request.getParameter("lname");
            String dob = request.getParameter("bdate");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String uni_select = request.getParameter("uni-select");
            String uni = request.getParameter("uniname");
            String uniId = request.getParameter("uniid");
            String pa = request.getParameter("pass");
            String cpa = request.getParameter("cpass");

            RegBean re = new RegBean();
            re.setfname(nam);
            re.setlname(unam);
            
            //set entered data fixed while throwing errors
            request.getSession().setAttribute("usedname", unam);
            request.getSession().setAttribute("usedfname", nam);
            request.getSession().setAttribute("usedmobile", mobile);
            request.getSession().setAttribute("usedemail", email);
            request.getSession().setAttribute("useduni", uni);
            
            request.getSession().setAttribute("color", null);
            request.getSession().setAttribute("color2", null);
            request.getSession().setAttribute("color3", null);

            if(uni_select.equals("other")){
                uni_select = uni;
            }

            try {
            //set Date and cast it for DoB field 
            SimpleDateFormat dformat=new SimpleDateFormat("MM/dd/yyyy");         
            java.util.Date date = dformat.parse(dob);
            java.sql.Date realDate = new java.sql.Date(date.getTime());

            //set DB connection
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
            out.println("Connection Completed"+uni_select);
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            
            request.getSession().setAttribute("username", "notexist");
            
            ResultSet rs = st2.executeQuery("Select FirstName from users2 where FirstName='"+nam+"' ");
            
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register_uni.jsp");
                response.sendError(500);
                
            }
            rs = st2.executeQuery("Select * from university where Username='"+nam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register_uni.jsp");
                response.sendError(500);
                
            }
            
            rs = st2.executeQuery("Select * from industry where Name='"+nam+"' ");
            if(rs.next()){
                request.getSession().setAttribute("username", "exist");
                request.getSession().setAttribute("color", "#ff6b81");
                response.sendRedirect("Web Forms/register_uni.jsp");
                response.sendError(500);
                
            }
            
            if(mobile.length()!=10){
                request.getSession().setAttribute("color2", "#ff6b81");
                response.sendRedirect("Web Forms/register_uni.jsp");
            }
            
            if((pa.equals(cpa))&&(pa!="")&&((pa.length()>=8)&&(pa.length()<=20))){
                 st.executeUpdate("Insert into university (FirstName, Username, DoB, PhoneNo, Email, UniversityName, StaffID, Password) values('"+nam+"', '"+unam+"', '"+realDate+"','"+mobile+"', '"+email+"', '"+uni_select+"', '"+uniId+"', '"+pa+"');");  //-- Register --
                 out.println("Insertion Completed");
                 request.getSession().removeAttribute("usedname");
                 request.getSession().removeAttribute("usedfname");
                 request.getSession().removeAttribute("usedmobile");
                 request.getSession().removeAttribute("usedemail");
                 request.getSession().removeAttribute("useduni");
                 
                 request.getSession().removeAttribute("color");
                 request.getSession().removeAttribute("color2");
                 request.getSession().removeAttribute("color3");
                 
                 response.sendRedirect("Web Forms/login.jsp");
            } else {
                out.println("Insertion Failded!");
                request.getSession().setAttribute("color3", "#ff6b81");
                response.sendRedirect("Web Forms/register_uni.jsp");
            }
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(RegServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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
