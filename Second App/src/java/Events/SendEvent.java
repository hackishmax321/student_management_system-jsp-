/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Events;

import LoginReg.Nservelet;
import LoginReg.RegServlet;
import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DigitalForce™
 */
public class SendEvent extends HttpServlet {

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
            out.println("<title>Servlet SendEvent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEvent at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
            String name = request.getParameter("ename");
            String handle = request.getParameter("handle");
            String dob = request.getParameter("date");
            String time = request.getParameter("time");
            String place = request.getParameter("place");
            
            String uni = request.getParameter("university");
            String des = request.getParameter("des");
            
            
            

//DateFormat df = new SimpleDateFormat("HH:mm");
            
            
            try {
                
                
                
                //set time format    
                //Date ti = df.parse(time);             
                
                //convert time format
                SimpleDateFormat timeformat = new SimpleDateFormat("h:mm a");
                java.util.Date t = timeformat.parse(time);
                java.sql.Timestamp realTime = new java.sql.Timestamp(t.getTime());
                
                
                //set Date and cast it for DoB field 
                out.println("Connection Completed"+dob);
                
                
                  
                SimpleDateFormat dformat=new SimpleDateFormat("yyyy-MM-dd");    
                //out.println("Connection Completed"+dob);
                java.util.Date date = dformat.parse(dob);
                //out.println("Date Completed"+ date);
                java.sql.Date realDate = new java.sql.Date(date.getTime());
            out.println("Date Completed"+ realTime);
            //set DB connection
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
            out.println("Connection Completed");
            Statement st = con.createStatement();
            st.executeUpdate("Insert into event (Name, DateE, TimeE, Venue, Description, handle) values('"+name+"', '"+realDate+"', '"+realTime+"', '"+place+"', '"+des+"', '"+handle+"');");
            out.println("Insertion Completed");
            /*if(pa.equals(cpa)){
                   //-- Register --
                 out.println("Insertion Completed");
                 response.sendRedirect("http://www.google.lk");
            } else {
                out.println("Insertion Failded!");
                response.sendRedirect("newregistation.html");
            }*/
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(Nservelet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
            Logger.getLogger(SendEvent.class.getName()).log(Level.SEVERE, null, ex);
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
        //processRequest(request, response);
        
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

    private boolean convertTo24HoursFormat(String time) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
