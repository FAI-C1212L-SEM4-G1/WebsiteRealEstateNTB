package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;
import vn.javaweb.real.estate.model.RegionalPrice;

/**
 *
 * @author PhanAnh
 */
public class ControllerRegionalPrice extends HttpServlet {

    private final String INSERT_OR_EDIT = "/admin/regionalprice/addregionalprice.jsp";
    private final String LIST_VIEW = "/admin/regionalprice/listregionalprice.jsp";
    
    @Override
    public void init() throws ServletException {
        super.init(); 
    }    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String forward = "";
        String action = req.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            String code = req.getParameter("code");
            try {
                RegionalPrice regionalPrice = ConfigConnection.getInstance().getRegionalPriceModelManage().findByCode(code);
                if(regionalPrice.getProfileLandList() != null && regionalPrice.getProfileLandList().size() > 0){
                    for(ProfileLand pl : regionalPrice.getProfileLandList()){
                        pl.setCodeRegional(null);
                        ConfigConnection.getInstance().getProfileLandModelManage().edit(pl);
                    }
                }
                ConfigConnection.getInstance().getRegionalPriceModelManage().deleteByCode(code);
                req.setAttribute("listData", ConfigConnection.getInstance().getRegionalPriceModelManage().findAll());
                forward = LIST_VIEW;
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            if (action.equalsIgnoreCase("edit")) {
                String code = req.getParameter("code");
                req.setAttribute("object", ConfigConnection.getInstance().getRegionalPriceModelManage().findByCode(code));
                forward = INSERT_OR_EDIT;
            } else {
                if (action.equalsIgnoreCase("list")) {
                    int page = 1;
                    int recordsPerPage = 15;
                    if(req.getParameter("page") != null)
                        page = Integer.parseInt(req.getParameter("page"));
                    List<RegionalPrice> listData = ConfigConnection.getInstance().getRegionalPriceModelManage().findBetween((page-1)*recordsPerPage, page*recordsPerPage);
                    int noOfRecords = ConfigConnection.getInstance().getRegionalPriceModelManage().getRegionalPriceCount();
                    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                    req.setAttribute("listData", listData);
                    req.setAttribute("noOfPages", noOfPages);
                    req.setAttribute("currentPage", page);
                    forward = LIST_VIEW;
                } else {
                    if(action.equalsIgnoreCase("Search")){
                        String txtSearch = req.getParameter("txtSearch");
                        String type = req.getParameter("typeSearch");
                        int page = 1;
                        int recordsPerPage = 15;
                        List<RegionalPrice> listData = new ArrayList<>();
                        if (type.equalsIgnoreCase("byRegionalName")) {
                            listData = ConfigConnection.getInstance().getRegionalPriceModelManage().findByRegionalNameLike(txtSearch);                            
                        } else {
                            if(type.equalsIgnoreCase("byCity")){
                                listData = ConfigConnection.getInstance().getRegionalPriceModelManage().findByCity(txtSearch);                            
                            } else {
                                if(type.equalsIgnoreCase("byCountry")){
                                    listData = ConfigConnection.getInstance().getRegionalPriceModelManage().findByCountry(txtSearch);                            
                                }
                            }
                        }
                        //TODO: Xu ly phan trang cho tim kiem (Xem lai)
                        int noOfRecords = listData.size();
                        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                        req.setAttribute("listData", listData);
                        req.setAttribute("noOfPages", noOfPages);
                        req.setAttribute("currentPage", page);
                        forward = LIST_VIEW;
                    } else {
                        forward = INSERT_OR_EDIT;
                    }
                } 
            }
        }
        req.getRequestDispatcher(forward).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {        
        String code = req.getParameter("code");
        String regionalName = req.getParameter("regionalName");
        String city = req.getParameter("city");
        String country = req.getParameter("country");
        String unitPrice = req.getParameter("unitPrice");       
        String action = req.getParameter("action");
                               
        RegionalPrice regionalPrice;
        boolean flag = false;
        try {
            if(action.equalsIgnoreCase("add")){
                regionalPrice = new RegionalPrice();
                regionalPrice.setCode(code);
                regionalPrice.setRegionalName(regionalName);
                regionalPrice.setCity(city);
                regionalPrice.setCountry(country);
                regionalPrice.setUnitPrice(unitPrice); 
               ConfigConnection.getInstance().getRegionalPriceModelManage().create(regionalPrice); 
            } else {
                regionalPrice = ConfigConnection.getInstance().getRegionalPriceModelManage().findByCode(code);
                regionalPrice.setRegionalName(regionalName);
                regionalPrice.setCity(city);
                regionalPrice.setCountry(country);
                regionalPrice.setUnitPrice(unitPrice); 
                ConfigConnection.getInstance().getRegionalPriceModelManage().edit(regionalPrice); 
            }
            flag = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (flag) {
            resp.sendRedirect(req.getContextPath() + "/ControllerRegionalPrice?action=list");
        } else {
            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error! Not suscess');");
            out.println("</script>");
            req.getRequestDispatcher(req.getContextPath() + "/ControllerRegionalPrice?action=add").include(req, resp);
        }
    }

    @Override
    public void destroy() {
        super.destroy(); 
    }
        
}
