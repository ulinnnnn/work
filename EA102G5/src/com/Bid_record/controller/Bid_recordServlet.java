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
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("bp_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				String bp_no = null;
				try {
					bp_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				Bid_recordService bid_recordSvc = new Bid_recordService();
				Bid_recordVO bid_recordVO = bid_recordSvc.getOnebc_no(bp_no);
				if (bid_recordVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("bid_recordVO", bid_recordVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bid_front_end/listOneBid_record.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOnebc_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("bc_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				String bc_no = null;
				try {
					bc_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				Bid_recordService bid_recordSvc = new Bid_recordService();
				Bid_recordVO bid_recordVO = bid_recordSvc.getOnebc_no(bc_no);
				if (bid_recordVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("bid_recordVO", bid_recordVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bid_front_end/listOneBid_record.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String bp_no = new String(req.getParameter("bp_no"));

				/*************************** 2.�}�l�d�߸�� ****************************************/
				Bid_recordService bid_recordSvc = new Bid_recordService();
				Bid_recordVO bid_recordVO = bid_recordSvc.getOnebc_no(bp_no);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("bid_recordVO", bid_recordVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bid_front_end/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("Bidinsert".equals(action)) { // �Ӧ�addEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
			/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/		
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
				req.setAttribute("bid_recordVO", bid_recordVO); // �t����J�榡���~��empVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/addBid_record.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.�}�l�s�W��� ***************************************/
			Bid_recordService bid_recordSvc = new Bid_recordService();
			bid_recordVO = bid_recordSvc.addBid_record(bp_no,mem_no,b_price);
			
			Bid_commodityService bid_commoditySvc = new Bid_commodityService();
			bid_commodityVO = bid_commoditySvc.updateprice(bn_price,bp_no);

			/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
			String url = "/bid_front_end/listOne.jsp?"+bp_no;
			RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
			successView.forward(req, res);

			/*************************** ��L�i�઺���~�B�z **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/addBid_record.jsp");
//				failureView.forward(req, res);
//				
//			}
		}

		
		

	}

}
