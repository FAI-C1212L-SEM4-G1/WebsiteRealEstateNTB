package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.File;
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
        String queryString = request.getQueryString();
        if(queryString != null && queryString.contains("action=logout")){
           HttpSession session = request.getSession(false);
           session.removeAttribute("account");
           session.removeAttribute("object");
           session.invalidate();
           response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        } else {
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        ConfigConnection modelManage = ConfigConnection.getInstance();
        Account account = modelManage.getAccountModelManage().checkAccount(username, password);
        if(account != null){
            HttpSession session = request.getSession(true);
            session.setAttribute("account", account);
            session.setAttribute("modelManage", modelManage);
            String path = getServletContext().getRealPath("/");
            String directoryUpload = path.substring(0, path.lastIndexOf("\\build"));
            session.setAttribute("directory.root", directoryUpload);
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
