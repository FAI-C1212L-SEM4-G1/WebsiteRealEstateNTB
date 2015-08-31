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
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.manage.ProfileLandModelManage;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;
import vn.javaweb.real.estate.model.RegionalPrice;

/**
 *
 * @author PhanAnh
 */
public class ControllerProfileLand extends HttpServlet {

    private final String INSERT_OR_EDIT = "/admin/profileland/addprofileland.jsp";
    private final String LIST_VIEW = "/admin/profileland/listprofileland.jsp";

    public ControllerProfileLand() {
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String forward = "";
        String action = req.getParameter("action");
        HttpSession session = req.getSession();        
        ConfigConnection modelManage = (ConfigConnection)session.getAttribute("modelManage");
        if(modelManage == null){
            modelManage = ConfigConnection.getInstance(); 
            session.setAttribute("modelManage", modelManage);
        }
        if (action.equalsIgnoreCase("delete")) {
            String code = req.getParameter("code");
            try {
                modelManage.getProfileLandModelManage().deleteByCode(code);
                req.setAttribute("listData", modelManage.getProfileLandModelManage().findAll());
                forward = LIST_VIEW;
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ControllerProfileLand.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ControllerProfileLand.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControllerProfileLand.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            if (action.equalsIgnoreCase("edit")) {
                String code = req.getParameter("code");
                req.setAttribute("object", modelManage.getProfileLandModelManage().findByCode(code));
                forward = INSERT_OR_EDIT;
            } else {
                if (action.equalsIgnoreCase("list")) {
                    int page = 1;
                    int recordsPerPage = 15;
                    if(req.getParameter("page") != null)
                        page = Integer.parseInt(req.getParameter("page"));
                    List<ProfileLand> listData = modelManage.getProfileLandModelManage().findBetween((page-1)*recordsPerPage, page*recordsPerPage);
                    int noOfRecords = modelManage.getProfileLandModelManage().getProfileLandCount();
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
                        List<ProfileLand> listData = new ArrayList<>();
                        if (type.equalsIgnoreCase("byName")) {
                            listData = ConfigConnection.getInstance().getProfileLandModelManage().findByName(txtSearch);                            
                        } else {
                            if(type.equalsIgnoreCase("byTypeOf")){
                                listData = ConfigConnection.getInstance().getProfileLandModelManage().findByTypeOf(txtSearch);                            
                            } else {
                                if(type.equalsIgnoreCase("byLocation")){
                                    listData = ConfigConnection.getInstance().getProfileLandModelManage().findByLocation(txtSearch);                            
                                } else {
                                    if(type.equalsIgnoreCase("byDateNotStarted")){
                                        listData = ConfigConnection.getInstance().getProfileLandModelManage().findByConstructionStatus(ProfileLandModelManage.ConstructionStatus.NotStarted);                            
                                    } else {
                                        if(type.equalsIgnoreCase("byDateUnder")){
                                            listData = ConfigConnection.getInstance().getProfileLandModelManage().findByConstructionStatus(ProfileLandModelManage.ConstructionStatus.UnderConstruction);                            
                                        } else {
                                            listData = ConfigConnection.getInstance().getProfileLandModelManage().findByConstructionStatus(ProfileLandModelManage.ConstructionStatus.Completed);                            
                                        }
                                    }
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
        String codeRegional = req.getParameter("codeRegional");
        String name = req.getParameter("name");
        String location = req.getParameter("location");
        String typeOf = req.getParameter("typeOf");
        String totalArea = req.getParameter("totalArea");
        String capitalInvestment = req.getParameter("capitalInvestment");
        String dateStart = req.getParameter("dateStart");
        String dateEnd = req.getParameter("dateEnd");
        String currentStatus = req.getParameter("currentStatus");
        String populationSize = req.getParameter("populationSize");
        String totalRoom = req.getParameter("totalRoom");
        String totalFloor = req.getParameter("totalFloor");
        String roomArea = req.getParameter("roomArea");
        String introduction = req.getParameter("description");
        String description = req.getParameter("details");
        String image = req.getParameter("Choose picture");
        String action = req.getParameter("action");

        boolean flag = false;
        try {
            RegionalPrice regionalPrice = ConfigConnection.getInstance().getRegionalPriceModelManage().findByCode(codeRegional);
            if(action.equalsIgnoreCase("add")){
                ProfileLand profileLand = new ProfileLand();
                profileLand.setCode(code);
                profileLand.setCodeRegional(regionalPrice);
                profileLand.setName(name);
                profileLand.setLocation(location);
                profileLand.setTypeOf(typeOf);
                profileLand.setTotalArea(Double.parseDouble(totalArea));
                profileLand.setCapitalInvestment(capitalInvestment);
                profileLand.setDateStart(dateStart);
                profileLand.setDateEnd(dateEnd);
                profileLand.setCurrentStatus(currentStatus);
                profileLand.setPopulationSize(Double.parseDouble(populationSize));
                profileLand.setTotalRoom(Integer.parseInt(totalRoom));
                profileLand.setTotalFloor(Integer.parseInt(totalFloor));
                profileLand.setRoomArea(Integer.parseInt(roomArea));
                profileLand.setIntroduction(introduction);
                profileLand.setDescription(description);
                profileLand.setImage(image);
                ConfigConnection.getInstance().getProfileLandModelManage().create(profileLand);
            } else {
                ProfileLand profileLand = ConfigConnection.getInstance().getProfileLandModelManage().findByCode(code);
                profileLand.setCode(code);
                profileLand.setCodeRegional(regionalPrice);
                profileLand.setName(name);
                profileLand.setLocation(location);
                profileLand.setTypeOf(typeOf);
                profileLand.setTotalArea(Double.parseDouble(totalArea));
                profileLand.setCapitalInvestment(capitalInvestment);
                profileLand.setDateStart(dateStart);
                profileLand.setDateEnd(dateEnd);
                profileLand.setCurrentStatus(currentStatus);
                profileLand.setPopulationSize(Double.parseDouble(populationSize));
                profileLand.setTotalRoom(Integer.parseInt(totalRoom));
                profileLand.setTotalFloor(Integer.parseInt(totalFloor));
                profileLand.setRoomArea(Integer.parseInt(roomArea));
                profileLand.setIntroduction(introduction);
                profileLand.setDescription(description);
                profileLand.setImage(image);
                ConfigConnection.getInstance().getProfileLandModelManage().edit(profileLand);
            }
            
            flag = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (flag) {
            resp.sendRedirect(req.getContextPath() + "/ControllerProfileLand?action=list");
        } else {
            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error! Not suscess');");
            out.println("</script>");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
