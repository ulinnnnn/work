package com.mem.filter;


import java.io.IOException;
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

import com.mem.model.MemVO;


//@WebFilter("/loginFilter")
public class loginFilter implements Filter {

  
    public loginFilter() {
        
    }

	public void destroy() {
	
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		
		MemVO memVO=(MemVO)session.getAttribute("memVO");
		
		String mem_status=null;
		String mem_type = null;
		if(memVO!=null) {
			mem_type=memVO.getMem_type();
			mem_status=memVO.getMem_status();
		}
		if(memVO==null||mem_type.equals("FALSE")) {
			session.setAttribute("location", req.getRequestURI());
			System.out.println(" req.getRequestURI()"+ req.getRequestURI());
			res.sendRedirect(req.getContextPath()+"/Front-mem/login.jsp");
		}else if(mem_status.equals("M0")) {
			System.out.println("++++++++++"+mem_status);
			res.sendRedirect(req.getContextPath()+"/Front-mem/memVerification.jsp");
		}else  {
			chain.doFilter(request, response);
		}
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
