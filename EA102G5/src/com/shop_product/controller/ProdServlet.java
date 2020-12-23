package com.shop_product.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import com.shop_product.model.*;

@MultipartConfig
public class ProdServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//		System.out.println(action);
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�listAllProd.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("prod_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				String prod_no = null;
				try {
					prod_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�ӫ~�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_no);
				if (prodVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // ��Ʈw���X��prodVO����,�s�Jreq
				String url = "/shop_product/shopProd.jsp";
				//�ΨӧP�_�O�e�x�٬O��x���ШD
				String back_end = req.getParameter("back_end");		
				if("back_end".equals(back_end)) {
					url = "/shop_product/listProdDetail.jsp";
				}
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneProd.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllProd.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String prod_no = new String(req.getParameter("prod_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("prodVO", prodVO);         // ��Ʈw���X��prodVO����,�s�Jreq
				String url = "/shop_product/updateProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� updateProd.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�updateProd.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String prod_no = req.getParameter("prod_no").trim();
				
				String prod_name = req.getParameter("prod_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("�ӫ~�W��: �ФŪť�");
				} else if(!prod_name.trim().matches(nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�ӫ~�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				Double prod_price = null;
				try {
					prod_price = new Double(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0.0;
					errorMsgs.add("����ж�Ʀr");
				}
				
				String prod_brand = req.getParameter("prod_brand").trim();
				if (prod_brand == null || prod_brand.trim().length() == 0) {
					errorMsgs.add("�~�P�ФŪť�");
				}	

				String prod_intro = req.getParameter("prod_intro").trim();
				if (prod_intro == null || prod_intro.trim().length() == 0) {
					errorMsgs.add("���нФŪť�");
				}	

				String category_no = req.getParameter("category_no").trim();
				if (category_no == null || category_no.trim().length() == 0) {
					errorMsgs.add("�Ӻ����ФŪť�");
				}	

				String prod_status = req.getParameter("prod_status").trim();
				if (prod_status == null || prod_status.trim().length() == 0) {
					errorMsgs.add("���A�ФŪť�");
				}
				
				byte[] prod_photo = null;
				Part part = req.getPart("prod_photo");
				InputStream in = part.getInputStream();
				if(in.available()!=0) {
					prod_photo = getPictureByteArray(part);
				}else {
					prod_photo = new ProdService().getOneProd(prod_no).getProdPhoto();
				}

				
				ProdVO prodVO = new ProdVO();
				prodVO.setProdNo(prod_no);
				prodVO.setProdName(prod_name);
				prodVO.setProdPrice(prod_price);
				prodVO.setProdBrand(prod_brand);
				prodVO.setProdIntro(prod_intro);
				prodVO.setCategoryNo(category_no);
				prodVO.setProdStatus(prod_status);
				prodVO.setProdPhoto(prod_photo);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // �t����J�榡���~��prodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/updateProd.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				ProdService prodSvc = new ProdService();
				prodVO = prodSvc.updateProd(prod_no, prod_name, prod_price, prod_brand,
						prod_intro, category_no, prod_status, prod_photo);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // ��Ʈwupdate���\��,���T����prodVO����,�s�Jreq
				String url = "/shop_product/listProdDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneProd.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/updateProd.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addProd.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String prod_name = req.getParameter("prod_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("�ӫ~�W��: �ФŪť�");
				} else if(!prod_name.trim().matches(nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�ӫ~�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				Double prod_price = null;
				try {
					prod_price = new Double(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0.0;
					errorMsgs.add("����ж�Ʀr");
				}
				
				String prod_brand = req.getParameter("prod_brand").trim();
				if (prod_brand == null || prod_brand.trim().length() == 0) {
					errorMsgs.add("�~�P�ФŪť�");
				}
				
				String prod_intro = req.getParameter("prod_intro").trim();
				if (prod_intro == null || prod_intro.trim().length() == 0) {
					errorMsgs.add("���нФŪť�");
				}
				
				String category_no = req.getParameter("category_no").trim();
				if (category_no == null || category_no.trim().length() == 0) {
					errorMsgs.add("�ӫ~�����ФŪť�");
				}
				
				String prod_status = req.getParameter("prod_status").trim();
				if (prod_status == null || prod_status.trim().length() == 0) {
					errorMsgs.add("�ӫ~���A�ФŪť�");
				}
				
				Part part = req.getPart("prod_photo");
				byte[] prod_photo = getPictureByteArray(part);
				

				ProdVO prodVO = new ProdVO();
				prodVO.setProdName(prod_name);
				prodVO.setProdPrice(prod_price);
				prodVO.setProdBrand(prod_brand);
				prodVO.setProdIntro(prod_intro);
				prodVO.setCategoryNo(category_no);
				prodVO.setProdStatus(prod_status);
				prodVO.setProdPhoto(prod_photo);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // �t����J�榡���~��prodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/addProd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ProdService prodSvc = new ProdService();
				prodVO = prodSvc.addProd(prod_name, prod_price, prod_brand, prod_intro,
											category_no, prod_status, prod_photo);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/shop_product/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllProd.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/addProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllProd.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String prod_no = new String(req.getParameter("prod_no"));
//				System.out.println(prod_no);
				/***************************2.�}�l�R�����***************************************/
				ProdService prodSvc = new ProdService();
				prodSvc.deleteProd(prod_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/shop_product/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		 
		 
		 if ("updateStatus".equals(action)) { // �Ӧ�updateProd.jsp���ШD
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
					String prod_no = req.getParameter("prod_no").trim();
					
					String prod_status = req.getParameter("prod_status").trim();

					
					/***************************2.�}�l�ק���*****************************************/
					ProdService prodSvc = new ProdService();
					prodSvc.updateStatus(prod_no, prod_status);
					
					/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
					String url = "/shop_product/listAllProd.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					errorMsgs.add("�ק��ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllProd.jsp");
					failureView.forward(req, res);
				}
			}
		 
		 if ("insert_pchome".equals(action)) { // �Ӧ�addProd.jsp���ШD  

				try {
					/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
					String prod_name = req.getParameter("prod_name");
					
					Double prod_price = new Double(req.getParameter("prod_price").trim());
				
					
					String prod_brand = req.getParameter("prod_brand").trim();
					
					
					String prod_intro = req.getParameter("prod_intro").trim();
					
					
					String category_no = req.getParameter("category_no").trim();

					String prod_status = req.getParameter("prod_status").trim();
			
					ProdVO prodVO = new ProdVO();
					prodVO.setProdName(prod_name);
					prodVO.setProdPrice(prod_price);
					prodVO.setProdBrand(prod_brand);
					prodVO.setProdIntro(prod_intro);
					prodVO.setCategoryNo(category_no);
					prodVO.setProdStatus(prod_status);
					
					/***************************2.�}�l�s�W���***************************************/
					ProdService prodSvc = new ProdService();
					prodVO = prodSvc.addProdPchome(prod_name, prod_price, prod_brand, 
												   prod_intro,category_no, prod_status);
					
					/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
					String url = "/shop_product/pchomeProd.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllProd.jsp
					successView.forward(req, res);				
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/pchomeProd.jsp");
					failureView.forward(req, res);
				}
			}

	}
	
	//�ϥ�byte[]�覡
	 public static byte[] getPictureByteArray(Part part) throws IOException{
			InputStream in = part.getInputStream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int i = -1;
			while((i = in.read(buffer)) != -1) {
				out.write(buffer, 0, i);
			}
			out.close();
			in.close();
			
			return out.toByteArray();
	}
}
