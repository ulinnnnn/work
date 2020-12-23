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
					/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
					String mem_no = req.getParameter("mem_no");
					/*************************** 2.�}�l�d�߸�� *****************************************/
					Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
					List<Bid_commodity_trackVO> bid_commodity_trackVO = bid_commodity_trackSvc.getAll();
					if (bid_commodity_trackVO == null) {
						errorMsgs.add("�d�L���");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
						failureView.forward(req, res);
						return;// �{�����_
					}
					/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
					req.setAttribute("bid_commodity_trackVO", bid_commodity_trackVO); // ��Ʈw���X��empVO����,�s�Jreq
					String url = "/bid_front_end/listOneBid_commodity_track.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
					successView.forward(req, res);

					/*************************** ��L�i�઺���~�B�z *************************************/
				} catch (Exception e) {
					errorMsgs.add("�L�k���o���:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
				}
			}
		
			
			if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD

				String mem_no = req.getParameter("mem_no");
				String bp_no = req.getParameter("bp_no");
				Bid_commodity_trackVO bid_commodity_trackVO = new Bid_commodity_trackVO();		
				bid_commodity_trackVO.setBp_no(bp_no);
				bid_commodity_trackVO.setMem_no(mem_no);

				/*************************** 2.�}�l�s�W��� ***************************************/
				Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
				bid_commodity_trackVO = bid_commodity_trackSvc.addBid_track(bp_no, mem_no);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
				res.sendRedirect(url); // �s�W���\�����listAllEmp.jsp
			
			}
			if ("updatestat".equals(action)) { 
				String mem_no = req.getParameter("mem_no");
				String bp_no = req.getParameter("bp_no");
				Bid_commodity_trackVO bid_commodity_trackVO = new Bid_commodity_trackVO();		
				bid_commodity_trackVO.setBp_no(bp_no);
				bid_commodity_trackVO.setMem_no(mem_no);
				
				/*************************** 2.�}�l�s�W��� ***************************************/
				Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
				bid_commodity_trackVO = bid_commodity_trackSvc.updatestat(bp_no, mem_no);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/EA102G5/bid_front_end/listOne.jsp?"+bp_no;
				res.sendRedirect(url); // �s�W���\�����listAllEmp.jsp
			
			}


			if ("delete".equals(action)) { 

					/*************************** 1.�����ШD�Ѽ� ***************************************/
					String bp_no = req.getParameter("bp_no");				
					String mem_no = req.getParameter("mem_no");
					/*************************** 2.�}�l�R����� ***************************************/
					Bid_commodity_trackService bid_commodity_trackSvc = new Bid_commodity_trackService();
					bid_commodity_trackSvc.deletetrack(bp_no,mem_no);
					/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
					String url = "/bid_front_end/listAllEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
					successView.forward(req, res);

				
			}
		}

	}

		





