package com.Bid_content.controller;


import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.Bid_content.model.Bid_contentService;
import com.Bid_content.model.Bid_contentVO;


@MultipartConfig
public class Bid_contentServlet extends HttpServlet {

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
				String bm_no = req.getParameter("bm_no");
				/*************************** 2.開始查詢資料 *****************************************/
				Bid_contentService bid_contentSvc = new Bid_contentService();
				Bid_contentVO bid_contentVO = bid_contentSvc.getcontent(bm_no);
				if (bid_contentVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("bid_contentVO", bid_contentVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/listOneBid_content.jsp";
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
				String bm_no = new String(req.getParameter("bm_no"));
				/*************************** 2.開始查詢資料 ****************************************/
				Bid_contentService bid_contentSvc = new Bid_contentService();
				Bid_contentVO bid_contentVO = bid_contentSvc.getcontent(bm_no);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("bid_contentVO", bid_contentVO); // 資料庫取出的empVO物件,存入req
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
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String br_content = req.getParameter("br_content");
			if (br_content == null || br_content.trim().length() == 0) {
				errorMsgs.add("留言內容: 請勿空白");
			} 
			String mem_no = req.getParameter("mem_no");
			if (mem_no == null || mem_no.trim().length() == 0) {
				errorMsgs.add("請先登入會員再留言");
			}
			String bp_no = req.getParameter("bp_no");
			System.out.println(bp_no);
			Bid_contentVO bid_contentVO = new Bid_contentVO();		
			bid_contentVO.setBp_no(bp_no);
			bid_contentVO.setMem_no(mem_no);
			bid_contentVO.setBr_content(br_content);
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("bid_contentVO", bid_contentVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listOne.jsp?"+bp_no);
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始新增資料 ***************************************/
			Bid_contentService bid_contentSvc = new Bid_contentService();
			bid_contentVO = bid_contentSvc.addBid_content(bp_no, mem_no, br_content);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
			res.sendRedirect(url); // 新增成功後轉交listAllEmp.jsp
		

			/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listOne.jsp?"+bp_no);
//				failureView.forward(req, res);
//				
//			}
		}


		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String bp_no = req.getParameter("bp_no");

				/*************************** 2.開始刪除資料 ***************************************/
				Bid_contentService bid_contentSvc = new Bid_contentService();
				bid_contentSvc.deletecontent(bp_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/bid_front_end/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

	


