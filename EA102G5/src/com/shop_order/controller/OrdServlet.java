package com.shop_order.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop_item.model.*;
import com.shop_order.model.*;
import com.mem.model.*;
import com.shop.*;
import com.shop_coupon.model.*;

/**
 * Servlet implementation class OrdServlet
 */
//@WebServlet("/OrdServlet")
public class OrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		System.out.println(action);
		
		if ("insert".equals(action)) { // �Ӧ�shopAddress.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String ord_name = req.getParameter("ord_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ord_name == null || ord_name.trim().length() == 0) {
					errorMsgs.add("�ӫ~�W��: �ФŪť�");
				} else if(!ord_name.trim().matches(nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�ӫ~�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}
				
				String ord_phone = req.getParameter("ord_phone").trim();
				if (ord_phone == null || ord_phone.trim().length() == 0) {
					errorMsgs.add("�q�ܽФŪť�");
				}
				
				String ord_mail = req.getParameter("ord_mail").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�H�c�ФŪť�");
				}
				
				String ord_city = req.getParameter("country").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�����ФŪť�");
				}
				
				String ord_code = req.getParameter("zipcode").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�ϽX�ФŪť�");
				}
				
				String ord_section = req.getParameter("district").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�ϰ�ФŪť�");
				}
				
				String ord_address = req.getParameter("address").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�a�}�ФŪť�");
				}
				
				String ord_price = req.getParameter("ord_price").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�`���B�ФŪť�");
				}
				
				String mem_no = req.getParameter("mem_no").trim();
				if (ord_mail == null || ord_mail.trim().length() == 0) {
					errorMsgs.add("�|���s���ФŪť�");
				}
				
				String ord_coup = req.getParameter("coup_no").trim();
				if("".equals(ord_coup)) {
					ord_coup = "�L";
				} 
				
				OrdVO ordVO = new OrdVO();
				ordVO.setOrdName(ord_name);
				ordVO.setOrdPhone(ord_phone);
				ordVO.setOrdMail(ord_mail);
				ordVO.setOrdCity(ord_city);
				ordVO.setOrdCode(ord_code);
				ordVO.setOrdSection(ord_section);
				ordVO.setOrdAddress(ord_address);
				ordVO.setOrdPrice(ord_price);
				ordVO.setMemNo(mem_no);
				ordVO.setOrdCoup(ord_coup);
				//�o�̥ثe�g��
				ordVO.setEmpNo("e001");
				ordVO.setOrdStatus("���I��");
				//�H�W�ثe�g��
				
				List<ItemVO> list = (List<ItemVO>) session.getAttribute("shopcart");

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ordVO", ordVO); // �t����J�榡���~��ordVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shopAddress.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				OrdService ordSvc = new OrdService();
				String ord_no = ordSvc.addOrd(ordVO, list);
				ordVO.setOrdNo(ord_no);
				
				//�s�nitem�Mord_price=amoumt��A�M��session
				session.removeAttribute("shopcart");
				session.removeAttribute("amount");
				
				//�ϥ��u�f��A�����u�f�骺���A
				String coup_no = req.getParameter("coup_no");
//				System.out.println("coup_no = "+ coup_no);
				if(!"".equals(coup_no)) {
					String coup_status = "�ϥΧ���";
					CoupService coupSvc = new CoupService();
					coupSvc.updateStatus(coup_no, coup_status);
				}
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				req.setAttribute("ordVO", ordVO);
				String url = "/shop_product/shopPay.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllProd.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shopAddress.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Update_Status".equals(action)) { // �Ӧ�listAllOrd.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				String ord_no = req.getParameter("ord_no").trim();
				if (ord_no == null || ord_no.trim().length() == 0) {
					errorMsgs.add("�q��s���ФŪť�");
				}
				String ord_status = req.getParameter("ord_status").trim();
				if (ord_status == null || ord_status.trim().length() == 0) {
					errorMsgs.add("�q�檬�A�ФŪť�");
				}
				
				OrdVO ordVO = new OrdVO();
				ordVO.setOrdNo(ord_no);
				ordVO.setOrdStatus(ord_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ordVO", ordVO); // �t����J�榡���~��ordVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllOrd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				OrdService ordSvc = new OrdService();
				ordSvc.updateStatus(ord_no, ord_status);
				//�p�G���A�O�w�X�f�Aemail�q���X�f
				if(ord_status.equals("�w�X�f")) {
					
					String mem_no = new OrdService().getOneOrd(ord_no).getMemNo();

					String to = "denny0329denny0329@gmail.com";
					String subject = "ToyAllHot�q���G�A�q�ʪ��ӫ~�w�X�f";
					
					String messageText = "�˷R���|�� "+mem_no+" �A�n�G\n"
								+"�q��"+ord_no+"�w�H�X\n"
								+"�a�۴��ݪ��ߦ���a��\n"
								+"ToyAllHot �P�±z���ʶR��";
					
					MailService MailSvc = new MailService();
					MailSvc.sendMail(to, subject, messageText);
				}
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = null;
				if(ord_status.equals("�w�I��")) {
					url = "/shop_product/shopFinish.jsp";
				} else if(ord_status.equals("�w�X�f")) {
					 url = "/shop_product/listAllOrd.jsp";
				} else if(ord_status.equals("�q�槹��")) {
					 url = "/shop_product/shopOrder.jsp";
				}
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllOrd.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("payOrder".equals(action)) { // �Ӧ�listAllOrd.jsp���ШD  
			
			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				String ord_no = req.getParameter("ord_no").trim();
				System.out.println(ord_no);
				/***************************2.�}�l�s�W���***************************************/
				OrdService ordSvc = new OrdService();
				OrdVO ordVO = ordSvc.getOneOrd(ord_no);
				System.out.println(ordVO.getOrdCoup());
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				req.setAttribute("ordVO", ordVO);
				String url = "/shop_product/shopPay.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);			
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}
