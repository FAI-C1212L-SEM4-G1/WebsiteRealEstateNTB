package vn.javaweb.real.estate.actionservlet.clientpage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;

/**
 *
 * @author PhanAnh
 */
public class ControllerProfileLandClient extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init(); 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ConfigConnection modelManage = (ConfigConnection) session.getAttribute("modelManage");
        if (modelManage == null) {
            modelManage = ConfigConnection.getInstance();
            session.setAttribute("modelManage", modelManage);
        }
        
        String code = req.getParameter("code");
        ProfileLand profileLand = modelManage.getProfileLandModelManage().findByCode(code);
        req.setAttribute("object", profileLand);
        req.getRequestDispatcher("/detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    public void destroy() {
        super.destroy(); 
    }
    
}
