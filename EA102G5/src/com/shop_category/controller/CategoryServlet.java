package com.shop_category.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import com.shop_product.model.*;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);
		
		
		try {
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String category_no = req.getParameter("category_no");
			
			if (category_no == null || (category_no.trim()).length() == 0) {
				errorMsgs.add("請輸入類別編號");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCategory.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
			/***************************2.開始查詢資料*****************************************/
			ProdService prodSvc = new ProdService();
			List<ProdVO> catelist = prodSvc.getCategoryProd(category_no);
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCategory.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
			req.setAttribute("catelist", catelist); // 資料庫取出的prodVO物件,存入req
			String url = "/shop_product/shopCategory.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
			successView.forward(req, res);

			/***************************其他可能的錯誤處理*************************************/
		} catch (Exception e) {
			errorMsgs.add("無法取得資料:" + e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/shop_product/shopCategory.jsp");
			failureView.forward(req, res);
		}

		
	}

}
