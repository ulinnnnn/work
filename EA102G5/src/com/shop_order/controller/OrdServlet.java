package com.shop_order.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop_item.model.*;
import com.shop_order.model.*;
import com.mem.model.*;
import com.shop.*;
import com.shop_coupon.model.*;

/**
 * Servlet implementation class OrdServlet
 */
//@WebServlet("/OrdServlet")
public class OrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		System.out.println(action);
		
		if ("insert".equals(action)) { // 來自shopAddress.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String ord_name = req.getParameter("ord_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ord_name == null || ord_name.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if(!ord_name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
				
				String ord_phone = req.getParameter("ord_phone").trim();
				if (ord_phone == null || ord_phone.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}
				
				String ord_mail = req.getParameter("ord_mail").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("信箱請勿空白");
				}
				
				String ord_city = req.getParameter("country").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("縣市請勿空白");
				}
				
				String ord_code = req.getParameter("zipcode").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("區碼請勿空白");
				}
				
				String ord_section = req.getParameter("district").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("區域請勿空白");
				}
				
				String ord_address = req.getParameter("address").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}
				
				String ord_price = req.getParameter("ord_price").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("總金額請勿空白");
				}
				
				String mem_no = req.getParameter("mem_no").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				}
				
				String ord_coup = req.getParameter("coup_no").trim();
				if("".equals(ord_coup)) {
					ord_coup = "無";
				} 
				
				OrdVO ordVO = new OrdVO();
				ordVO.setOrdName(ord_name);
				ordVO.setOrdPhone(ord_phone);
				ordVO.setOrdMail(ord_mail);
				ordVO.setOrdCity(ord_city);
				ordVO.setOrdCode(ord_code);
				ordVO.setOrdSection(ord_section);
				ordVO.setOrdAddress(ord_address);
				ordVO.setOrdPrice(ord_price);
				ordVO.setMemNo(mem_no);
				ordVO.setOrdCoup(ord_coup);
				//這裡目前寫死
				ordVO.setEmpNo("e001");
				ordVO.setOrdStatus("未付款");
				//以上目前寫死
				
				List<ItemVO> list = (List<ItemVO>) session.getAttribute("shopcart");

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ordVO", ordVO); // 含有輸入格式錯誤的ordVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shopAddress.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				OrdService ordSvc = new OrdService();
				String ord_no = ordSvc.addOrd(ordVO, list);
				ordVO.setOrdNo(ord_no);
				
				//存好item和ord_price=amoumt後，清空session
				session.removeAttribute("shopcart");
				session.removeAttribute("amount");
				
				//使用優惠券，改變優惠券的狀態
				String coup_no = req.getParameter("coup_no");
//				System.out.println("coup_no = "+ coup_no);
				if(!"".equals(coup_no)) {
					String coup_status = "使用完畢";
					CoupService coupSvc = new CoupService();
					coupSvc.updateStatus(coup_no, coup_status);
				}
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("ordVO", ordVO);
				String url = "/shop_product/shopPay.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllProd.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopAddress.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Update_Status".equals(action)) { // 來自listAllOrd.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String ord_no = req.getParameter("ord_no").trim();
				if (ord_no == null || ord_no.trim().length() == 0) {
					errorMsgs.add("訂單編號請勿空白");
				}
				String ord_status = req.getParameter("ord_status").trim();
				if (ord_status == null || ord_status.trim().length() == 0) {
					errorMsgs.add("訂單狀態請勿空白");
				}
				
				OrdVO ordVO = new OrdVO();
				ordVO.setOrdNo(ord_no);
				ordVO.setOrdStatus(ord_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ordVO", ordVO); // 含有輸入格式錯誤的ordVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllOrd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				OrdService ordSvc = new OrdService();
				ordSvc.updateStatus(ord_no, ord_status);
				//如果狀態是已出貨，email通知出貨
				if(ord_status.equals("已出貨")) {
					
					String mem_no = new OrdService().getOneOrd(ord_no).getMemNo();

					String to = "denny0329denny0329@gmail.com";
					String subject = "ToyAllHot通知：你訂購的商品已出貨";
					
					String messageText = "親愛的會員 "+mem_no+" 你好：\n"
								+"訂單"+ord_no+"已寄出\n"
								+"帶著期待的心收件吧～\n"
								+"ToyAllHot 感謝您的購買～";
					
					MailService MailSvc = new MailService();
					MailSvc.sendMail(to, subject, messageText);
				}
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = null;
				if(ord_status.equals("已付款")) {
					url = "/shop_product/shopFinish.jsp";
				} else if(ord_status.equals("已出貨")) {
					 url = "/shop_product/listAllOrd.jsp";
				} else if(ord_status.equals("訂單完成")) {
					 url = "/shop_product/shopOrder.jsp";
				}
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllOrd.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("payOrder".equals(action)) { // 來自listAllOrd.jsp的請求  
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String ord_no = req.getParameter("ord_no").trim();
				System.out.println(ord_no);
				/***************************2.開始新增資料***************************************/
				OrdService ordSvc = new OrdService();
				OrdVO ordVO = ordSvc.getOneOrd(ord_no);
				System.out.println(ordVO.getOrdCoup());
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("ordVO", ordVO);
				String url = "/shop_product/shopPay.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);			
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}
