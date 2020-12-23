package myfilters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EmpLoginFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	
	public void destroy() {

	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		if(session.getAttribute("empVO") == null) {
//			RequestDispatcher rd = req.getRequestDispatcher(req.getContextPath()+"/empLogin/empLogin.jsp");
//			rd.forward(request, response);
			res.sendRedirect(req.getContextPath()+"/empLogin/empLogin.jsp");
						
		}else {
			chain.doFilter(request, response);
		}
						
	}


}
