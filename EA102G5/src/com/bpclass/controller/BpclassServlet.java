package com.bpclass.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bp.model.BpService;
import com.bp.model.BpVO;
import com.bpclass.model.BpclassService;
import com.bpclass.model.BpclassVO;

public class BpclassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String bpcl_no = req.getParameter("bpcl_no");
				if (bpcl_no == null || (bpcl_no.trim()).length() == 0) {
					errorMsgs.add("�п�J���O�s���n�}?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer bpclass_notest = null;
				try {
					bpclass_notest = new Integer(bpcl_no);
				} catch (Exception e) {
					errorMsgs.add("�榡? are you cry?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				BpclassService bpclassSvc = new BpclassService();
				BpclassVO bpclassVO = bpclassSvc.getonebpclass(bpcl_no);
				if (bpclassVO == null) {
					errorMsgs.add("�S���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("bpclassVO", bpclassVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bpclass-back/listonebpclass.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String bpcl_name = req.getParameter("bpcl_name");
				if (bpcl_name == null || bpcl_name.trim().length()== 0) {
					errorMsgs.add("���e�����");
				}
				
			
				
				BpclassVO bpclassVO = new BpclassVO();
		
				bpclassVO.setBpcl_name(bpcl_name);

				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bpclassVO", bpclassVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/addbpclass.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				/***************************2.�}�l�s�W���***************************************/
				BpclassService bpclassSvc = new BpclassService();
				bpclassVO = bpclassSvc.addbpclass(bpcl_name);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/bpclass-back/listallbpclass.jsp";
				req.setAttribute("bpclassVO", bpclassVO);
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);					
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage()+"�Q�ڧ��F");
				
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-back/addbpclass.jsp");
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String bpcl_no = null ;
				 bpcl_no = req.getParameter("bpcl_no");
				
				/***************************2.�}�l�R�����***************************************/
				BpclassService bpclassSvc = new BpclassService();
				bpclassSvc.delete(bpcl_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/bpclass-back/listallbpclass.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listallbpclass.jsp");
				failureView.forward(req, res);
			}
		}

}

}