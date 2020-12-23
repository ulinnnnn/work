package com.emp.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/emp/logout")
public class EmpLogOut extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
			
		res.setContentType("text/html");		
		HttpSession session = req.getSession();
		session.removeAttribute("empNo");
		session.invalidate();
		res.sendRedirect(req.getContextPath()+"/empLogin/empLogin.jsp");
		
		
	}	
}
