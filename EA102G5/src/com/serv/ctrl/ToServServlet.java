package com.serv.ctrl;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.serv.model.ServService;
import com.serv.model.ServVO;
import com.shop_order.model.OrdService;
import com.shop_order.model.OrdVO;

//@WebServlet("/shop_product/toServ")
public class ToServServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String action = req.getParameter("action");
		
		if( action.equals("toCustText")) {
			String ordNo = req.getParameter("ordNo");
			OrdService ordSvc = new OrdService();
			OrdVO ordVO = ordSvc.getOneOrd(ordNo);
			
			req.setAttribute("ordVO", ordVO);
			
			RequestDispatcher rd = req.getRequestDispatcher("/shop_product/cust_text.jsp");
			rd.forward(req, res);	
		}
		

		if("sendCustText".equals(action)) {
			String ordNo = req.getParameter("ordNo");
			String custCont = req.getParameter("custCont");
						 			
			java.sql.Timestamp custContTime = new java.sql.Timestamp(new Date().getTime());// /1000*1000
			
			ServVO servVO = new ServVO();
			servVO.setOrdNo(ordNo);
			servVO.setCustCont(custCont);
			servVO.setCustContTime(custContTime);
			
			ServService servSvc = new ServService();
			servVO = servSvc.addServ(ordNo, custCont ,custContTime);
			
			req.setAttribute("servVO", servVO);
			
//			RequestDispatcher rd = req.getRequestDispatcher("/serv/receiveCust.jsp");
//			RequestDispatcher rd = req.getRequestDispatcher("/shop_product/receiveCust.jsp");
			RequestDispatcher rd = req.getRequestDispatcher("/shop_product/receiveCust.jsp");
			rd.forward(req, res);						
		}
		
	}

}
