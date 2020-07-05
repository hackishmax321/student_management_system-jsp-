/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author KAVINDA
 */
public class DAO {
    Connection conn = null;
    
    public void connection() throws Exception{
    
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jweb","root","");
        
    }
    
    public Connection ConnectionDB() throws ClassNotFoundException, SQLException
    {
       
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jweb","root","");
        return conn;
        
    }
}
