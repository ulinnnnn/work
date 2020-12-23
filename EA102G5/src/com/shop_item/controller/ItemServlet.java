package com.shop_item.controller;

import java.util.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.shop_item.model.*;
import com.shop_order.model.*;


public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		HttpSession session = req.getSession();
		//取得加入購物車的路徑
		doPost(req,res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		//取得加入購物車的路徑
		String requestURL = req.getParameter("requestURL");

		
		@SuppressWarnings("unchecked")
		List<ItemVO> buylist = (Vector<ItemVO>) session.getAttribute("shopcart");
		String action = req.getParameter("action");
//		System.out.println(action);

		if (!action.equals("CHECKOUT")) {

			// 刪除購物車中的書籍
			if (action.equals("DELETE")) {
				
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				System.out.println(d);
				buylist.remove(d);
			}
			// 新增書籍至購物車中
			else if (action.equals("ADD")) {
				boolean match = false;
				
				// 取得後來新增的書籍
				String prod_no = req.getParameter("prod_no");
				Integer item_quantity = new Integer(req.getParameter("item_quantity").trim());
				Double prod_price = new Double(req.getParameter("prod_price"));
				
				ItemVO aitemVO = new ItemVO();
				aitemVO.setProdNo(prod_no);
				aitemVO.setItemQuantity(item_quantity);
				aitemVO.setProdPrice(prod_price);
//		

				if (buylist == null) {
					buylist = new Vector<ItemVO>();
					buylist.add(aitemVO);
				} else {
					for (int i = 0; i < buylist.size(); i++) {
						ItemVO itemVO = buylist.get(i);
						// 假若新增的書籍和購物車的書籍一樣時
						if(itemVO.getProdNo().equals(aitemVO.getProdNo())) {
							itemVO.setItemQuantity(itemVO.getItemQuantity()
									+ aitemVO.getItemQuantity());
							 ((Vector<ItemVO>) buylist).setElementAt(itemVO, i);
							match = true;
						}
					}
					// 假若新增的書籍和購物車的書籍不一樣時
					if(!match) {
						buylist.add(aitemVO);
					}
				}
			}
			
			//這裡下一個判斷，不然pay.jsp送出的請求，insert items,會在這裡跳轉。
			if(!action.equals("get_item")) {
				if(!action.equals("orderItem")) {
					session.setAttribute("shopcart", buylist);
//					System.out.println(requestURL);
//					req.setAttribute("category", category_no);
					String url = requestURL;
					res.sendRedirect(url);
//					RequestDispatcher rd = req.getRequestDispatcher(url);
//					rd.forward(req, res);
				}
			}
			

	}

//		// 結帳，計算購物車書籍價錢總數
		else if (action.equals("CHECKOUT")) {
//			System.out.println(buylist.get(1).getProdNo());
			double total = 0;
			for (int i = 0; i < buylist.size(); i++) {
				ItemVO itemVO = buylist.get(i);
				Integer item_quantity = itemVO.getItemQuantity();
				Double prod_price = itemVO.getProdPrice();
				total += (item_quantity*prod_price);
//				System.out.println(total);
			}
			
			

			String amount = String.valueOf(total);
			req.setAttribute("amount", amount);
			//這裡也把amount存進session
			session.setAttribute("amount", amount);
			//以上多存session
			
			String url = "shopCheckout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

		
		
		if ("get_item".equals(action)) { // 來自listAllOrd.jsp的請求  
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
				
				/***************************2.開始新增資料***************************************/
				ItemService itemSvc = new ItemService();
				List<ItemVO> itemlist =  itemSvc.getItem(ord_no);

				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("itemlist", itemlist);
				String url = "/shop_product/listOrdItem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listOrdItem.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("orderItem".equals(action)) { // 來自shopOrder.jsp的請求  
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
				
				/***************************2.開始新增資料***************************************/
				ItemService itemSvc = new ItemService();
				List<ItemVO> itemlist =  itemSvc.getItem(ord_no);

				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("itemlist", itemlist);
				String url = "/shop_product/oneOrdItem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交orderItem.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopOrder.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
