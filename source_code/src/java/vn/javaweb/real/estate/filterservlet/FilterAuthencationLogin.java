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

/**
 *
 * @author PhanAnh
 */
public class FilterAuthencationLogin implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
            HttpServletRequest servletRequest = (HttpServletRequest) request;
            HttpServletResponse servletResponse = (HttpServletResponse) response;

            String servletPath = servletRequest.getServletPath();
//            String uri = servletRequest.getRequestURI();
//            System.out.println("------");
//            System.out.println(" ___" + uri);

            if (servletPath.contains("ControllerProfileLand") || servletPath.contains("ControllerRegionalPrice") 
                    || servletPath.contains("ControllerAccount") || servletPath.contains("ControllerCustomer")) {
                HttpSession session = servletRequest.getSession(false);
                if (session == null || session.getAttribute("account") == null) {
                    servletResponse.sendRedirect(servletRequest.getContextPath() + "/login.html");
                    return;
                }
            }
            System.out.println("QUa filter 1");
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }

}
