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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Address;

/**
 *
 * @author asus
 */
@WebServlet(name = "VeiwInfoCusServlet", urlPatterns = {"/VeiwInfoCusServlet"})
public class VeiwInfoCusServlet extends HttpServlet {

    Connection conn;

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
            
            HttpSession session = request.getSession();

            int id_user = (int) session.getAttribute("id_user");

            Statement stmt = conn.createStatement();
            String sql1 = "SELECT * From account WHERE account_id = " + id_user;
            ResultSet rs1 = stmt.executeQuery(sql1);
            rs1.next();

            Account account = new Account();
            account.setAccount_id(id_user);
            account.setUsername(rs1.getString("username"));
            account.setFullname(rs1.getString("firstname"), rs1.getString("lastname"));
            account.setPhone(rs1.getString("phone"));

            String sql2 = "SELECT * From customer WHERE account_id = " + id_user;
            ResultSet rs2 = stmt.executeQuery(sql2);
            rs2.next();

            account.setGender(rs2.getString("gender"));
            request.setAttribute("account_info", account);

            Address address = new Address();
            address.setBan(rs2.getString("ban"));
            address.setDistrict(rs2.getString("district"));
            address.setArea(rs2.getString("area"));
            address.setCounty(rs2.getString("county"));
            address.setCode(rs2.getString("code"));
            
            if(rs2.getString("soi") == null){
                address.setSoi(" ");
            }else
                address.setSoi(rs2.getString("soi"));
            
            

            request.setAttribute("address_info", address);

//            response.sendRedirect("profile_cus.jsp");
            RequestDispatcher dp = request.getRequestDispatcher("profile_cus.jsp");
            dp.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(VeiwInfoCusServlet.class.getName()).log(Level.SEVERE, null, ex);
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
