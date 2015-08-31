package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.manage.AccountModelManage;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.Person;

/**
 *
 * @author PhanAnh
 */
public class ControllerAccount extends HttpServlet {

    private final String INSERT_OR_EDIT = "/admin/account/addaccount.jsp";
    private final String LIST_VIEW = "/admin/account/listaccount.jsp";
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config); 
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
                Account account = modelManage.getAccountModelManage().findByLoginId(code);
                modelManage.getPersonModelManage().deleteById(account.getPerson().getId());
                modelManage.getAccountModelManage().deleteByLoginId(code);
                int page = 1;
                int recordsPerPage = 15;
                if (req.getParameter("page") != null) {
                    page = Integer.parseInt(req.getParameter("page"));
                }
                List<Account> listData = modelManage.getAccountModelManage().findUserBetween((page - 1) * recordsPerPage, page * recordsPerPage);
                int noOfRecords = modelManage.getAccountModelManage().getUserCount();
                int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                req.setAttribute("listData", listData);
                req.setAttribute("noOfPages", noOfPages);
                req.setAttribute("currentPage", page);
                forward = LIST_VIEW;
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ControllerAccount.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ControllerAccount.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControllerAccount.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            if (action.equalsIgnoreCase("edit")) {
                String code = req.getParameter("code");                
                req.setAttribute("object", modelManage.getAccountModelManage().findByLoginId(code));
                forward = INSERT_OR_EDIT;
            } else {
                if (action.equalsIgnoreCase("list")) {
                    int page = 1;
                    int recordsPerPage = 15;
                    if(req.getParameter("page") != null)
                        page = Integer.parseInt(req.getParameter("page"));
                    List<Account> listData = modelManage.getAccountModelManage().findUserBetween((page-1)*recordsPerPage, page*recordsPerPage);
                    int noOfRecords = modelManage.getAccountModelManage().getUserCount();
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
                        List<Account> listData = new ArrayList<>();
                        if (type.equalsIgnoreCase("byLoginId")) {
                            listData.add(modelManage.getAccountModelManage().findByLoginId(txtSearch));                            
                        } else {
                            if(type.equalsIgnoreCase("byFullName")){
                                List<Person> persons = modelManage.getPersonModelManage().findByFullname(txtSearch); 
                                for(Person p : persons){
                                    listData.add(p.getUsername());
                                }
                            } else {
                                if(type.equalsIgnoreCase("byGender")){
                                    List<Person> persons = modelManage.getPersonModelManage().findByGender(txtSearch); 
                                    for(Person p : persons){
                                        listData.add(p.getUsername());
                                    }
                                } else {
                                    if(type.equalsIgnoreCase("byAddress")){
                                        List<Person> persons = modelManage.getPersonModelManage().findByAddress(txtSearch); 
                                        for(Person p : persons){
                                            listData.add(p.getUsername());
                                        }
                                    } else {
                                        if(type.equalsIgnoreCase("byEmail")){
                                            List<Person> persons = modelManage.getPersonModelManage().findByEmail(txtSearch); 
                                            for(Person p : persons){
                                                listData.add(p.getUsername());
                                            }
                                        } else {                                            
                                            if (type.equalsIgnoreCase("byStatus")) {
                                                AccountModelManage.AccountStatus accountStatus = AccountModelManage.AccountStatus.Active;                                                
                                                if(txtSearch.contains("active"))
                                                    accountStatus = AccountModelManage.AccountStatus.Active;
                                                else if(txtSearch.contains("blocked"))
                                                    accountStatus = AccountModelManage.AccountStatus.Blocked;
                                                else if(txtSearch.contains("waiting"))
                                                    accountStatus = AccountModelManage.AccountStatus.Waiting;
                                                else if(txtSearch.contains("inactive"))
                                                    accountStatus = AccountModelManage.AccountStatus.Inactive;                                                
                                                listData = modelManage.getAccountModelManage().findAllUserByStatus(accountStatus);
                                            } else {
                                                // ByTel
                                                List<Person> persons = modelManage.getPersonModelManage().findByTel(txtSearch);
                                                for (Person p : persons) {
                                                    listData.add(p.getUsername());
                                                }
                                            }
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
        //Account
        String loginId = req.getParameter("loginId");
        String password = req.getParameter("password");
        String status = req.getParameter("status");
        String createDate = req.getParameter("createDate");
        String role = req.getParameter("role");
        //Person
        String id = req.getParameter("id");
        String fullname = req.getParameter("fullname");
        String birthday = req.getParameter("birthday");
        String gender = req.getParameter("gender");
        String avatar = req.getParameter("avatar");
        String address = req.getParameter("address");
        String tel = req.getParameter("tel");
        String email = req.getParameter("email");
        String note = req.getParameter("note");
        String action = req.getParameter("action");
        
        Enumeration<String> e = req.getParameterNames();
        while (e.hasMoreElements()) {
            String nextElement = e.nextElement();
            System.out.println("Parameter: " + nextElement + ": " + req.getParameter(nextElement));
        }

        boolean flag = false;
        try {
            HttpSession session = req.getSession();
            ConfigConnection modelManage = (ConfigConnection) session.getAttribute("modelManage");
            if (modelManage == null) {
                modelManage = ConfigConnection.getInstance();
                session.setAttribute("modelManage", modelManage);
            }
            if(action.equalsIgnoreCase("add")){
                Account account = new Account();
                account.setLoginId(loginId);
                account.setPassword(password);
                account.setStatus(status.toUpperCase());
                if(role.equalsIgnoreCase("admin"))                    
                    account.setRole(0);
                else if(role.equalsIgnoreCase("user"))
                    account.setRole(1);
                else if(role.equalsIgnoreCase("customer"))
                    account.setRole(2);
                modelManage.getAccountModelManage().create(account);
                
                Person person = new Person();
                person.setId(id);
                person.setUsername(account);
                person.setFullname(fullname);
                person.setBirthday(birthday);
                person.setGender(gender);
                person.setAvatar(avatar);
                person.setAddress(address);
                person.setTel(tel);
                person.setEmail(email);
                person.setNote(note);
                modelManage.getPersonModelManage().create(person);                
            } else {
                Account account = modelManage.getAccountModelManage().findByLoginId(loginId);
                account.setPassword(password);
                account.setStatus(status.toUpperCase());
                if(role.equalsIgnoreCase("admin"))                    
                    account.setRole(0);
                else if(role.equalsIgnoreCase("user"))
                    account.setRole(1);
                else if(role.equalsIgnoreCase("customer"))
                    account.setRole(2);
                Person person = account.getPerson();
                person.setFullname(fullname);
                person.setBirthday(birthday);
                person.setGender(gender);
                person.setAvatar(avatar);
                person.setAddress(address);
                person.setTel(tel);
                person.setEmail(email);
                person.setNote(note);
                modelManage.getAccountModelManage().edit(account);
            }            
            flag = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (flag) {
            resp.sendRedirect(req.getContextPath() + "/ControllerAccount?action=list");
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
        
    }
        
}
