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
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				Integer bap_status = new Integer(req.getParameter("bap_status"));
				/*************************** 2.�}�l�d�߸�� *****************************************/
				Bid_commodity_ReportServicefdsf bid_commodity_ReportSvc = new Bid_commodity_ReportService();
				List<Bid_commodity_ReportVO> bidVO = bid_commodity_ReportSvc.findByKey(bap_status);
				if (bidVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("bidVO", bidVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bid/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/select_page.jsp");
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
				/*************************** 2.�}�l�d�߸�� ****************************************/
				Bid_commodity_ReportService bidSvc = new Bid_commodity_ReportService();
				Bid_commodity_ReportVO bid_commodity_ReportVO = bidSvc.updateBid(bre_no,bap_status);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("bid_commodity_ReportVO", bid_commodity_ReportVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/EA102G5/bid_front/back.jsp";
				res.sendRedirect(url); 

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front/back.jsp");
				failureView.forward(req, res);
			}
		}
		if ("reportinsert".equals(action)) { // �Ӧ�addEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
//			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("���|�Х��n�J");
				} 
				System.out.println(mem_no);
				String bp_no =req.getParameter("bp_no");	
				System.out.println(bp_no);
				String br_project =req.getParameter("br_project");
				if (br_project == null || br_project.trim().length() == 0) {
					errorMsgs.add("�л������|��]");
				}
				System.out.println(br_project);
				String br_content = req.getParameter("br_content").trim();
				if (br_content == null || br_content.trim().length() == 0) {
					errorMsgs.add("�иԭz���|�Ӹ`");
				}
				System.out.println(br_content);
		
				Bid_commodity_ReportVO bid_commodityVO = new Bid_commodity_ReportVO();
				bid_commodityVO.setMem_no(mem_no);
				bid_commodityVO.setBp_no(bp_no);
				bid_commodityVO.setBr_project(br_project);
				bid_commodityVO.setBr_content(br_content);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bid_commodityVO", bid_commodityVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/EA102G5/bid_front_end/listOne.jsp?"+bp_no);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.�}�l�s�W��� ***************************************/
				Bid_commodity_ReportService bid_commodity_ReportSvc = new Bid_commodity_ReportService();
				bid_commodityVO = bid_commodity_ReportSvc.addreport(mem_no,bp_no,br_project,br_content);
				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
				res.sendRedirect(url); 
				/*************************** ��L�i�઺���~�B�z **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/EA102G5/bid_front_end/listOne.jsp?\"+bp_no");
//				failureView.forward(req, res);
//			}
		}

	



	}

}
