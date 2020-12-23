package com.shop_track.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_track.model.*;

/**
 * Servlet implementation class OrdServlet
 */
//@WebServlet("/OrdServlet")
public class TrackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		
		if ("add_track".equals(action)) { // 來自shop.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String mem_no = req.getParameter("mem_no").trim();
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				}
				String prod_no = req.getParameter("prod_no").trim();
				if (prod_no == null || prod_no.trim().length() == 0) {
					errorMsgs.add("商品請勿空白");
				}
				
				TrackVO trackVO = new TrackVO();
				trackVO.setMemNo(mem_no);
				trackVO.setProdNo(prod_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("trackVO", trackVO); // 含有輸入格式錯誤的ordVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				TrackService trackSvc = new TrackService();
				trackSvc.addTrack(trackVO);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				//取得加入追蹤的路徑
				String requestURL = req.getParameter("requestURL");
				String url = requestURL;
				res.sendRedirect(url);			
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete_track".equals(action)) { // 來自shopTrack.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String mem_no = req.getParameter("mem_no").trim();
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				}
				String prod_no = req.getParameter("prod_no").trim();
				if (prod_no == null || prod_no.trim().length() == 0) {
					errorMsgs.add("商品編號請勿空白");
				}
				
				TrackVO trackVO = new TrackVO();
				trackVO.setMemNo(mem_no);
				trackVO.setProdNo(prod_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("trackVO", trackVO); // 含有輸入格式錯誤的ordVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;
				}
			
				/***************************2.開始新增資料***************************************/
				TrackService trackSvc = new TrackService();
				trackSvc.deleteTrack(trackVO);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/shop_product/shopTrack.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllOrd.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopTrack.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}
