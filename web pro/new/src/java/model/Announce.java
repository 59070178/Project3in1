/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class Announce {
    
    private String announceType;
    private String information;
   
    Connection conn;

    public Announce() {
    }
    
    public String getAnnounceType() {
        return announceType;
    }

    public void setAnnounceType(String announceType) {
        this.announceType = announceType;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(int announce_con_id) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT  content FROM announce where con_id =" + announce_con_id;
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            this.information = rs.getString("content");
        } catch (SQLException ex) {
            Logger.getLogger(Announce.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void showAnnounce(){
      
    }
    
    public void updateAnnounce(int edit_con_type, String txt){
        try {
            Statement stmt = conn.createStatement();
            String sql = "INSERT INTO announce (content, type_contract_id) VALUES('"+txt+"'," + edit_con_type+ ")";
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Announce.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // create connection
    public Announce(Connection conn){
        this.conn = conn;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

}
