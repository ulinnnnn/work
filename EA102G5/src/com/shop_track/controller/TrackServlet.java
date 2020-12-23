package com.shop_track.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_track.model.*;

/**
 * Servlet implementation class OrdServlet
 */
//@WebServlet("/OrdServlet")
public class TrackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		
		if ("add_track".equals(action)) { // �Ӧ�shop.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				String mem_no = req.getParameter("mem_no").trim();
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("�|���s���ФŪť�");
				}
				String prod_no = req.getParameter("prod_no").trim();
				if (prod_no == null || prod_no.trim().length() == 0) {
					errorMsgs.add("�ӫ~�ФŪť�");
				}
				
				TrackVO trackVO = new TrackVO();
				trackVO.setMemNo(mem_no);
				trackVO.setProdNo(prod_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("trackVO", trackVO); // �t����J�榡���~��ordVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				TrackService trackSvc = new TrackService();
				trackSvc.addTrack(trackVO);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				//���o�[�J�l�ܪ����|
				String requestURL = req.getParameter("requestURL");
				String url = requestURL;
				res.sendRedirect(url);			
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete_track".equals(action)) { // �Ӧ�shopTrack.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				String mem_no = req.getParameter("mem_no").trim();
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("�|���s���ФŪť�");
				}
				String prod_no = req.getParameter("prod_no").trim();
				if (prod_no == null || prod_no.trim().length() == 0) {
					errorMsgs.add("�ӫ~�s���ФŪť�");
				}
				
				TrackVO trackVO = new TrackVO();
				trackVO.setMemNo(mem_no);
				trackVO.setProdNo(prod_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("trackVO", trackVO); // �t����J�榡���~��ordVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;
				}
			
				/***************************2.�}�l�s�W���***************************************/
				TrackService trackSvc = new TrackService();
				trackSvc.deleteTrack(trackVO);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/shop_product/shopTrack.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllOrd.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopTrack.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}
