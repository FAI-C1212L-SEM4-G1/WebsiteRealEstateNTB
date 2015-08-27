package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;
import vn.javaweb.real.estate.model.RegionalPrice;

/**
 *
 * @author PhanAnh
 */
public class ControllerAddProfileLand extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init(); 
    }    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
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
        
        ConfigConnection modelManage = ConfigConnection.getInstance();
        RegionalPrice regionalPrice = modelManage.getRegionalPriceModelManage().findByCode(codeRegional);       
        
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
        
        boolean flag = false;
        try {
            modelManage.getProfileLandModelManage().create(profileLand);
            flag = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerAddProfileLand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerAddProfileLand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(flag){
            req.getRequestDispatcher("admin/profileland/ControllerListProfileLand?page=0").forward(req, resp);
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
