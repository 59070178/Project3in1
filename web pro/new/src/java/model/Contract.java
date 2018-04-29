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
    private int account_id;
    private int payment_id;
    

    private Connection conn;

    public Contract() {
    }

    public int getContractID(int id_user) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "SELECT max(m_i_id) 'i_id' FROM (select i_id 'm_i_id'   from indenture WHERE account_id ='" + id_user + "'" + ")m_i_id";
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
   
    
    public void addContract() throws SQLException{

       
        Statement stmt = conn.createStatement();
        String sql_book_contract = "INSERT INTO indenture (end_date, start_date, account_id, payment_id) "
                + "VALUES( '" + endDate + "','" + startDate+"', " +account_id +","+ payment_id+ ")";
        stmt.executeUpdate(sql_book_contract);
        
         String sql_find_i_id = "SELECT  max(i_id) FROM indenture";
        ResultSet rs = stmt.executeQuery(sql_find_i_id);
        rs.next();
        setContractID(rs.getInt("max(i_id)"));
        
        
        
        
        
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }


}
