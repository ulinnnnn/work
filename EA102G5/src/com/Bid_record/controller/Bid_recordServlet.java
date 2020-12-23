package com.Bid_record.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.Bid_commodity.model.Bid_commodityService;
import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_record.model.Bid_recordService;
import com.Bid_record.model.Bid_recordVO;

@MultipartConfig
public class Bid_recordServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("bp_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String bp_no = null;
				try {
					bp_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				Bid_recordService bid_recordSvc = new Bid_recordService();
				Bid_recordVO bid_recordVO = bid_recordSvc.getOnebc_no(bp_no);
				if (bid_recordVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("bid_recordVO", bid_recordVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/listOneBid_record.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOnebc_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("bc_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String bc_no = null;
				try {
					bc_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				Bid_recordService bid_recordSvc = new Bid_recordService();
				Bid_recordVO bid_recordVO = bid_recordSvc.getOnebc_no(bc_no);
				if (bid_recordVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("bid_recordVO", bid_recordVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/listOneBid_record.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String bp_no = new String(req.getParameter("bp_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				Bid_recordService bid_recordSvc = new Bid_recordService();
				Bid_recordVO bid_recordVO = bid_recordSvc.getOnebc_no(bp_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("bid_recordVO", bid_recordVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("Bidinsert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/		
			String bp_no = req.getParameter("bp_no");	
			String mem_no = req.getParameter("mem_no");
			Integer b_price=null;
			Integer bs_price=null;
			Integer bn_price=null;
			b_price = new Integer(req.getParameter("b_price"));
			bs_price = new Integer(req.getParameter("bs_price"));
			bn_price = new Integer(req.getParameter("bn_price"));

			if(bn_price==0) {
				bn_price=b_price+bs_price;
			}else {
				bn_price=bn_price+b_price;
			}
			Bid_recordVO bid_recordVO = new Bid_recordVO();					
			bid_recordVO.setBp_no(bp_no);
			bid_recordVO.setMem_no(mem_no);
			bid_recordVO.setB_price(b_price);
			Bid_commodityVO bid_commodityVO = new Bid_commodityVO();
			bid_commodityVO.setBn_price(bn_price);
			bid_commodityVO.setBp_no(bp_no);
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("bid_recordVO", bid_recordVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/addBid_record.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			Bid_recordService bid_recordSvc = new Bid_recordService();
			bid_recordVO = bid_recordSvc.addBid_record(bp_no,mem_no,b_price);
			
			Bid_commodityService bid_commoditySvc = new Bid_commodityService();
			bid_commodityVO = bid_commoditySvc.updateprice(bn_price,bp_no);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/bid_front_end/listOne.jsp?"+bp_no;
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/addBid_record.jsp");
//				failureView.forward(req, res);
//				
//			}
		}

		
		

	}

}
