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
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String coup_no = req.getParameter("coup_no");
				if (coup_no == null || (coup_no.trim()).length() == 0) {
					errorMsgs.add("�п�J�u�f��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllProd.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				CoupService coupSvc = new CoupService();
				CoupVO coupVO = coupSvc.getOneCoup(coup_no);
				if (coupVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllProd.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("coupVO", coupVO); // ��Ʈw���X��prodVO����,�s�Jreq
				String url = "/";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneProd.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllProd.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String coup_no = new String(req.getParameter("coup_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				CoupService coupSvc = new CoupService();
				CoupVO coupVO = coupSvc.getOneCoup(coup_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("coupVO", coupVO);         // ��Ʈw���X��prodVO����,�s�Jreq
				String url = "/";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� updateProd.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�updateProd.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String coup_no = req.getParameter("coup_no").trim();

				String coup_status = req.getParameter("coup_status").trim();
				if (coup_status == null || coup_status.trim().length() == 0) {
					errorMsgs.add("���A�ФŪť�");
				}
				
				String mem_no = req.getParameter("mem_no").trim();
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("�ФŪť�");
				}
				
				CoupVO coupVO = new CoupVO();
				coupVO.setCoupNo(coup_no);
				coupVO.setCoupStatus(coup_status);
				coupVO.setMemNo(mem_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("coupVO", coupVO); // �t����J�榡���~��prodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				CoupService coupSvc = new CoupService();
				coupVO = coupSvc.updateCoup(coupVO);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("coupVO", coupVO); // ��Ʈwupdate���\��,���T����prodVO����,�s�Jreq
				String url = "shopCoup.jsp";
				res.sendRedirect(url);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCoup.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addProd.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				Double coup_discount = null;
				try {
					coup_discount = new Double(req.getParameter("coup_discount").trim());
				} catch (NumberFormatException e) {
					coup_discount = 0.0;
					errorMsgs.add("�ж�Ʀr.");
				}
				
				Integer amount = null;
				try {
					amount = new Integer(req.getParameter("coup_amount").trim());
				} catch (NumberFormatException e) {
					coup_discount = 0.0;
					errorMsgs.add("�ж�Ʀr.");
				}

				CoupVO coupVO = new CoupVO();
				coupVO.setCoupDiscount(coup_discount);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("coupVO", coupVO); // �t����J�榡���~��prodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllCoup.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				CoupService coupSvc = new CoupService();
				coupSvc.addCoup(coup_discount, amount);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "listAllCoup.jsp";
				res.sendRedirect(url) ;
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllCoup.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllProd.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String coup_no = new String(req.getParameter("coup_no"));

				/***************************2.�}�l�R�����***************************************/
				CoupService coupSvc = new CoupService();
				coupSvc.deleteCoup(coup_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/");
				failureView.forward(req, res);
			}
		}
		
		if ("useCoup".equals(action)) { // �Ӧ�updateProd.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String coup_no = req.getParameter("coup_no").trim();

				String amount = req.getParameter("amount").trim();
				if (amount == null || amount.trim().length() == 0) {
					errorMsgs.add("���A�ФŪť�");
				}
				
//				String requestURL = req.getParameter("requestURL").trim();
//				if (requestURL == null || requestURL.trim().length() == 0) {
//					errorMsgs.add("�ФŪť�");
//				}
				
				CoupVO coupVO = new CoupVO();

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("coupVO", coupVO); // �t����J�榡���~��prodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/

				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("amount",amount);
				req.setAttribute("coup_no",coup_no);
//				System.out.println(requestURL);
				String url = "/shop_product/shopCheckout.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				return;

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCoup.jsp");
				failureView.forward(req, res);
			}
		}
		
		 

	}
	

}
