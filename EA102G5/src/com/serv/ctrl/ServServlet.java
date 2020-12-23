package com.serv.ctrl;

import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.serv.model.ServService;
import com.serv.model.ServVO;

public class ServServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//		if("sendCustText".equals(action)) {
//			String ordNo = req.getParameter("ordNo");
//			String custCont = req.getParameter("custCont");
//						 			
//			java.sql.Timestamp custContTime = new java.sql.Timestamp(new Date().getTime());// /1000*1000
//			
//			ServVO servVO = new ServVO();
//			servVO.setOrdNo(ordNo);
//			servVO.setCustCont(custCont);
//			servVO.setCustContTime(custContTime);
//			
//			ServService servSvc = new ServService();
//			servVO = servSvc.addServ(ordNo, custCont ,custContTime);
//			
//			req.setAttribute("servVO", servVO);
//			
////			RequestDispatcher rd = req.getRequestDispatcher("/serv/receiveCust.jsp");
////			RequestDispatcher rd = req.getRequestDispatcher("/shop_product/receiveCust.jsp");
//			RequestDispatcher rd = req.getRequestDispatcher("/shop_product/cust_text.jsp");
//			rd.forward(req, res);						
//		}
		
		if("getOne".equals(action)) {
			
			String servNo = req.getParameter("servNo");
			
			ServService servSvc = new ServService();
			ServVO servVO = servSvc.getOne(servNo);
			
			req.setAttribute("servVO", servVO);
			
			RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/reply.jsp");
			rd.forward(req, res);	
			
		}
		
		if("sendCustText".equals(action)) {
			String servNo = req.getParameter("servNo");
			String empNo = req.getParameter("empNo");
			String replyCont = req.getParameter("replyCont");

			java.sql.Timestamp resContTime = new java.sql.Timestamp(new Date().getTime());
			
			ServService servSvc = new ServService();
			ServVO servVO = servSvc.reply(servNo, empNo, replyCont, resContTime);
			
			req.setAttribute("servVO", servVO);
			
			RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllServ.jsp");
			rd.forward(req, res);
		}		
		
	}

}
