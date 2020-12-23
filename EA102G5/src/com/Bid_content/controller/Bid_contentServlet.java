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
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String bm_no = req.getParameter("bm_no");
				/*************************** 2.�}�l�d�߸�� *****************************************/
				Bid_contentService bid_contentSvc = new Bid_contentService();
				Bid_contentVO bid_contentVO = bid_contentSvc.getcontent(bm_no);
				if (bid_contentVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("bid_contentVO", bid_contentVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bid_front_end/listOneBid_content.jsp";
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
				String bm_no = new String(req.getParameter("bm_no"));
				/*************************** 2.�}�l�d�߸�� ****************************************/
				Bid_contentService bid_contentSvc = new Bid_contentService();
				Bid_contentVO bid_contentVO = bid_contentSvc.getcontent(bm_no);
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("bid_contentVO", bid_contentVO); // ��Ʈw���X��empVO����,�s�Jreq
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
		if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
			/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
			String br_content = req.getParameter("br_content");
			if (br_content == null || br_content.trim().length() == 0) {
				errorMsgs.add("�d�����e: �ФŪť�");
			} 
			String mem_no = req.getParameter("mem_no");
			if (mem_no == null || mem_no.trim().length() == 0) {
				errorMsgs.add("�Х��n�J�|���A�d��");
			}
			String bp_no = req.getParameter("bp_no");
			System.out.println(bp_no);
			Bid_contentVO bid_contentVO = new Bid_contentVO();		
			bid_contentVO.setBp_no(bp_no);
			bid_contentVO.setMem_no(mem_no);
			bid_contentVO.setBr_content(br_content);
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("bid_contentVO", bid_contentVO); // �t����J�榡���~��empVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listOne.jsp?"+bp_no);
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.�}�l�s�W��� ***************************************/
			Bid_contentService bid_contentSvc = new Bid_contentService();
			bid_contentVO = bid_contentSvc.addBid_content(bp_no, mem_no, br_content);

			/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
			String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
			res.sendRedirect(url); // �s�W���\�����listAllEmp.jsp
		

			/*************************** ��L�i�઺���~�B�z **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listOne.jsp?"+bp_no);
//				failureView.forward(req, res);
//				
//			}
		}


		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				String bp_no = req.getParameter("bp_no");

				/*************************** 2.�}�l�R����� ***************************************/
				Bid_contentService bid_contentSvc = new Bid_contentService();
				bid_contentSvc.deletecontent(bp_no);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/bid_front_end/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

	


