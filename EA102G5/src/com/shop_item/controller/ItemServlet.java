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
		//���o�[�J�ʪ��������|
		doPost(req,res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		//���o�[�J�ʪ��������|
		String requestURL = req.getParameter("requestURL");

		
		@SuppressWarnings("unchecked")
		List<ItemVO> buylist = (Vector<ItemVO>) session.getAttribute("shopcart");
		String action = req.getParameter("action");
//		System.out.println(action);

		if (!action.equals("CHECKOUT")) {

			// �R���ʪ����������y
			if (action.equals("DELETE")) {
				
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				System.out.println(d);
				buylist.remove(d);
			}
			// �s�W���y���ʪ�����
			else if (action.equals("ADD")) {
				boolean match = false;
				
				// ���o��ӷs�W�����y
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
						// ���Y�s�W�����y�M�ʪ��������y�@�ˮ�
						if(itemVO.getProdNo().equals(aitemVO.getProdNo())) {
							itemVO.setItemQuantity(itemVO.getItemQuantity()
									+ aitemVO.getItemQuantity());
							 ((Vector<ItemVO>) buylist).setElementAt(itemVO, i);
							match = true;
						}
					}
					// ���Y�s�W�����y�M�ʪ��������y���@�ˮ�
					if(!match) {
						buylist.add(aitemVO);
					}
				}
			}
			
			//�o�̤U�@�ӧP�_�A���Mpay.jsp�e�X���ШD�Ainsert items,�|�b�o�̸���C
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

//		// ���b�A�p���ʪ������y�����`��
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
			//�o�̤]��amount�s�isession
			session.setAttribute("amount", amount);
			//�H�W�h�ssession
			
			String url = "shopCheckout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

		
		
		if ("get_item".equals(action)) { // �Ӧ�listAllOrd.jsp���ШD  
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
			
				String ord_no = req.getParameter("ord_no").trim();
				if (ord_no == null || ord_no.trim().length() == 0) {
					errorMsgs.add("�q��s���ФŪť�");
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ItemService itemSvc = new ItemService();
				List<ItemVO> itemlist =  itemSvc.getItem(ord_no);

				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				req.setAttribute("itemlist", itemlist);
				String url = "/shop_product/listOrdItem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listOrdItem.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("orderItem".equals(action)) { // �Ӧ�shopOrder.jsp���ШD  
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
			
				String ord_no = req.getParameter("ord_no").trim();
				if (ord_no == null || ord_no.trim().length() == 0) {
					errorMsgs.add("�q��s���ФŪť�");
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ItemService itemSvc = new ItemService();
				List<ItemVO> itemlist =  itemSvc.getItem(ord_no);

				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				req.setAttribute("itemlist", itemlist);
				String url = "/shop_product/oneOrdItem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����orderItem.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopOrder.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
