/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.servlet.db.DB;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@WebServlet(name = "ProblemUpload", urlPatterns = {"/ProblemUpload"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
maxFileSize = 1024 * 1024 * 1000, // 1 GB
maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class ProblemUpload extends HttpServlet {

    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
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
                        String uploader = request.getParameter("uname");
                        String proID = request.getParameter("id");
                       
                        
                        String fileName = filePart.getSubmittedFileName();
                        String path = folderName + File.separator + fileName;
                        String newPath = folderName + '/'+fileName;



                        InputStream is = filePart.getInputStream();
                        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                        try {
                            
                            int id = Integer.parseInt(proID);
    
                            con = DB.getConnection();
                            System.out.println("connection done");
                            String sql = "Insert into problem_upload (Uploader, ProblemID, filename, path) values(?,?,?,?)";
                            ps = con.prepareStatement(sql);
                            ps.setString(1, uploader);
                            ps.setInt(2, id);
                            
                            ps.setString(3, fileName);
                            ps.setString(4, newPath);
                           
                            
                            int status = ps.executeUpdate();
                            
                            String sql2 = "Update problem set Submitted = ? where ID = ? ";
                            ps = con.prepareStatement(sql2);
                            ps.setInt(1, 1);
                            ps.setInt(2, id);
                            
                            int status2 = ps.executeUpdate();
                            if ((status > 0)&&(status2 > 0)) {
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
