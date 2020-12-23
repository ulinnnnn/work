package com.emp.ctrl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;



public class ShowPicServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		res.setContentType("image/jpeg");
		ServletOutputStream sos = res.getOutputStream();
		
		String empNo = req.getParameter("empNo");
		
		EmpService empSvc = new EmpService();
		EmpVO empVO = empSvc.showPic(empNo);
		byte[] empPicByte = empVO.getEmpPicByte();	
		
		sos.write(empPicByte);
					
//		InputStream is = dao.showPic(empNo);
//		req.setAttribute("sos",sos);
//		RequestDispatcher rd = req.getRequestDispatcher("backEndG5/showAll.jsp");
//	    rd.forward(req, res);	
		
		
	}
	

}
