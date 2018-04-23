/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Address;
import model.Contract;

/**
 *
 * @author asus
 */
@WebServlet(name = "CusListDetails", urlPatterns = {"/CusListDetails"})
public class CusListDetails extends HttpServlet {

    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String account_id_S = request.getParameter("view_details");
            int view_account_id = Integer.parseInt(account_id_S);

            Statement stmt = conn.createStatement();
            
            String sql1 = "SELECT * From account join customer using (account_id) where account_id =" + view_account_id;
            ResultSet rs1 = stmt.executeQuery(sql1);
            rs1.next();
            
            Account account = new Account();
            account.setAccount_id(view_account_id);
            account.setUsername(rs1.getString("username"));
            account.setFullname(rs1.getString("firstname"), rs1.getString("lastname"));
            account.setPhone(rs1.getString("phone"));
            account.setGender(rs1.getString("gender"));
            request.setAttribute("account_info", account);
            
            Address address = new Address();
            address.setBan(rs1.getString("ban"));
            address.setSoi(rs1.getString("soi"));
            address.setDistrict(rs1.getString("district"));
            address.setArea(rs1.getString("area"));
            address.setCounty(rs1.getString("county"));
            address.setCode(rs1.getString("code"));
            request.setAttribute("address_info", address);
 
            String sql2 = "SELECT * From customer join indenture using (account_id) where account_id =" + view_account_id;
            ResultSet rs2 = stmt.executeQuery(sql2);
            rs2.next();
            int i_id = rs2.getInt("i_id");
            
            Contract contract = new Contract();
            contract.setContractID(i_id);
            contract.setStartDate(rs2.getDate("start_date"));
            contract.setEndDate(rs2.getDate("end_date"));
            
            String sql3 = "SELECT * From indenture join indenture using (account_id) where account_id =" + view_account_id;
            ResultSet rs3 = stmt.executeQuery(sql3);
            rs3.next();

        } catch (SQLException ex) {
            Logger.getLogger(CusListDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
