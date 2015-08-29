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
        if(request instanceof HttpServletRequest){
            System.out.println("da vao day roi ");
            HttpServletRequest httpServletRequest = (HttpServletRequest)request;
            HttpSession session = httpServletRequest.getSession(false);
            if(session == null){
//                httpServletRequest.getRequestDispatcher(httpServletRequest.getContextPath() + "/login.do").forward(request, response);
            } 
                chain.doFilter(request, response);
            
            
        }
        
    }

    @Override
    public void destroy() {
        
    }
       
}
