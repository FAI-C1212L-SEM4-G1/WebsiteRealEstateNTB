package vn.javaweb.real.estate.filterservlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.ConfigConnection;

/**
 *
 * @author PhanAnh
 */
public class FilterAuthorizationAccount implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
            HttpServletRequest servletRequest = (HttpServletRequest) request;
            HttpServletResponse servletResponse = (HttpServletResponse) response;

            String servletPath = servletRequest.getServletPath();
            HttpSession session = servletRequest.getSession(false);

            if (servletPath.contains("customerinvoice.jsp")) {
                if (session == null || session.getAttribute("object") == null) {
                    servletResponse.sendRedirect(servletRequest.getContextPath() + "/login.html");
                    return;
                }
            }

            String username = servletRequest.getParameter("txtUsername");
            String password = servletRequest.getParameter("txtPassword");
            if (username != null && password != null) {
                ConfigConnection modelManage = ConfigConnection.getInstance();
                Account account = modelManage.getAccountModelManage().checkAccount(username, password);
                if (account != null && account.getRole() == 2 && account.getStatus().equals("ACTIVE")) {
                    servletRequest.getSession(true).setAttribute("object", account.getBuyLandList().get(0));
                    servletResponse.sendRedirect(servletRequest.getContextPath() + "/customerinvoice.jsp");
                    return;
                }
            }

            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }

}
