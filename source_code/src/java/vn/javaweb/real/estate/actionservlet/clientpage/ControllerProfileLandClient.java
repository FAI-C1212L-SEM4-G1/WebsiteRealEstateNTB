package vn.javaweb.real.estate.actionservlet.clientpage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.manage.ProfileLandModelManage;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;

/**
 *
 * @author PhanAnh
 */
public class ControllerProfileLandClient extends HttpServlet {

    private final String LIST_VIEW = "/listing.jsp";
    private final String DETAILS = "/detail.jsp";
    private final String REGISTER = "/customerorder.jsp";
    
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
        String action = req.getParameter("action");        
        String forward = "";
        
        if(action.equals("details")){
            String code = req.getParameter("code");
            ProfileLand profileLand = modelManage.getProfileLandModelManage().findByCode(code);
            req.setAttribute("object", profileLand);
            forward = DETAILS;
        } else {
            if(action.equals("register")){
                String code = req.getParameter("code");
                ProfileLand profileLand = modelManage.getProfileLandModelManage().findByCode(code);
                req.setAttribute("object", profileLand);
                forward = REGISTER;
            } else {
               if(action.equals("list")){
                    int page = 1;
                    int recordsPerPage = 10;
                    if (req.getParameter("page") != null) {
                        page = Integer.parseInt(req.getParameter("page"));
                    }
                    List<ProfileLand> listData = modelManage.getProfileLandModelManage().findBetween((page - 1) * recordsPerPage, page * recordsPerPage);
                    int noOfRecords = modelManage.getProfileLandModelManage().getProfileLandCount();
                    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                    req.setAttribute("listData", listData);
                    req.setAttribute("noOfPages", noOfPages);
                    req.setAttribute("currentPage", page);
                    forward = LIST_VIEW;
               } else {
                  if(action.equals("filter")){
                      String codeRegional = req.getParameter("codeRegional");
                      String type = req.getParameter("typeSearch");
                      String txtSearch = req.getParameter("txtSearch");
                      ProfileLandModelManage.ConstructionStatus constructionStatus;
                      if(type.equalsIgnoreCase("byDateNotStarted")){
                          constructionStatus = ProfileLandModelManage.ConstructionStatus.NotStarted;
                      } else {
                        if(type.equalsIgnoreCase("byDateUnder")){
                            constructionStatus = ProfileLandModelManage.ConstructionStatus.UnderConstruction;
                        } else {
                            constructionStatus = ProfileLandModelManage.ConstructionStatus.Completed;
                        }
                      }
                      int page = 1;
                        int recordsPerPage = 15;
                        List<ProfileLand> listData = ConfigConnection.getInstance().getProfileLandModelManage().findConditions(txtSearch, codeRegional, constructionStatus);
                        //TODO: Xu ly phan trang cho tim kiem (Xem lai)
                        int noOfRecords = listData.size();
                        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                        req.setAttribute("listData", listData);
                        req.setAttribute("noOfPages", noOfPages);
                        req.setAttribute("currentPage", page);
                        forward = LIST_VIEW;
                  } 
               }
            }
        }
        req.getRequestDispatcher(forward).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    public void destroy() {
        super.destroy(); 
    }
    
}
