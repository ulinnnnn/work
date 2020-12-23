package com.bpreport.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bp.model.BpService;

/**
 * Servlet implementation class BprpServlet
 */
@WebServlet("/BprpServlet")
public class BprpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
				
				/***************************2.�}�l�R�����***************************************/
				BpService bpSvc = new BpService();
				bpSvc.delete(bp_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/bpclass-back/listallreport.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listallreport.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("upload".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
				/***************************2.�}�l�R�����***************************************/
				BpService bpSvc = new BpService();
				bpSvc.upload(bp_no);
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/bpclass-back/listallreport.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listallreport.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		
		
		
	}

}
