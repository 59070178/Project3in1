/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Contract;
import model.payment;

/**
 *
 * @author Suttida Sat
 */
@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet {

    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            HttpSession session = request.getSession(true);
            int id_user = (int) session.getAttribute("id_user");
            
            String Category = request.getParameter("typePayment");
            String bank = request.getParameter("bank");
            String date = request.getParameter("trans_date");
            String time = request.getParameter("trans_time");
            float amount = Float.parseFloat(request.getParameter("amount"));
            
            
            InputStream picInput = null;
            Part filePart = request.getPart("trans_image");
            
            if (filePart != null)
            {
                // obtains input stream of the upload file
                picInput = filePart.getInputStream();
            }
            
            Contract cont = new Contract();
            cont.setConn(conn);
            cont.setContractID(id_user);
            int i_id = cont.getContractID(id_user);
            
            payment pay = new payment();
            pay.setConn(conn);
            pay.setPrice(amount);
            pay.setDate_time(date +" "+ time);
            pay.setBank(bank);
            pay.setPicInput(picInput);
            
//            if(Category.equals("book")){
//                pay.setPayment_id_book(i_id);
//                pay.addPayBook();
//            }
//            if(Category.equals("rent")){
//                pay.setPayment_id_Rent(i_id);
//                pay.addPayRent();
//            }
//            
//            response.sendRedirect("successPayment.html");
            //System.out.println(filePart.getName());
out.println(request.getPart("trans_image"));
        } catch (SQLException ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
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
