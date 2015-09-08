package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.javaweb.real.estate.manage.ProfileLandModelManage;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.PaymentMode;
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
        ConfigConnection modelManage = getSessionModel(req);
        
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
                    if (action.equalsIgnoreCase("Search")) {
                        String txtSearch = req.getParameter("txtSearch");
                        String type = req.getParameter("typeSearch");
                        int page = 1;
                        int recordsPerPage = 15;
                        List<ProfileLand> listData = new ArrayList<>();
                        if (type.equalsIgnoreCase("byName")) {
                            listData = ConfigConnection.getInstance().getProfileLandModelManage().findByName(txtSearch);
                        } else {
                            if (type.equalsIgnoreCase("byTypeOf")) {
                                listData = ConfigConnection.getInstance().getProfileLandModelManage().findByTypeOf(txtSearch);
                            } else {
                                if (type.equalsIgnoreCase("byLocation")) {
                                    listData = ConfigConnection.getInstance().getProfileLandModelManage().findByLocation(txtSearch);
                                } else {
                                    if (type.equalsIgnoreCase("byDateNotStarted")) {
                                        listData = ConfigConnection.getInstance().getProfileLandModelManage().findByConstructionStatus(ProfileLandModelManage.ConstructionStatus.NotStarted);
                                    } else {
                                        if (type.equalsIgnoreCase("byDateUnder")) {
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
        String code = "", codeRegional = "", name = "", location = "", typeOf = "", totalArea = "0", capitalInvestment = "", dateStart = "", dateEnd = "";
        String currentStatus = "", populationSize = "0", totalRoom = "0", totalFloor = "0", roomArea = "0", introduction = "", description = "", imageName = "", image = "", action = "", hitspay = "";
        Map<String, String> percent = new HashMap<>(); 
        Map<String, String> deadlineDate = new HashMap<>(); 
        
        if (ServletFileUpload.isMultipartContent(req)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
                String directoryUpload = req.getSession().getAttribute("directory.root") + File.separator + "web" + File.separator + "images";
                boolean flagImage = false;
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        imageName = new File(item.getName()).getName();
                        if (!imageName.equals("")) {
                            flagImage = true;
                            item.write(new File(directoryUpload + File.separator + imageName));                            
                            System.out.println("Uploaded image successfully: " + imageName);                            
                        } else {                            
                            System.out.println("Not choose file!");
                        }
                    } else {
                        if(item.getFieldName().equals("code"))
                            code = item.getString();
                        if(item.getFieldName().equals("codeRegional"))
                            codeRegional = item.getString();
                        if(item.getFieldName().equals("name"))
                            name = item.getString();
                        if(item.getFieldName().equals("location"))
                            location = item.getString();
                        if(item.getFieldName().equals("typeOf"))
                            typeOf = item.getString();
                        if(item.getFieldName().equals("totalArea"))
                            totalArea = item.getString();
                        if(item.getFieldName().equals("capitalInvestment"))
                            capitalInvestment = item.getString();
                        if(item.getFieldName().equals("dateStart"))
                            dateStart = item.getString();
                        if(item.getFieldName().equals("dateEnd"))
                            dateEnd = item.getString();
                        if(item.getFieldName().equals("currentStatus"))
                            currentStatus = item.getString();
                        if(item.getFieldName().equals("populationSize"))
                            populationSize = item.getString();
                        if(item.getFieldName().equals("totalRoom"))
                            totalRoom = item.getString();
                        if(item.getFieldName().equals("totalFloor"))
                            totalFloor = item.getString();
                        if(item.getFieldName().equals("roomArea"))
                            roomArea = item.getString();
                        if(item.getFieldName().equals("description"))
                            introduction = item.getString();
                        if(item.getFieldName().equals("details"))
                            description = item.getString();
                        if(item.getFieldName().equals("image"))
                            image = item.getString();
                        if(item.getFieldName().equals("hitspay"))
                            hitspay = item.getString();
                        if(item.getFieldName().equals("hitspay"))
                            hitspay = item.getString();
                        if(item.getFieldName().contains("percent")){
                            percent.put(item.getFieldName(), item.getString());
                        }
                        if(item.getFieldName().contains("deadlineDate"))
                            deadlineDate.put(item.getFieldName(), item.getString());
                        if(item.getFieldName().equals("action"))
                            action = item.getString();                 
                    }
                }
                if(!flagImage) imageName = image;
            } catch (Exception ex) {
                System.out.println("File Upload Failed due to " + ex);
            }
        } else {
            System.out.println("Sorry this Servlet only handles file upload request");
        }

        boolean flagAction = false;
        try {
            ConfigConnection modelManage = getSessionModel(req);
            RegionalPrice regionalPrice = modelManage.getRegionalPriceModelManage().findByCode(codeRegional);
            if (action.equalsIgnoreCase("add")) {
                ProfileLand profileLand = new ProfileLand();
                profileLand.setCode(code);
                profileLand.setCodeRegional(regionalPrice);
                profileLand.setName(name);
                profileLand.setLocation(location);
                profileLand.setTypeOf(typeOf);
                profileLand.setInvestors("National Territory Builders (NTB)");
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
                profileLand.setImage(imageName);                
                modelManage.getProfileLandModelManage().create(profileLand);

                if (!hitspay.equals("") && !hitspay.equals("0")) {
                    int count = Integer.parseInt(hitspay);
                    String percentPay = "";
                    String note = "";
                    PaymentMode paymentMode = new PaymentMode();
                    paymentMode.setCode("PM" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()));
                    paymentMode.setCountPay(count);
                    for (int i = 1; i <= count; i++) {
                        String p = percent.get("percent"+i);
                        String d = deadlineDate.get("deadlineDate" + i);
                        if (p == null || p.equals("")) {
                            p = "0";
                        }
                        if (d == null || d.equals("")) {
                            d = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                        }
                        percentPay = percentPay + (i > 1 ? "," : "") + p;
                        note = note + (i > 1 ? "," : "") + d;
                    }
                    paymentMode.setPercentPay(percentPay);
                    paymentMode.setNote(note);
                    paymentMode.setCodeProfileLand(profileLand);

                    modelManage.getPaymentModeModelManage().create(paymentMode);
                }
            } else {
                ProfileLand profileLand = modelManage.getProfileLandModelManage().findByCode(code);
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
                profileLand.setImage(imageName);
                modelManage.getProfileLandModelManage().edit(profileLand);

                if (!hitspay.equals("") && !hitspay.equals("0")) {
                    int count = Integer.parseInt(hitspay);
                    String percentPay = "";
                    String note = "";
                    PaymentMode paymentMode = profileLand.getPaymentMode();
                    paymentMode.setCountPay(count);
                    for (int i = 1; i <= count; i++) {
                        String p = percent.get("percent"+i);
                        String d = deadlineDate.get("deadlineDate" + i);
                        if (p == null || p.equals("")) {
                            p = "0";
                        }
                        if (d == null || d.equals("")) {
                            d = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                        }
                        percentPay = percentPay + (i > 1 ? "," : "") + p;
                        note = note + (i > 1 ? "," : "") + d;
                    }
                    paymentMode.setPercentPay(percentPay);
                    paymentMode.setNote(note);
                    paymentMode.setCodeProfileLand(profileLand);

                    modelManage.getPaymentModeModelManage().edit(paymentMode);
                }
            }

            flagAction = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerRegionalPrice.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (flagAction) {
            resp.sendRedirect(req.getContextPath() + "/ControllerProfileLand?action=list");
        } else {
            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error! Not suscess');");
            out.println("</script>");
        }
    }

    private ConfigConnection getSessionModel(HttpServletRequest req) {
        HttpSession session = req.getSession();
        ConfigConnection modelManage = (ConfigConnection) session.getAttribute("modelManage");
        if (modelManage == null) {
            modelManage = ConfigConnection.getInstance();
            session.setAttribute("modelManage", modelManage);
        }
        return modelManage;
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
