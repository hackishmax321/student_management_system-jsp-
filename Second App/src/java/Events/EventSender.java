/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Events;

import LoginReg.Nservelet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author DigitalForce™
 */
@WebServlet(name = "EventSender", urlPatterns = {"/EventSender"})
public class EventSender extends HttpServlet {

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
            out.println("<title>Servlet EventSender</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EventSender at " + request.getContextPath() + "</h1>");
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
    HttpSession session = null;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        session = request.getSession(false);
            String folderName = "resources";
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;//for netbeans use this code
            //String uploadPath = request.getServletContext().getRealPath("") + folderName;//for eclipse use this code
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart = request.getPart("file");//Textbox value of name file.
            String fileName = filePart.getSubmittedFileName();
            
            String path = folderName + File.separator + fileName;
            Timestamp added_date = new Timestamp(System.currentTimeMillis());
            System.out.println("fileName: " + fileName);
            System.out.println("Path: " + uploadPath);
            //System.out.println("Name: " + firstName);
            InputStream is = filePart.getInputStream();
            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
        
            String name = request.getParameter("ename");
            String handle = request.getParameter("handle");
            String dob = request.getParameter("date");
            String time = request.getParameter("time");
            String place = request.getParameter("place");
            
            String uni = request.getParameter("university");
            String des = request.getParameter("des");
            
            
            out.println("Connection Completed"+dob+name+handle+place);

//DateFormat df = new SimpleDateFormat("HH:mm");
            
            
            try {
                
                
                
                //set time format    
                //Date ti = df.parse(time);             
                
                
                
                
                //set Date and cast it for DoB field 
                out.println("Connection Completed"+dob);
                
                
                  
                SimpleDateFormat dformat=new SimpleDateFormat("yyyy-MM-dd");    
                out.println("Connection Completed"+dob);
                java.util.Date date = dformat.parse(dob);
                out.println("Date Completed"+ date);
                java.sql.Date realDate = new java.sql.Date(date.getTime());
            out.println("Date Completed"+ realDate);
            //set DB connection
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
            out.println("Connection Completed");
            Statement st = con.createStatement();
            st.executeUpdate("Insert into event (Name, DateE, Venue, Description, handle, Poster) values('"+name+"', '"+realDate+"', '"+place+"', '"+des+"', '"+handle+"', '"+path+"');");
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
