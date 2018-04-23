package controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import model.Account;
import model.Login;

/**
 *
 * @author Suttida Sat
 */
@WebServlet(urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

   private Connection conn;
    
    public void init(){
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /// encode character can read thai 
            request.setCharacterEncoding("UTF-8");

            HttpSession session = request.getSession(true);
            
            String username = request.getParameter("name");
            String psw = request.getParameter("pass");
            int id_user = 0; 

//           out.println(username + " " + psw);
             Login user = new Login();
             user.setConn(conn);
            boolean chk = user.checkLogin(username, psw);
            
            ///get firstname lastname
            Account account = new Account();
            account.setConn(conn);
            
            account.setAccount_id(username, psw);
            id_user = account.getAccount_id();
            
            account.setAccount_type(id_user);
            String account_type = account.getAccount_type();

//            account.setFirstname(id_user);
//            String fname = account.getFirstname();
//            
//            account.setLastname(id_user);
//            String lname = account.getLastname();
//            
            session.setAttribute("id_user", id_user);
            session.setAttribute("username", username);
            session.setAttribute("account_type", account_type);
//             session.setAttribute("fname", fname);
//             session.setAttribute("lname", lname);
            
            if(chk)
        {
            request.setAttribute("account_type", account_type);
            response.sendRedirect("home2.jsp");
            
        }else{
                out.println("<h1 align = 'center' color = 'red'>"+"*** Username or Password incorrect");
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response);

            }
                
           
        
    }  catch (SQLException ex) {  
           Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
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