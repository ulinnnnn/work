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
import com.emp.model.EmpVO;

@WebFilter("/bid_front/back.jsp")
public class BidFilter implements Filter {

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
		
		if(empAuthList.contains("f008")) {
			chain.doFilter(request, response);
		}else {
			res.sendRedirect(req.getContextPath()+"/empLogin/noAuth.jsp");
		}					
	}

}
