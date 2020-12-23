package com.fmclass.ctrl;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fmclass.model.fmclassService;
import com.fmclass.model.fmclassVO;

public class fmclassServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String fmcl_no = req.getParameter("fmcl_no");
				if (fmcl_no == null || (fmcl_no.trim()).length() == 0) {
					errorMsgs.add("請輸入類別編號好咪?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer fmclass_notest = null;
				try {
					fmclass_notest = new Integer(fmcl_no);
				} catch (Exception e) {
					errorMsgs.add("格式? are you cry?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				fmclassService fmclassSvc = new fmclassService();
				fmclassVO fmclassVO = fmclassSvc.getOnefmclass(fmcl_no);
				if (fmclassVO == null) {
					errorMsgs.add("沒資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("fmclassVO", fmclassVO); // 資料庫取出的empVO物件,存入req
				String url = "/bpclass-back/listonebpclass.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String fmcl_na = req.getParameter("fmcl_na");
				if (fmcl_na == null || fmcl_na.trim().length()== 0) {
					errorMsgs.add("內容不能空");
				}
				
			
				
				fmclassVO fmclassVO = new fmclassVO();
		
				fmclassVO.setfmcl_na(fmcl_na);

				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fmclassVO", fmclassVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/addbpclass.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				/***************************2.開始新增資料***************************************/
				fmclassService fmclassSvc = new fmclassService();
				fmclassVO = fmclassSvc.addfmclass(fmcl_na);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/bpclass-back/listallbpclass.jsp";
				req.setAttribute("fmclassVO", fmclassVO);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);					
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage()+"被我抓到了");
				
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-back/addbpclass.jsp");
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String fmcl_no = null ;
				 fmcl_no = req.getParameter("fmcl_no");
				
				/***************************2.開始刪除資料***************************************/
				fmclassService fmclassSvc = new fmclassService();
				fmclassSvc.deletefmclass(fmcl_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/bpclass-back/listallbpclass.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listallbpclass.jsp");
				failureView.forward(req, res);
			}
		}

	}
}