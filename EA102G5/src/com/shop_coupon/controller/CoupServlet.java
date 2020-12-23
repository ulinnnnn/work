package com.shop_coupon.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.shop_coupon.model.*;

public class CoupServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		doPost(req, res);
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
System.out.println(action);
		
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String coup_no = req.getParameter("coup_no");
				if (coup_no == null || (coup_no.trim()).length() == 0) {
					errorMsgs.add("請輸入優惠卷");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllProd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				CoupService coupSvc = new CoupService();
				CoupVO coupVO = coupSvc.getOneCoup(coup_no);
				if (coupVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllProd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("coupVO", coupVO); // 資料庫取出的prodVO物件,存入req
				String url = "/";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String coup_no = new String(req.getParameter("coup_no"));
				
				/***************************2.開始查詢資料****************************************/
				CoupService coupSvc = new CoupService();
				CoupVO coupVO = coupSvc.getOneCoup(coup_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("coupVO", coupVO);         // 資料庫取出的prodVO物件,存入req
				String url = "/";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 updateProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自updateProd.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String coup_no = req.getParameter("coup_no").trim();

				String coup_status = req.getParameter("coup_status").trim();
				if (coup_status == null || coup_status.trim().length() == 0) {
					errorMsgs.add("狀態請勿空白");
				}
				
				String mem_no = req.getParameter("mem_no").trim();
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("請勿空白");
				}
				
				CoupVO coupVO = new CoupVO();
				coupVO.setCoupNo(coup_no);
				coupVO.setCoupStatus(coup_status);
				coupVO.setMemNo(mem_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("coupVO", coupVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				CoupService coupSvc = new CoupService();
				coupVO = coupSvc.updateCoup(coupVO);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("coupVO", coupVO); // 資料庫update成功後,正確的的prodVO物件,存入req
				String url = "shopCoup.jsp";
				res.sendRedirect(url);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCoup.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addProd.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				Double coup_discount = null;
				try {
					coup_discount = new Double(req.getParameter("coup_discount").trim());
				} catch (NumberFormatException e) {
					coup_discount = 0.0;
					errorMsgs.add("請填數字.");
				}
				
				Integer amount = null;
				try {
					amount = new Integer(req.getParameter("coup_amount").trim());
				} catch (NumberFormatException e) {
					coup_discount = 0.0;
					errorMsgs.add("請填數字.");
				}

				CoupVO coupVO = new CoupVO();
				coupVO.setCoupDiscount(coup_discount);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("coupVO", coupVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllCoup.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				CoupService coupSvc = new CoupService();
				coupSvc.addCoup(coup_discount, amount);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "listAllCoup.jsp";
				res.sendRedirect(url) ;
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllCoup.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllProd.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String coup_no = new String(req.getParameter("coup_no"));

				/***************************2.開始刪除資料***************************************/
				CoupService coupSvc = new CoupService();
				coupSvc.deleteCoup(coup_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/");
				failureView.forward(req, res);
			}
		}
		
		if ("useCoup".equals(action)) { // 來自updateProd.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String coup_no = req.getParameter("coup_no").trim();

				String amount = req.getParameter("amount").trim();
				if (amount == null || amount.trim().length() == 0) {
					errorMsgs.add("狀態請勿空白");
				}
				
//				String requestURL = req.getParameter("requestURL").trim();
//				if (requestURL == null || requestURL.trim().length() == 0) {
//					errorMsgs.add("請勿空白");
//				}
				
				CoupVO coupVO = new CoupVO();

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("coupVO", coupVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/

				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("amount",amount);
				req.setAttribute("coup_no",coup_no);
//				System.out.println(requestURL);
				String url = "/shop_product/shopCheckout.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				return;

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCoup.jsp");
				failureView.forward(req, res);
			}
		}
		
		 

	}
	

}
