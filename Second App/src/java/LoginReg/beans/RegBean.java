/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginReg.beans;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DigitalForce™
 */
public class RegBean implements Serializable{
    private String fname="";
    private String lname="";
    private Date bdate;
    
    public RegBean(){
        
    }
    
    public String getfname(){
        return fname;
    }
    
    public void setfname(String fn){
        this.fname = fn;
    }
    
    public String getlname(){
        return lname;
    }
    
    public void setlname(String ln){
        this.lname = ln;
    }
    
    
}
