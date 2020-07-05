package com.servlets;

import com.servlet.db.DB;
import com.servlet.db.DB2_FileUp;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class UploadServlet extends HttpServlet {

    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getHeader("referer");
            
            if(url.endsWith("event_upload.jsp")){
                response.setContentType("text/plain;charset=UTF-8");
                try {
                    out = response.getWriter();
                    session = request.getSession(false);


                        String folderName = "resources";
                        String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;

                        File dir = new File(uploadPath);
                        if (!dir.exists()) {
                            dir.mkdirs();
                        }
                        Part filePart = request.getPart("file");//Textbox value of name file.
                        String event = request.getParameter("ename");
                        String handle = request.getParameter("handle");
                        String dob = request.getParameter("date");
                        String time = request.getParameter("time");
                        String place = request.getParameter("place");
                        String des = request.getParameter("des");
                        String fileName = filePart.getSubmittedFileName();
                        String path = folderName + File.separator + fileName;
                        String newPath = folderName + '/'+fileName;



                        InputStream is = filePart.getInputStream();
                        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                        try {
                            
                            //convert time format
                            out.println("Connection Completed"+time);
                            SimpleDateFormat timeformat = new SimpleDateFormat("kk:mm");
                            java.util.Date t = timeformat.parse(time);
                            java.sql.Timestamp realTime = new java.sql.Timestamp(t.getTime());

                            SimpleDateFormat dformat=new SimpleDateFormat("yyyy-MM-dd");    
                            out.println("Connection Completed"+dob);
                            java.util.Date date = dformat.parse(dob);
                            out.println("Date Completed"+ date);
                            java.sql.Date realDate = new java.sql.Date(date.getTime());
                            out.println("Date Completed"+ realDate);


                            con = DB.getConnection();
                            System.out.println("connection done");
                            String sql = "Insert into event (Name, DateE, Venue, Description, handle, Poster, TimeE) values(?,?,?,?,?,?,?)";
                            ps = con.prepareStatement(sql);
                            ps.setString(1, event);
                            ps.setString(2, realDate.toString());
                            ps.setString(7, realTime.toString());
                            ps.setString(3, place);
                            ps.setString(4, des);
                            ps.setString(5, handle);
                            ps.setString(6, newPath);

                            int status = ps.executeUpdate();
                            if (status > 0) {
                                session.setAttribute("fileName", fileName);
                                String msg = "" + fileName + " File uploaded successfully...";
                                request.setAttribute("msg", msg);
                                RequestDispatcher rd = request.getRequestDispatcher("Panels/user-events.jsp");
                                rd.forward(request, response);
                                System.out.println("File uploaded successfully...");
                                System.out.println("Uploaded Path: " + uploadPath);
                            }
                            out.println("Insertion Completed");
                        } catch (SQLException e) {
                            out.println("Exception: " + e);
                            System.out.println("Exception1: " + e);
                        } catch (ParseException ex) {
                            Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
                        } finally {
                            try {
                                if (ps != null) {
                                    ps.close();
                                }
                                if (con != null) {
                                    con.close();
                                }
                            } catch (SQLException e) {
                                out.println(e);
                            }
                        }



                } catch (IOException | ServletException e) {
                    out.println("Exception: " + e);
                    System.out.println("Exception2: " + e);
                }
        
        } else if(url.endsWith("event-uploadSP.jsp")){
            
            response.setContentType("text/plain;charset=UTF-8");
                try {
                    out = response.getWriter();
                    session = request.getSession(false);


                        String folderName = "resources";
                        String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;

                        File dir = new File(uploadPath);
                        if (!dir.exists()) {
                            dir.mkdirs();
                        }
                        Part filePart = request.getPart("file");//Textbox value of name file.
                        String event = request.getParameter("ename");
                        
                        String dob = request.getParameter("stdate");
                        String eob = request.getParameter("endate");
                        String place = request.getParameter("place");
                        String des = request.getParameter("des");
                        String uni = request.getParameter("university");
                        String fileName = filePart.getSubmittedFileName();
                        String path = folderName + File.separator + fileName;
                        String newPath = folderName + '/'+fileName;



                        InputStream is = filePart.getInputStream();
                        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                        try {
                            
                            

                            SimpleDateFormat dformat=new SimpleDateFormat("yyyy-MM-dd");    
                            out.println("Connection ACompleted"+dob);
                            java.util.Date date = dformat.parse(dob);
                            out.println("Date Completed"+ date);
                            java.sql.Date realDate = new java.sql.Date(date.getTime());
                            out.println("Date Completed"+ realDate);
                            
                            java.util.Date date2 = dformat.parse(eob);
                            out.println("Date Completed"+ date);
                            java.sql.Date realDate2 = new java.sql.Date(date2.getTime());
                            out.println("Date Completed"+ realDate);


                            con = DB.getConnection();
                            System.out.println("connection done");
                            String sql = "Insert into university_spevent (Name, OpenDate, EndDate, Venue, Description, Poster, UniID) values(?,?,?,?,?,?,?)";
                            ps = con.prepareStatement(sql);
                            ps.setString(1, event);
                            ps.setString(2, realDate.toString());
                            
                            ps.setString(3, realDate2.toString());
                            ps.setString(4, place);
                            ps.setString(5, des);
                            ps.setString(6, newPath);
                            ps.setString(7, uni);
                            
                            int status = ps.executeUpdate();
                            if (status > 0) {
                                session.setAttribute("fileName", fileName);
                                String msg = "" + fileName + " File uploaded successfully...";
                                request.setAttribute("msg", msg);
                                RequestDispatcher rd = request.getRequestDispatcher("Panels/user-events.jsp");
                                rd.forward(request, response);
                                //response.sendRedirect(request.getContextPath()+"/Panels/user-sp-events.jsp");
                                System.out.println("File uploaded successfully...");
                                System.out.println("Uploaded Path: " + uploadPath);
                            }
                            out.println("Insertion Completed");
                        } catch (SQLException e) {
                            out.println("Exception: " + e);
                            System.out.println("Exception1: " + e);
                        } catch (ParseException ex) {
                            Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
                        } finally {
                            try {
                                if (ps != null) {
                                    ps.close();
                                }
                                if (con != null) {
                                    con.close();
                                }
                            } catch (SQLException e) {
                                out.println(e);
                            }
                        }



                } catch (IOException | ServletException e) {
                    out.println("Exception: " + e);
                    System.out.println("Exception2: " + e);
                }
            
        }  else if(url.endsWith(url)){
            
            
            response.setContentType("text/plain;charset=UTF-8");
            try {
                out = response.getWriter();
                session = request.getSession(false);
                String folderName = "resources";
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
                
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                Part filePart = request.getPart("file");//Textbox value of name file.
                String firstName = request.getParameter("firstname");//Textbox value of name firstname.
                String lastName = request.getParameter("lastname");//Textbox value of name lastname.
                String fileName = filePart.getSubmittedFileName();
                String path = folderName + File.separator + fileName;
                String newPath = folderName + File.pathSeparator+fileName;
                Timestamp added_date = new Timestamp(System.currentTimeMillis());
                System.out.println("fileName: " + fileName);
                System.out.println("Path: " + uploadPath);
                System.out.println("Name: " + firstName);
                InputStream is = filePart.getInputStream();
                Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                try {
                    con = DB2_FileUp.getConnection();
                    System.out.println("connection done");
                    String sql = "insert into employee(firstname,lastname,filename,path,added_date) values(?,?,?,?,?)";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, firstName);
                    ps.setString(2, lastName);
                    ps.setString(3, fileName);
                    ps.setString(4, newPath);
                    ps.setTimestamp(5, added_date);
                    int status = ps.executeUpdate();
                    if (status > 0) {
                        session.setAttribute("fileName", fileName);
                        String msg = "" + fileName + " File uploaded successfully...";
                        request.setAttribute("msg", msg);
                        //RequestDispatcher rd = request.getRequestDispatcher("/Panels/personal-storage.jsp");
                        response.sendRedirect(request.getContextPath()+"/Panels/personal-storage.jsp");
                        //rd.forward(request, response);
                        System.out.println("File uploaded successfully...");
                        System.out.println("Uploaded Path: " + uploadPath);
                    }
                } catch (SQLException e) {
                    out.println("Exception: " + e);
                    System.out.println("Exception1: " + e);
                } finally {
                    try {
                        if (ps != null) {
                            ps.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        out.println(e);
                    }
                }

            } catch (IOException | ServletException e) {
                out.println("Exception: " + e);
                System.out.println("Exception2: " + e);
            }
            
        }
    }

}
