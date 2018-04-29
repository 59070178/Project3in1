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

/**
 *
 * @author asus
 */
public class Payment {

    public Payment() {

    }

    private int paymentID;
    private float priceBook;
    private float priceRent; 
    private int type_contract_id;
    private String slip;
    private String transfer_date_time;

    private Connection conn;

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public float getPriceBook() {
        return priceBook;
    }

    public void setPriceBook(float priceBook) {
        this.priceBook = priceBook;
    }

    public float getPriceRent() {
        return priceRent;
    }

    public void setPriceRent(float priceRent) {
        this.priceRent = priceRent;
    }

    public int getType_contract_id() {
        return type_contract_id;
    }

    public void setType_contract_id(int type_contract_id) {
        this.type_contract_id = type_contract_id;
    }

    public String getSlip() {
        return slip;
    }

    public void setSlip(String slip) {
        this.slip = slip;
    }

    public String getTransfer_date_time() {
        return transfer_date_time;
    }

    public void setTransfer_date_time(String transfer_date_time) {
        this.transfer_date_time = transfer_date_time;
    }

    

    public void addPayment() throws SQLException {
        
        Cart cart = new Cart();
        setPriceBook(cart.getTotal_book_amount());
        setType_contract_id(cart.getType_contract_id());
        
        Statement stmt = getConn().createStatement();
        String sql_book_payment = "INSERT INTO payment (price_book, price_rent, type_contract_id) VALUES( " + priceBook + ", 0," +type_contract_id+")";
        stmt.executeUpdate(sql_book_payment);

        String sql_find_payment_id = "SELECT  *  FROM payment WHERE payment_id  = (\n"
                + "    select max(payment_id) from payment\n"
                + "    where type_contract_id = 1\n"
                + ");";
        ResultSet rs = stmt.executeQuery(sql_find_payment_id);
        rs.next();
        setPaymentID(rs.getInt("payment_id"));

    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }



}
