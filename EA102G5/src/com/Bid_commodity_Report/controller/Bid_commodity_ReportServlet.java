package com.Bid_commodity_Report.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.Bid_commodity.model.Bid_commodityService;
import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_commodity_Report.model.*;
import com.Bid_commodity_track.model.Bid_commodity_trackService;

@MultipartConfig
public class Bid_commodity_ReportServlet extends HttpServlet {

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
				Integer bap_status = new Integer(req.getParameter("bap_status"));
				/*************************** 2.開始查詢資料 *****************************************/
				Bid_commodity_ReportServicefdsf bid_commodity_ReportSvc = new Bid_commodity_ReportService();
				List<Bid_commodity_ReportVO> bidVO = bid_commodity_ReportSvc.findByKey(bap_status);
				if (bidVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("bidVO", bidVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
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
				String bre_no = req.getParameter("bre_no");
				String bap_status = req.getParameter("bap_status");
				String bp_no = req.getParameter("bp_no");
				if(bap_status.equals("04")) {
					System.out.println(bp_no);
					Bid_commodityService bid_commoditySvc = new Bid_commodityService();
					Bid_commodityVO bid_commodityVO = bid_commoditySvc.updatetime(88,bp_no);
					req.setAttribute("bid_commodityVO", bid_commodityVO);		
				}
				if(bap_status.equals("06")) {
					bap_status="01";
					Bid_commodityService bid_commoditySvc = new Bid_commodityService();
					Bid_commodityVO bid_commodityVO = bid_commoditySvc.updatetime(1,bp_no);
					req.setAttribute("bid_commodityVO", bid_commodityVO);		
				}
				/*************************** 2.開始查詢資料 ****************************************/
				Bid_commodity_ReportService bidSvc = new Bid_commodity_ReportService();
				Bid_commodity_ReportVO bid_commodity_ReportVO = bidSvc.updateBid(bre_no,bap_status);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("bid_commodity_ReportVO", bid_commodity_ReportVO); // 資料庫取出的empVO物件,存入req
				String url = "/EA102G5/bid_front/back.jsp";
				res.sendRedirect(url); 

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front/back.jsp");
				failureView.forward(req, res);
			}
		}
		if ("reportinsert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
//			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("檢舉請先登入");
				} 
				System.out.println(mem_no);
				String bp_no =req.getParameter("bp_no");	
				System.out.println(bp_no);
				String br_project =req.getParameter("br_project");
				if (br_project == null || br_project.trim().length() == 0) {
					errorMsgs.add("請說明檢舉原因");
				}
				System.out.println(br_project);
				String br_content = req.getParameter("br_content").trim();
				if (br_content == null || br_content.trim().length() == 0) {
					errorMsgs.add("請詳述檢舉細節");
				}
				System.out.println(br_content);
		
				Bid_commodity_ReportVO bid_commodityVO = new Bid_commodity_ReportVO();
				bid_commodityVO.setMem_no(mem_no);
				bid_commodityVO.setBp_no(bp_no);
				bid_commodityVO.setBr_project(br_project);
				bid_commodityVO.setBr_content(br_content);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bid_commodityVO", bid_commodityVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/EA102G5/bid_front_end/listOne.jsp?"+bp_no);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				Bid_commodity_ReportService bid_commodity_ReportSvc = new Bid_commodity_ReportService();
				bid_commodityVO = bid_commodity_ReportSvc.addreport(mem_no,bp_no,br_project,br_content);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
				res.sendRedirect(url); 
				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/EA102G5/bid_front_end/listOne.jsp?\"+bp_no");
//				failureView.forward(req, res);
//			}
		}

	



	}

}
