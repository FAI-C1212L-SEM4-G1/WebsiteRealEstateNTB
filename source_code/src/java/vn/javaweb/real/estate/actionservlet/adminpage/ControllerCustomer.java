package vn.javaweb.real.estate.actionservlet.adminpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.manage.ProfileLandModelManage;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.InvoiceTransaction;
import vn.javaweb.real.estate.model.Person;
import vn.javaweb.real.estate.model.ProfileLand;

/**
 *
 * @author PhanAnh
 */
public class ControllerCustomer extends HttpServlet {

    private final String INSERT_OR_EDIT = "/admin/buyer/addbuyer.jsp";
    private final String LIST_VIEW_WAIT = "/admin/buyer/listbuyerwaiting.jsp";
    private final String LIST_VIEW_ING = "/admin/buyer/listbuyer-ing.jsp";
    private final String LIST_VIEW_ED = "/admin/buyer/listbuyer-ed.jsp";
    private final String LIST_TRANS = "/admin/buyer/transactiondetails.jsp";

    public ControllerCustomer() {
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

        if (action.equalsIgnoreCase("sentmail")) {
            String codeBuyLand = req.getParameter("code");
            BuyLand buyLand = modelManage.getBuyLandModelManage().findByCode(codeBuyLand);
            Account account = buyLand.getUsername();

            final String username = "anhnnp.hdn.vn@gmail.com";
            final String password = "hdn142676301";
            // Recipient's email ID needs to be mentioned.
            // String to = "phananhhdnit@gmail.com"
            String to = account.getPerson().getEmail();
            // Sender's email ID needs to be mentioned
            String from = username;
            // Get system properties
            Properties props = new Properties();
            // Setup mail server SSL
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            // Get the default Session object.
            Session sessionMail = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            // Set response content type
            resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();

            try {
                // Create a default MimeMessage object.
                Message message = new MimeMessage(sessionMail);
                // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));
                // Set To: header field of the header.
                message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                // Set Subject: header field
                message.setSubject("(NTB Real Estate) Account Information housing");
                // Content send
                String content = "<h1>Hi " + account.getPerson().getFullname() + " !</h1>"
                        + "<p>I represent the company NTB resubmit your account information to register your property as follows:</p>"
                        + "<hr/>"
                        + "Name profile land: " + buyLand.getCodeProfileLand().getName() + "<br/>"
                        + "Location: " + buyLand.getCodeProfileLand().getLocation() + "<br/>"
                        + "Unit price: " + buyLand.getCodeProfileLand().getCodeRegional().getUnitPrice() + "$<br/>"
                        + "-------------------Account----------------------<br/>"
                        + "<a href=&quot;#&quot;/>Link URL click here</a><p>"
                        + "<b>Username: <i>" + account.getLoginId() + "</i></b><br/>"
                        + "<b>Password: <i>" + account.getPassword() + "</i></b></p>"
                        + "<hr/>"
                        + "<h5>Please contact us if you need support us hotline: +84 933 866 89</h5>";
                // Send the actual HTML message, as big as you like
                message.setContent(content, "text/html; charset=utf-8");
                // Send message
                Transport.send(message);

                System.out.println("Done send mail ...");

                String title = "Send Email";
                String res = "Sent message successfully....";
                String docType
                        = "<!doctype html public \"-//w3c//dtd html 4.0 "
                        + "transitional//en\">\n";
                out.println(docType
                        + "<html>\n"
                        + "<head><title>" + title + "</title></head>\n"
                        + "<body bgcolor=\"#f0f0f0\">\n"
                        + "<h1 align=\"center\">" + title + "</h1>\n"
                        + "<p align=\"center\">" + res + "</p>\n"
                        + "</body></html>");
            } catch (MessagingException mex) {
                mex.printStackTrace();
            }

        } else {
            if (action.equalsIgnoreCase("delete")) {
                String code = req.getParameter("code");
                try {
                    modelManage.getBuyLandModelManage().deleteByCode(code);
                    int page = 1;
                    int recordsPerPage = 15;
                    if (req.getParameter("page") != null) {
                        page = Integer.parseInt(req.getParameter("page"));
                    }
                    List<BuyLand> listData = modelManage.getBuyLandModelManage().findBuyerWaitBetween((page - 1) * recordsPerPage, page * recordsPerPage);
                    int noOfRecords = modelManage.getProfileLandModelManage().getProfileLandCount();
                    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                    req.setAttribute("listData", listData);
                    req.setAttribute("noOfPages", noOfPages);
                    req.setAttribute("currentPage", page);
                    forward = LIST_VIEW_WAIT;
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (action.equalsIgnoreCase("edit")) {
                    String code = req.getParameter("code");
                    req.setAttribute("object", modelManage.getBuyLandModelManage().findByCode(code));
                    req.setAttribute("readonly", " ");
                    forward = INSERT_OR_EDIT;
                } else {
                    if (action.equalsIgnoreCase("viewdetails")) {
                        String code = req.getParameter("code");
                        req.setAttribute("object", modelManage.getBuyLandModelManage().findByCode(code));
                        req.setAttribute("readonly", "readonly");
                        forward = INSERT_OR_EDIT;
                    } else {
                        if (action.equalsIgnoreCase("listwait")) {
                            int page = 1;
                            int recordsPerPage = 15;
                            if (req.getParameter("page") != null) {
                                page = Integer.parseInt(req.getParameter("page"));
                            }
                            List<BuyLand> listData = modelManage.getBuyLandModelManage().findBuyerWaitBetween((page - 1) * recordsPerPage, page * recordsPerPage);
                            int noOfRecords = modelManage.getBuyLandModelManage().findBuyerWait().size();
                            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                            req.setAttribute("listData", listData);
                            req.setAttribute("noOfPages", noOfPages);
                            req.setAttribute("currentPage", page);
                            forward = LIST_VIEW_WAIT;
                        } else {
                            if (action.equalsIgnoreCase("listpayi")) {
                                int page = 1;
                                int recordsPerPage = 15;
                                if (req.getParameter("page") != null) {
                                    page = Integer.parseInt(req.getParameter("page"));
                                }
                                List<BuyLand> listData = modelManage.getBuyLandModelManage().findBuyerIngBetween((page - 1) * recordsPerPage, page * recordsPerPage);
                                int noOfRecords = modelManage.getBuyLandModelManage().findBuyerIng().size();
                                int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                                req.setAttribute("listData", listData);
                                req.setAttribute("noOfPages", noOfPages);
                                req.setAttribute("currentPage", page);
                                forward = LIST_VIEW_ING;
                            } else {
                                if (action.equalsIgnoreCase("listpayf")) {
                                    int page = 1;
                                    int recordsPerPage = 15;
                                    if (req.getParameter("page") != null) {
                                        page = Integer.parseInt(req.getParameter("page"));
                                    }
                                    List<BuyLand> listData = modelManage.getBuyLandModelManage().findBuyerEdBetween((page - 1) * recordsPerPage, page * recordsPerPage);
                                    int noOfRecords = modelManage.getBuyLandModelManage().findBuyerEd().size();
                                    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
                                    req.setAttribute("listData", listData);
                                    req.setAttribute("noOfPages", noOfPages);
                                    req.setAttribute("currentPage", page);
                                    forward = LIST_VIEW_ED;
                                } else {
                                    if (action.equalsIgnoreCase("viewtrans")) {
                                        String code = req.getParameter("code");
                                        req.setAttribute("object", modelManage.getBuyLandModelManage().findByCode(code));
                                        forward = LIST_TRANS;
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
                                            forward = LIST_VIEW_WAIT;
                                        } else {
                                            forward = INSERT_OR_EDIT;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            req.getRequestDispatcher(forward).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equalsIgnoreCase("saveadd")) {
            actionCreateCustomer(req, resp);
        } else {
            if (action.equalsIgnoreCase("saveedit")) {
                actionEditCustomer(req, resp);
            } else {
                if (action.equalsIgnoreCase("sendmail")) {
                    actionSendMail(req, resp);
                } else {
                    if (action.equalsIgnoreCase("saveTrans")) {
                        actionSaveTransaction(req, resp);
                    }
                }
            }
        }

    }

    private void actionCreateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Account
        String loginId = req.getParameter("loginId");
        String password = req.getParameter("password");
        String status = req.getParameter("status");
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
        //Profile Land
        String codeProfileLand = req.getParameter("codeProfileLand");
        String codeHome = req.getParameter("codeHome");

        boolean flag = false;
        try {
            ConfigConnection modelManage = getSessionModel(req);
            ProfileLand profileLand = modelManage.getProfileLandModelManage().findByCode(codeProfileLand);

            Account account = new Account();
            account.setLoginId(loginId);
            account.setPassword(password);
            account.setStatus(status.toUpperCase());
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

            BuyLand buyLand = new BuyLand();
            buyLand.setCode(codeHome);
            buyLand.setCodeProfileLand(profileLand);
            buyLand.setUsername(account);
            buyLand.setNote(note);
            buyLand.setBuyDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            double totalPrice = profileLand.getRoomArea() * Double.parseDouble(profileLand.getCodeRegional().getUnitPrice());
            buyLand.setTotalPaid(Double.toString(totalPrice));
            buyLand.setHavePay("0");
            modelManage.getBuyLandModelManage().create(buyLand);

            flag = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
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

    private void actionEditCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Account
        String password = req.getParameter("password");
        String status = req.getParameter("status");
        //Person
        String fullname = req.getParameter("fullname");
        String birthday = req.getParameter("birthday");
        String gender = req.getParameter("gender");
        String avatar = req.getParameter("avatar");
        String address = req.getParameter("address");
        String tel = req.getParameter("tel");
        String email = req.getParameter("email");
        String note = req.getParameter("note");
        //Profile Land
        String codeHome = req.getParameter("codeHome");

        boolean flag = false;
        try {
            ConfigConnection modelManage = getSessionModel(req);

            BuyLand buyLand = modelManage.getBuyLandModelManage().findByCode(codeHome);
            Account account = buyLand.getUsername();
            account.setPassword(password);
            account.setStatus(status.toUpperCase());
            Person person = account.getPerson();
            person.setFullname(fullname);
            person.setBirthday(birthday);
            person.setGender(gender);
            person.setAvatar(avatar);
            person.setAddress(address);
            person.setTel(tel);
            person.setEmail(email);
            person.setNote(note);
            modelManage.getBuyLandModelManage().edit(buyLand);

            flag = true;
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
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

    private void actionSendMail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ConfigConnection modelManage = getSessionModel(req);
        String codeBuyLand = req.getParameter("code");
        BuyLand buyLand = modelManage.getBuyLandModelManage().findByCode(codeBuyLand);
        Account account = buyLand.getUsername();

        final String username = "anhnnp.hdn.vn@gmail.com";
        final String password = "hdn142676301";
        // Recipient's email ID needs to be mentioned.
        // String to = "phananhhdnit@gmail.com"
        String to = account.getPerson().getEmail();
        // Sender's email ID needs to be mentioned
        String from = username;
        // Get system properties
        Properties props = new Properties();
        // Setup mail server SSL
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Get the default Session object.
        Session sessionMail = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        // Set response content type
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(sessionMail);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            // Set Subject: header field
            message.setSubject("(NTB Real Estate) Account Information housing");
            // Content send
            String content = "<h1>Hi " + account.getPerson().getFullname() + " !</h1>"
                    + "<p>I represent the company NTB resubmit your account information to register your property as follows:</p>"
                    + "<hr/>"
                    + "Name profile land: " + buyLand.getCodeProfileLand().getName() + "<br/>"
                    + "Location: " + buyLand.getCodeProfileLand().getLocation() + "<br/>"
                    + "Unit price: " + buyLand.getCodeProfileLand().getCodeRegional().getUnitPrice() + "$<br/>"
                    + "-------------------Account----------------------<br/>"
                    + "<a href=&quot;#&quot;/>Link URL click here</a><p>"
                    + "<b>Username: <i>" + account.getLoginId() + "</i></b><br/>"
                    + "<b>Password: <i>" + account.getPassword() + "</i></b></p>"
                    + "<hr/>"
                    + "<h5>Please contact us if you need support us hotline: +84 933 866 89</h5>";
            // Send the actual HTML message, as big as you like
            message.setContent(content, "text/html; charset=utf-8");
            // Send message
            Transport.send(message);

            System.out.println("Done send mail ...");

            String title = "Send Email";
            String res = "Sent message successfully....";
            String docType
                    = "<!doctype html public \"-//w3c//dtd html 4.0 "
                    + "transitional//en\">\n";
            out.println(docType
                    + "<html>\n"
                    + "<head><title>" + title + "</title></head>\n"
                    + "<body bgcolor=\"#f0f0f0\">\n"
                    + "<h1 align=\"center\">" + title + "</h1>\n"
                    + "<p align=\"center\">" + res + "</p>\n"
                    + "</body></html>");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    private void actionSaveTransaction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ConfigConnection modelManage = getSessionModel(req);
        String codeBuyLand = req.getParameter("codeBuyLand");
        BuyLand buyLand = modelManage.getBuyLandModelManage().findByCode(codeBuyLand);
        int countPay = buyLand.getCodeProfileLand().getPaymentMode().getCountPay();
        List<InvoiceTransaction> invoiceTransactions = buyLand.getInvoiceTransactionList();
        if (invoiceTransactions == null) {
            invoiceTransactions = new ArrayList<>();
        }
        for (int i = 1; i <= countPay; i++) {
            String paid = req.getParameter("paid" + i);
            String datepaid = req.getParameter("datepaid" + i);
            if (paid != null && !paid.equals("")) {
                InvoiceTransaction transaction;
                if (invoiceTransactions.size() >= i) //                    transaction = invoiceTransactions.get(i-1);
                {
                    System.out.println("");
                } else {
                    transaction = new InvoiceTransaction();
                    invoiceTransactions.add(i - 1, transaction);
                }
                transaction = invoiceTransactions.get(i - 1);
                transaction.setCode("IT" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()));
                transaction.setCodeBuyLand(buyLand);
                transaction.setPaid(paid);
                if (datepaid != null && !datepaid.equals("")) {
                    transaction.setDateTrans(datepaid);
                } else {
                    transaction.setDateTrans(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
                }

                try {
                    modelManage.getInvoiceTransactionModelManage().create(transaction);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            buyLand.setInvoiceTransactionList(invoiceTransactions);
            try {
                modelManage.getBuyLandModelManage().create(buyLand);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
            }
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
