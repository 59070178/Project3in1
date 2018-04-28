/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Suttida Sat
 */
public class Contract {

    private int contractID;
    private Date startDate;
    private Date endDate;
    private String type;

    private Connection conn;

    public Contract() {
    }

    public int getContractID(int id_user) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "SELECT i_id  FROM indenture WHERE account_id ='" + id_user + "'";
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            contractID = rs.getInt("i_id");
        }
        return contractID;
    }

    //add by jugjig
    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }

    public Date getStartDate() {

        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Contract(Connection conn) {
        this.conn = conn;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
   

}
