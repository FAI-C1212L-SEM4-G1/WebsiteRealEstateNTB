package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;

/**
 *
 * @author PhanAnh
 */
public class ControllerListProfileLand extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init(); 
    }    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int page = 1;
//        int recordsPerPage = 5;
//        if(request.getParameter("page") != null)
//            page = Integer.parseInt(request.getParameter("page"));
        
        ConfigConnection modelManage = ConfigConnection.getInstance();
        List<ProfileLand> list = modelManage.getProfileLandModelManage().findAll();
//        int noOfRecords = dao.getNoOfRecords();
//        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("list", list);
//        request.setAttribute("noOfPages", noOfPages);
//        request.setAttribute("currentPage", page);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/profileland/listprofileland.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    public void destroy() {
        super.destroy(); 
    }
}
