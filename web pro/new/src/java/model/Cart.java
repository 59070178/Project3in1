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
public class Cart {

    private String area_type;
    private int area_id;
    private String area_name;
    private float area_book_price;
    private float total_book_amount;
    private String book_due_date;
    private String book_end_date;
    private String status;
    private int type_contract_id;
    Connection conn;

    private Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public Cart() {
    }

    public String getArea_type() {
        return area_type;
    }

    public void setArea_type(String area_type) {
        this.area_type = area_type;
    }

    public int getArea_id() {
        return area_id;
    }

    public void setArea_id(int area_id) {
        this.area_id = area_id;
    }

    public float getArea_book_price() {
        return area_book_price;
    }

    public void setArea_book_price(float area_book_price) {
        this.area_book_price = area_book_price;
    }

   

    public float getTotal_book_amount() {
        return total_book_amount;
    }

    public void setTotal_book_amount(float area_price) {
        total_book_amount = area_price * 30 / 100;
        this.total_book_amount = total_book_amount;
    }

    public String getBook_due_date() {
        return book_due_date;
    }

    public void setBook_due_date(String book_due_date) {
        this.book_due_date = book_due_date;
    }

    public String getBook_end_date() {
        return book_end_date;
    }

    public void setBook_end_date(String book_end_date) {
        this.book_end_date = book_end_date;
    }

    public void addItem(int area_id) throws SQLException {

        Statement stmt = getConn().createStatement();
        String sql = "SELECT * FROM area where area_id = " + area_id;
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        setArea_id(area_id);
        setArea_name(rs.getString("area_name"));
        setArea_type(rs.getString("area_type"));
        setArea_book_price(rs.getFloat("price"));
        setTotal_book_amount(rs.getFloat("price"));
        setStatus(rs.getString("status"));
        setType_contract_id(1);

        DateExample dt = new DateExample();
        dt.bookDate();
        setBook_due_date(dt.getDue_date());
        setBook_end_date(dt.getNext_date());

    }

    public String getArea_name() {
        return area_name;
    }

    public void setArea_name(String area_name) {
        this.area_name = area_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getType_contract_id() {
        return type_contract_id;
    }

    public void setType_contract_id(int type_contract_id) {
        this.type_contract_id = type_contract_id;
    }

}
