
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;


/**
 *
 * @author Suttida Sat
 */
public class Login  implements java.io.Serializable{
    private String name ;
    private String psw ;
    private String account_type ;
    boolean result = false ;

    Connection conn;
    public Login() {
    }

    public Login(String name, String psw) {
       this.name = name;
       this.psw = psw;
    }
    public boolean checkLogin(String name, String psw){
        boolean st =false;
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT username , password FROM account WHERE username ='"+name+"'" +"AND password = '"+psw+"'";
            ResultSet rs = stmt.executeQuery(sql);
            
            st = rs.next();
        } catch (SQLException ex) {
        }
        return st;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getAccount_type() {
        return account_type;
    }

    public void setAccount_type(String account_type) {
        this.account_type = account_type;
    }

    public boolean isResult() {
        return result;
    }

      public Login(Connection conn){
        this.conn = conn;
    }
    public void setResult(boolean result) {
        this.result = result;
    }
    
     
    
}
