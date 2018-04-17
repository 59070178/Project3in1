package controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            
//            Statement stmt = conn.createStatement();
//            String sql = "SELECT account_id , username , password FROM account WHERE username ='"+username+"'";
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()){
//               if (rs.getString("username").equals(username) && rs.getString("password").equals(psw)) {  
//                   id_user = rs.getInt("account_id");
//                   session.setAttribute("user", id_user);
//                   RequestDispatcher dp = request.getRequestDispatcher("view_monthExpanse.html");
//                    dp.forward(request, response);
//                  }
//                   
//            }
           
            Login user = (Login)session.getAttribute("user");
            if (user == null){
                ServletContext ctx = getServletContext();
                Connection conn = (Connection)ctx.getAttribute("connection");
                user = new Login(conn);
                session.setAttribute("user", user);
            }
            
            boolean chk = user.checkLogin(username, psw);
            id_user = user.getId(username, psw);
            session.setAttribute("id_user", id_user);
            if(chk)
        {
            RequestDispatcher rs = request.getRequestDispatcher("view_monthExpanse.html");
            rs.forward(request, response);
        }else{
                out.println("Username or Password incorrect");
           RequestDispatcher rs = request.getRequestDispatcher("login.html");
           rs.include(request, response);
            }
                
           
        
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
