package com.fmclass.ctrl;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fmclass.model.fmclassService;
import com.fmclass.model.fmclassVO;

public class fmclassServlet extends HttpServlet {
	
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
				String fmcl_no = req.getParameter("fmcl_no");
				if (fmcl_no == null || (fmcl_no.trim()).length() == 0) {
					errorMsgs.add("�п�J���O�s���n�}?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/select_class_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer fmclass_notest = null;
				try {
					fmclass_notest = new Integer(fmcl_no);
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
				fmclassService fmclassSvc = new fmclassService();
				fmclassVO fmclassVO = fmclassSvc.getOnefmclass(fmcl_no);
				if (fmclassVO == null) {
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
				req.setAttribute("fmclassVO", fmclassVO); // ��Ʈw���X��empVO����,�s�Jreq
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
				String fmcl_na = req.getParameter("fmcl_na");
				if (fmcl_na == null || fmcl_na.trim().length()== 0) {
					errorMsgs.add("���e�����");
				}
				
			
				
				fmclassVO fmclassVO = new fmclassVO();
		
				fmclassVO.setfmcl_na(fmcl_na);

				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fmclassVO", fmclassVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bpclass-back/addbpclass.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				/***************************2.�}�l�s�W���***************************************/
				fmclassService fmclassSvc = new fmclassService();
				fmclassVO = fmclassSvc.addfmclass(fmcl_na);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/bpclass-back/listallbpclass.jsp";
				req.setAttribute("fmclassVO", fmclassVO);
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
				String fmcl_no = null ;
				 fmcl_no = req.getParameter("fmcl_no");
				
				/***************************2.�}�l�R�����***************************************/
				fmclassService fmclassSvc = new fmclassService();
				fmclassSvc.deletefmclass(fmcl_no);
				
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