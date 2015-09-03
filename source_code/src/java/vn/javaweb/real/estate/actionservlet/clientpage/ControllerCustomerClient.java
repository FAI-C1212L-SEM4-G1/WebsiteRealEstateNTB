package vn.javaweb.real.estate.actionservlet.clientpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.manage.AccountModelManage;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.Person;
import vn.javaweb.real.estate.model.ProfileLand;

/**
 *
 * @author PhanAnh
 */
public class ControllerCustomerClient extends HttpServlet {

    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ConfigConnection modelManage = (ConfigConnection) session.getAttribute("modelManage");
        if (modelManage == null) {
            modelManage = ConfigConnection.getInstance();
            session.setAttribute("modelManage", modelManage);
        }
        boolean flag = false;
        String action = req.getParameter("action");
        if (action.equals("CustomerSubmit")) {
            String id = req.getParameter("txtPersonId");
            String fullname = req.getParameter("txtFullname");
            String email = req.getParameter("txtEmail");
            String tel = req.getParameter("txtTel");
            String address = req.getParameter("txtAddress");
            String codeProfileLand = req.getParameter("codeProfileLand");
            String codeHome = req.getParameter("codeHome");
            ProfileLand profileLand = modelManage.getProfileLandModelManage().findByCode(codeProfileLand);

            try {
                Account account = new Account();
                account.setLoginId(email.split("@")[0].toLowerCase());
                account.setPassword("0000");
                account.setStatus(AccountModelManage.AccountStatus.Waiting.toString());
                account.setRole(2);
                modelManage.getAccountModelManage().create(account);

                Person person = new Person();
                person.setId(id);
                person.setUsername(account);
                person.setFullname(fullname);
                person.setAddress(address);
                person.setTel(tel);
                person.setEmail(email);
                modelManage.getPersonModelManage().create(person);

                BuyLand buyLand = new BuyLand();
                buyLand.setCode(codeHome);
                buyLand.setCodeProfileLand(profileLand);
                buyLand.setUsername(account);
                buyLand.setBuyDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
                double totalPrice = profileLand.getRoomArea() * Double.parseDouble(profileLand.getCodeRegional().getUnitPrice());
                buyLand.setTotalPaid(Double.toString(totalPrice));
                buyLand.setHavePay("0");
                modelManage.getBuyLandModelManage().create(buyLand);
                flag = false;
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ControllerCustomerClient.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControllerCustomerClient.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (flag) {
                resp.sendRedirect(req.getContextPath() + "/index.jsp");
            } else {
                PrintWriter out = resp.getWriter();
                resp.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error! Not suscess');");
                out.println("</script>");
            }
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }

}
