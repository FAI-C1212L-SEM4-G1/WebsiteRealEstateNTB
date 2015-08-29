package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.ConfigConnection;

/**
 *
 * @author PhanAnh
 */
public class ControllerAuthencationLogin extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init(); 
    }    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        Account account = ConfigConnection.getInstance().getAccountModelManage().checkAccount(username, password);
        if(account != null){
            HttpSession session = request.getSession(true);
            session.setAttribute("account", account);
            response.sendRedirect(request.getContextPath() + "/ControllerProfileLand?action=list");            
        } else {
            PrintWriter pw = response.getWriter();
            request.getRequestDispatcher("/admin/login.jsp").include(request, response);
            pw.println("<html><head></head><body><font color=red>Either user name or password is wrong.</font></body></html>");
            
        }
    }

    @Override
    public void destroy() {
        super.destroy(); 
    }
}
