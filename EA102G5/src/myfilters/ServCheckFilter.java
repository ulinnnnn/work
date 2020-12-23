package myfilters;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.auth.model.AuthService;
import com.auth.model.AuthVO;
import com.emp.model.EmpVO;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.Match;

@WebFilter("/backEnd/showAllServ.jsp")
public class ServCheckFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	
	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		EmpVO empVO = (EmpVO) session.getAttribute("empVO");
		
		String empNo = empVO.getEmpNo();
		
		AuthService authSvc = new AuthService();
		List<String> empAuthList = authSvc.getOneEmpFuncs(empNo);
											
		if(empAuthList.stream().anyMatch(e -> e.matches("f002|f003"))) {
			chain.doFilter(request, response);
		}else {
			res.sendRedirect(req.getContextPath()+"/empLogin/noAuth.jsp");
		}					
	}

}
