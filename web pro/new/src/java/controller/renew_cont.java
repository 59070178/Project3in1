/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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
import model.Agreement;
import model.Announce;
import model.Contract;
import model.DateExample;
import model.Payment;
import model.Place;

/**
 *
 * @author Suttida Sat
 */
@WebServlet(name = "renew_cont", urlPatterns = {"/renew_cont"})
public class renew_cont extends HttpServlet {

    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             HttpSession session = request.getSession();
            Agreement arg = (Agreement) session.getAttribute("Agreement");
            Account account = (Account) session.getAttribute("account_info");
            int account_id = account.getAccount_id();
            Statement stmt = conn.createStatement();
            String sql = "select * from payment\n"
                    + "join indenture\n"
                    + "using (payment_id)\n"
                    + "join inden_area\n"
                    + "using(i_id)\n"
                    + "where i_id = \n"
                    + "(select max(i_id)\n"
                    + "from indenture\n"
                    + "where account_id =" + account_id + "\n"
                    + "and type_contract_id = 2\n"
                    + ")";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            
            Place place = new Place();
            place.setConn(conn);
            place.setPlaceID(rs.getInt("area_id"));
            place.setPlace_name(arg.getPlace_number());
            place.setType(arg.getPlace_type());
            place.setPrice(Float.parseFloat(arg.getCost()));
            session.setAttribute("rentPlace", place);

            DateExample dt = new DateExample();
            Date start_date = Date.valueOf(rs.getString("end_date"));
            String end_date_s = dt.reNewRentdateContract(start_date);
            Date end_date = Date.valueOf(end_date_s);

            Contract contract = new Contract();
            contract.setStartDate(start_date);
            contract.setEndDate(end_date);
            contract.setAccount_id(account.getAccount_id());
            session.setAttribute("rentContract", contract);

            Payment payment = new Payment();
            payment.setConn(conn);
            payment.setPriceRent(rs.getFloat("price"));
            payment.setType_contract_id(2);
            session.setAttribute("rentPayment", payment);
            
             //find announce
            Announce announce = new Announce();
            announce.setConn(conn);
            announce.setInformation("Rent");
            session.setAttribute("rentAnnounce_details", announce);
            
            session.setAttribute("type_contract_name", "Rent");
//            
            RequestDispatcher pg = request.getRequestDispatcher("agreement_rent.jsp");
            pg.forward(request, response);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(renew_cont.class.getName()).log(Level.SEVERE, null, ex);
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
