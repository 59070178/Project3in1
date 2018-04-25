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
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Suttida Sat
 */
public class Place {

    private Connection conn;
    
    private String placeID;
    private String type;
    private Boolean status;
    private float price;
    private HashMap<Integer,String> place;
    
    public Place() {
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public String getPlaceID() {
        return placeID;
    }
    public String getPlaceID(int i_id) {
       
        return placeID;
    }

    public void setPlaceID(int i_id) {

            this.placeID = placeID;
    }
    
    
    // add by jugjig check setPlaceID(int i_id)  
     public void setPlaceID(String placeID) {
        this.placeID = placeID;
    }
     
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public HashMap<Integer, String> getPlace() {
        return place;
    }

    public void setPlace(int i_id) throws SQLException {
         Statement stmt = conn.createStatement();
            String sql_place = "SELECT area_id  FROM inden_area WHERE i_id   ='"+i_id+"'";
            ResultSet rs = stmt.executeQuery(sql_place);
            
            List<Integer> place_id = null;
            while(rs.next()){
                place_id.add(rs.getInt("area_id "));
            }
            
            HashMap newmap = new HashMap();
            for(int i=0 ; i<place_id.size() ; i++){
                String sql_type = "SELECT area_type FROM inden_area WHERE i_id   ='"+place_id.get(i)+"'";
                ResultSet rs2 = stmt.executeQuery(sql_type);
                while(rs2.next())
                    this.place = (HashMap<Integer, String>) newmap.put(place_id.get(i), rs2.getString("area_type"));
            }
    }
    
    
}
