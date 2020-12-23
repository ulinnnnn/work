package com.Bid_commodity_track.controller;
	import java.io.*;
	import java.util.*;
	import javax.servlet.*;
	import javax.servlet.annotation.MultipartConfig;
	import javax.servlet.http.*;

import com.Bid_commodity_track.model.Bid_commodity_trackService;
import com.Bid_commodity_track.model.Bid_commodity_trackVO;
	
@MultipartConfig
public class Bid_commodity_trackServlet extends HttpServlet {


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
					String mem_no = req.getParameter("mem_no");
					/*************************** 2.開始查詢資料 *****************************************/
					Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
					List<Bid_commodity_trackVO> bid_commodity_trackVO = bid_commodity_trackSvc.getAll();
					if (bid_commodity_trackVO == null) {
						errorMsgs.add("查無資料");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
						failureView.forward(req, res);
						return;// 程式中斷
					}
					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					req.setAttribute("bid_commodity_trackVO", bid_commodity_trackVO); // 資料庫取出的empVO物件,存入req
					String url = "/bid_front_end/listOneBid_commodity_track.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
					successView.forward(req, res);

					/*************************** 其他可能的錯誤處理 *************************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得資料:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
				}
			}
		
			
			if ("insert".equals(action)) { // 來自addEmp.jsp的請求

				String mem_no = req.getParameter("mem_no");
				String bp_no = req.getParameter("bp_no");
				Bid_commodity_trackVO bid_commodity_trackVO = new Bid_commodity_trackVO();		
				bid_commodity_trackVO.setBp_no(bp_no);
				bid_commodity_trackVO.setMem_no(mem_no);

				/*************************** 2.開始新增資料 ***************************************/
				Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
				bid_commodity_trackVO = bid_commodity_trackSvc.addBid_track(bp_no, mem_no);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
				res.sendRedirect(url); // 新增成功後轉交listAllEmp.jsp
			
			}
			if ("updatestat".equals(action)) { 
				String mem_no = req.getParameter("mem_no");
				String bp_no = req.getParameter("bp_no");
				Bid_commodity_trackVO bid_commodity_trackVO = new Bid_commodity_trackVO();		
				bid_commodity_trackVO.setBp_no(bp_no);
				bid_commodity_trackVO.setMem_no(mem_no);
				
				/*************************** 2.開始新增資料 ***************************************/
				Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
				bid_commodity_trackVO = bid_commodity_trackSvc.updatestat(bp_no, mem_no);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
				res.sendRedirect(url); // 新增成功後轉交listAllEmp.jsp
			
			}


			if ("delete".equals(action)) { 

					/*************************** 1.接收請求參數 ***************************************/
					String bp_no = req.getParameter("bp_no");				
					String mem_no = req.getParameter("mem_no");
					/*************************** 2.開始刪除資料 ***************************************/
					Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
					bid_commodity_trackSvc.deletetrack(bp_no,mem_no);
					/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
					String url = "/bid_front_end/listAllEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);

				
			}
		}

	}

		





