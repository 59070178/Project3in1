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
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class AreaCart {

    List<Place> places;
    Connection conn;

    public AreaCart() {
    }

    public AreaCart(Connection conn) {
        this.conn = conn;
        places = new LinkedList<Place>();
    }

    public void addItem(String S_area_id) {

        try {
            int area_id = Integer.parseInt(S_area_id);
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM area where area_id = " + area_id;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {

                Place plc = new Place();

                plc.setPlaceID(area_id);
                plc.setPlace_name(rs.getString("area_name"));
                plc.setType(rs.getString("area_type"));
                plc.setPrice(rs.getFloat("price"));
                plc.setStatus(rs.getString("status"));
                places.add(plc);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AreaCart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void removeItem(String S_area_id) {
        places.remove(S_area_id);
    }

    /**
     * @return the place
     */
    public List<Place> getPlaces() {
        return places;
    }

}
