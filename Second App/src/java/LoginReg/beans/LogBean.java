/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginReg.beans;

import java.io.Serializable;

/**
 *
 * @author DigitalForce™
 */
public class LogBean implements Serializable{
    private String uname="";
    private String pass="";
    public LogBean(){
        
    }
    
    public String getuname(){
        return uname;
    }
    
    public void setuname(String un){
        this.uname = un;
    }
    
    public String getpass(){
        return pass;
    }
    
    public void setpass(String pa){
        this.pass = pa;
    }
}
