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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agreement;
import model.DateExample;

/**
 *
 * @author Suttida Sat
 */
@WebServlet(name = "chkCanRenew", urlPatterns = {"/chkCanRenew"})
public class chkCanRenew extends HttpServlet {

    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             HttpSession session = request.getSession(true);
             int i_id = (int) session.getAttribute("i_id");
             
            Agreement agm = new Agreement();
            agm.setConn(conn);
            agm.setPayment_id_Rent(i_id);
            agm.setE_date(i_id);
            Date e = agm.getE_date();
            ///get date now
            DateExample dat = new DateExample();
            boolean chk = dat.chkFor_renew(e);

            if(chk){
                    RequestDispatcher dp = request.getRequestDispatcher("renew_cont");
                dp.forward(request, response);
            }else{
                 out.println("<center>" + "Sorry is not time to renew" + "</center>");
                RequestDispatcher dp = request.getRequestDispatcher("view_agm_rent");
                dp.include(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(chkCanRenew.class.getName()).log(Level.SEVERE, null, ex);
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
