package com.shop_category.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import com.shop_product.model.*;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);
		
		
		try {
			/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
			String category_no = req.getParameter("category_no");
			
			if (category_no == null || (category_no.trim()).length() == 0) {
				errorMsgs.add("�п�J���O�s��");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCategory.jsp");
				failureView.forward(req, res);
				return;//�{�����_
			}
			
			/***************************2.�}�l�d�߸��*****************************************/
			ProdService prodSvc = new ProdService();
			List<ProdVO> catelist = prodSvc.getCategoryProd(category_no);
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopCategory.jsp");
				failureView.forward(req, res);
				return;//�{�����_
			}
			
			/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
			req.setAttribute("catelist", catelist); // ��Ʈw���X��prodVO����,�s�Jreq
			String url = "/shop_product/shopCategory.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneProd.jsp
			successView.forward(req, res);

			/***************************��L�i�઺���~�B�z*************************************/
		} catch (Exception e) {
			errorMsgs.add("�L�k���o���:" + e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/shop_product/shopCategory.jsp");
			failureView.forward(req, res);
		}

		
	}

}
