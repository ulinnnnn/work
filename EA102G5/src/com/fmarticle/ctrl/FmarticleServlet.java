package com.fmarticle.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fmarticle.model.fmarticleService;
import com.fmarticle.model.fmarticleVO;
import com.fmmessage.model.fmmeService;


@MultipartConfig()


public class FmarticleServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("1");
			
			if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
					String fm_no = req.getParameter("fm_no");
					if (fm_no == null || (fm_no.trim()).length() == 0) {
						errorMsgs.add("�п�J�峹�s��");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/select_page.jsp");
						failureView.forward(req, res);
						return;//�{�����_
					}
					
					Integer fm_notest = null;
					try {
						fm_notest = new Integer(fm_no);
					} catch (Exception e) {
						errorMsgs.add("�榡���~");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/select_page.jsp");
						failureView.forward(req, res);
						return;//�{�����_
					}
					
					/***************************2.�}�l�d�߸��*****************************************/
					fmarticleService fmSvce = new fmarticleService();
					fmarticleVO fmarticleVO = fmSvce.getOne(fm_no);
					if (fmarticleVO == null) {
						errorMsgs.add("�d�L���");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/select_page.jsp");
						failureView.forward(req, res);
						return;//�{�����_
					}
					
					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
					req.setAttribute("fmarticleVO", fmarticleVO); // ��Ʈw���X��empVO����,�s�Jreq
					String url = "/fm-front/NewFile.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					errorMsgs.add("�L�k���o���:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/select_page.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			if("insert".equals(action)) {
				System.out.println("2");
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
					String fm_head = req.getParameter("fm_head");
					if (fm_head == null || fm_head.trim().length() == 0) {
						errorMsgs.add("���D�����");
					}
					
					String fmcl_no = req.getParameter("fmcl_no").trim();
					if (fmcl_no == null || fmcl_no.trim().length() == 0) {
						errorMsgs.add("���O�����");
					}
					
					String fm_text = req.getParameter("fm_text").trim();
					if (fm_text == null || fm_text.trim().length() == 0) {
						errorMsgs.add("���夣���");
					}
					
					String mem_no = req.getParameter("mem_no");
					if (mem_no == null || mem_no.trim().length() == 0) {
						errorMsgs.add("�еn�J!");
					}
					
					
					byte[] fm_pic1 = null;
					   Part part = req.getPart("fm_pic1");
					   java.io.InputStream in = part.getInputStream();
					   byte[] buf = new byte[in.available()];
					   in.read(buf);
					   fm_pic1 = buf;
					   in.close();
					   
					   byte[] fm_pic2 = null;
					   Part part2 = req.getPart("fm_pic2");
					   java.io.InputStream in2 = part2.getInputStream();
					   byte[] buf2 = new byte[in2.available()];
					   in2.read(buf2);
					   fm_pic2 = buf2;
					   in2.close();
					   System.out.println("222222222");
					   
//					   byte[] fm_pic3 = null;
//					   Part part3 = req.getPart("fm_pic3");
//					   java.io.InputStream in3 = part3.getInputStream();
//					   byte[] buf3 = new byte[in3.available()];
//					   in.read(buf3);
//					   fm_pic3 = buf3;
//					   in.close();
//					   System.out.println("3333");
					   
					fmarticleVO fmarticleVO = new fmarticleVO();
			System.out.println("4444");
					fmarticleVO.setFm_head(fm_head);
					fmarticleVO.setFmcl_no(fmcl_no);
					fmarticleVO.setFm_text(fm_text);
					fmarticleVO.setMem_no(mem_no);
					fmarticleVO.setFm_pic1(fm_pic1);	
					fmarticleVO.setFm_pic2(fm_pic2);
//					fmarticleVO.setFm_pic2(fm_pic3);
					System.out.println("5555");
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						System.out.println("err");
						req.setAttribute("fmarticleVO", fmarticleVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/fmins.jsp");
						failureView.forward(req, res);
						return;
					}
					
					
					/***************************2.�}�l�s�W���***************************************/
					System.out.println("�s�W");
					fmarticleService fmSvc = new fmarticleService();
					fmSvc.addfm(fm_head, fm_text, mem_no, fmcl_no, fm_pic1, fm_pic2);
//					fmSvc.addfm(fm_head, fm_text, mem_no, fmcl_no, fm_pic1, fm_pic2, fm_pic3);
					
					/***************************3.�s�W����,�ǳ����(Send the Success view)***********/

					String url = "/fm-front/myfm.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
					successView.forward(req, res);				
					
//					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage()+"�Q�ڧ��F");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/fmins2.jsp");
					failureView.forward(req, res);
				}

				
			}
			if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.�����ШD�Ѽ�****************************************/
					String fm_no = req.getParameter("fm_no");
					System.out.println(fm_no);
					/***************************2.�}�l�d�߸��****************************************/
					fmarticleService fmSvc = new fmarticleService();
					System.out.println("123");
					fmarticleVO fmarticleVO = fmSvc.getOne(fm_no);	
					System.out.println("456");
					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
					req.setAttribute("fmarticleVO", fmarticleVO);  
					System.out.println("789");
					// ��Ʈw���X��empVO����,�s�Jreq
					String url = "/fm-front/fmupd.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					
					errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/myfm.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				System.out.println("11111");
			
				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
					String fm_no = req.getParameter("fm_no");
					System.out.println("2");
					String fm_head = req.getParameter("fm_head");
					if (fm_head == null || fm_head.trim().length() == 0) {
						errorMsgs.add("���D�����");
					}
					
					String fmcl_no = req.getParameter("fmcl_no").trim();
					System.out.println("3");
					String fm_text = req.getParameter("fm_text");
					if (fm_head == null || fm_head.trim().length() == 0) {
						errorMsgs.add("���夣���");
					}

					String mem_no = req.getParameter("mem_no");
					fmarticleService fmSvc = new fmarticleService();
					System.out.println("4");
					byte[] fm_pic1 = null;
					   Part part = req.getPart("fm_pic1");
					   java.io.InputStream in = part.getInputStream();
				if(in.available()!=0){	
					   byte[] buf = new byte[in.available()];
					   in.read(buf);
					   fm_pic1 = buf;
					   System.out.println("22222");
					   in.close();
					   System.out.println("221");
					   
				}else{
					System.out.println(fm_no);
					fm_pic1 = fmSvc.getOne(fm_no).getFm_pic1();
				}
				
				byte[] fm_pic2 = null;
				Part part2 = req.getPart("fm_pic2");
				java.io.InputStream in2 = part2.getInputStream();
				if(in2.available()!=0){	
					byte[] buf2 = new byte[in2.available()];
					in2.read(buf2);
					fm_pic2 = buf2;
					System.out.println("3333");
					in2.close();
					
				}else{
					System.out.println(fm_no);
					fm_pic2 = fmSvc.getOne(fm_no).getFm_pic2();
				}
				
//				byte[] fm_pic3 = null;
//				Part part3 = req.getPart("fm_pic3");
//				java.io.InputStream in3 = part3.getInputStream();
//				if(in3.available()!=0){	
//					byte[] buf3 = new byte[in3.available()];
//					in.read(buf3);
//					fm_pic3 = buf3;
//					in.close();
//					
//				}else{
//					System.out.println(fm_no);
//					fm_pic3 = fmSvc.getOne(fm_no).getFm_pic3();
//				}
													   
					fmarticleVO fmarticleVO = new fmarticleVO();
					
					fmarticleVO.setFm_head(fm_head);
					fmarticleVO.setFmcl_no(fmcl_no);
					fmarticleVO.setFm_text(fm_text);
					fmarticleVO.setMem_no(mem_no);
					fmarticleVO.setFm_pic1(fm_pic1);	
					fmarticleVO.setFm_pic2(fm_pic2);
					System.out.println("4444");
//					fmarticleVO.setFm_pic2(fm_pic3);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("fmarticleVO", fmarticleVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/fmupd.jsp");
						failureView.forward(req, res);
						return; //�{�����_
					}
					
					/***************************2.�}�l�ק���*****************************************/
					fmSvc = new fmarticleService();
					fmarticleVO = fmSvc.updatefm(fm_no, fm_head, fm_text, mem_no, fmcl_no, fm_pic1, fm_pic2);
					System.out.println("5555");
//					fmarticleVO = fmSvc.updatefm(fm_head, fm_text, mem_no, fmcl_no, fm_pic1, fm_pic2, fm_pic3);
					
					/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
					req.setAttribute("fmarticleVO", fmarticleVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
					System.out.println("6666");
					String url = "/fm-front/myfm.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					errorMsgs.add("�ק��ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/myfm.jsp");
					failureView.forward(req, res);
				}
			}
			

			if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp
				System.out.println("��");

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.�����ШD�Ѽ�***************************************/
					String fm_no = null ;
					 fm_no = req.getParameter("fm_no");
					System.out.println("11");
					/***************************2.�}�l�R�����***************************************/
					fmarticleService fmSvc = new fmarticleService();
					fmSvc.delete(fm_no);
					System.out.println("22");
					/***************************3.�R������,�ǳ����(Send the Success view)***********/								
					String url = "/fm-front/myfm.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
					successView.forward(req, res);
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("�R����ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/myfm.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("question".equals(action)) { // �Ӧ�listAllEmp.jsp
				System.out.println("���o");
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.�����ШD�Ѽ�***************************************/
					String fm_no = null ;
					 fm_no = req.getParameter("fm_no");
					 System.out.println(fm_no);
				
					 String mem_no = null ;
					 mem_no = req.getParameter("mem_no");
					
					 String qmem_no = req.getParameter("qmem_no");
					 if(qmem_no == null || qmem_no.length() == 0) {
						 errorMsgs.add("�еn�J�A�i��d��");
					 }

				
					 
					 String qfmme_text = req.getParameter("qfmme_text");
					 if(qfmme_text == null || qfmme_text =="" ){
					 }
				
					res.setContentType("text/html;charset=UTF-8");
					
					
					
					
					fmmeService fmmeSvc = new fmmeService();
					fmmeSvc.addfmme(fm_no,mem_no,qmem_no,qfmme_text);
					
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/NewFile.jsp?"+fm_no);
					failureView.forward(req, res);
					
					
				
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/NewFile.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("reply".equals(action)) { // �Ӧ�listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				String fm_no = null ;
				 fm_no = req.getParameter("fm_no");
				try {
					/***************************1.�����ШD�Ѽ�***************************************/
				
					 fm_no = req.getParameter("fm_no");
				
					 String fmme_no = null ;
					 fmme_no = req.getParameter("fmme_no");
					 
					 String fmme_text = null ;
					 fmme_text = req.getParameter("fmme_text");
					
					 
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/NewFile.jsp?"+fm_no);
						failureView.forward(req, res);
						return;//�{�����_
					}
					 
					/***************************2.�}�l�s�W���D���***************************************/
			
					fmmeService fmmeSvc = new fmmeService();
					fmmeSvc.updatefmme(fmme_text,fmme_no);
					/***************************3.����,�ǳ����(Send the Success view)***********/	
					fmarticleService fmSvc = new fmarticleService();
					fmarticleVO fmarticleVO = fmSvc.getOne(fm_no);
					req.setAttribute("fmarticleVO", fmarticleVO);
				
					String url = "/fm-front/TRY1.jsp?"+fm_no;
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/listallbp.jsp?"+fm_no);
					failureView.forward(req, res);
				}
			}
			
//			if ("updatereport".equals(action)) { // �Ӧ�listAllEmp.jsp
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//		
//				try {
//					/***************************1.�����ШD�Ѽ�***************************************/
//					String fmrp_no = null ;
//					fmrp_no = req.getParameter("fmrp_no");
//					System.out.println(fmrp_no);
//					
//					String fmrp_status = null ;
//					fmrp_status = req.getParameter("fmrp_status");
//					System.out.println(fmrp_status);
//					
//					 
//					/***************************2.�}�l�s�W���D���***************************************/
//			
//					FmrpService fmrpSvc = new FmrpService();
//					fmrpSvc.updatefmrp(fmrp_status, fmrp_no);
//					/***************************3.�R������,�ǳ����(Send the Success view)***********/	
////					BprpVO bprpVO = null ;
//					
//				
//					String url = "/bpclass-back/listbackbp.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
//					successView.forward(req, res);
//					
//					/***************************��L�i�઺���~�B�z**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/bpclass-back/listbackbp.jsp");
//					failureView.forward(req, res);
//				}
//			}
			if ("get_head".equals(action)) { // �Ӧ�select_page.jsp���ШD

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
					String head = "%"+req.getParameter("head")+"%";
					if (head == null || (head.trim()).length() == 0) {
						errorMsgs.add("?");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/fm-front/select_page.jsp");
						failureView.forward(req, res);
						return;//�{�����_
					}

					
					/***************************2.�}�l�d�߸��*****************************************/
					fmarticleService fmSvc = new fmarticleService();
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req	
								.getRequestDispatcher("/fm-front/select_page.jsp");
						failureView.forward(req, res);
						return;//�{�����_
					}
					
					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
					req.setAttribute("fmarticleVO", head); // ��Ʈw���X��empVO����,�s�Jreq
					
					String url = "/fm-front/listallbp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					errorMsgs.add("�L�k���o���:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/fm-front/select_page.jsp");
					failureView.forward(req, res);
				}
			}
			
//			if ("Subscript".equals(action)) { //�U��
//				List<String> errorMsgs = new LinkedList<String>();
//					req.setAttribute("errorMsgs", errorMsgs);
//					HttpSession session=req.getSession();
//				try {
//					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
//					String mem_no = req.getParameter("mem_no");
//					if (mem_no == null || (mem_no.trim()).length() == 0) {
//						errorMsgs.add("�еn�J?");
//					}
//
//					String fm_no = req.getParameter("fm_no");
//
//					fmarticleService fmSvc = new fmarticleService();
//					fmarticleVO fmarticleVO = fmSvc.getOnebp(fm_no);
//					if (fmarticleVO == null) {
//						errorMsgs.add("�S���");
//					}
//	/***************************2.�S�n�J���o��*****************************************/
//					if (!errorMsgs.isEmpty()) {
//						session.setAttribute("fmarticleVO", fmarticleVO);
//						RequestDispatcher failureView = req		
//								.getRequestDispatcher("/fm-front/corfirmpay.jsp");
//						failureView.forward(req, res);
//						return;//�{�����_
//					}
//	/***************************2.���`�n�J���o��*****************************************/
//					fmSvc = new fmarticleService();
//					fmarticleVO = fmSvc.getOnebp(fm_no);
//					if (fmarticleVO == null) {
//						errorMsgs.add("�S���");
//					}
//					if (!errorMsgs.isEmpty()) {
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/fm-front/select_page.jsp");
//						failureView.forward(req, res);
//						return;//�{�����_
//					}
//					
//					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
//					req.setAttribute("fmarticleVO", fmarticleVO); // ��Ʈw���X��empVO����,�s�Jreq
//					String url = "/fm-front/corfirmpay.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
//					successView.forward(req, res);
//
//					/***************************��L�i�઺���~�B�z*************************************/
//				} catch (Exception e) {
//					errorMsgs.add("�L�k���o���:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/fm-front/select_page.jsp");
//					failureView.forward(req, res);
//				}
//			}
			
//			if ("update_status".equals(action)) { // �Ӧ�listAllEmp.jsp
//
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//		
//				
//				
//				try {
//					/***************************1.�����ШD�Ѽ�***************************************/
//					 String fm_no = null ;
//					 fm_no = req.getParameter("fm_no");
//				
//					 String bpst_no = null ;
//					 bpst_no = req.getParameter("bpst_no");
//					 
//					 
//					/***************************2.�}�l�s�W���D���***************************************/
//			
//					fmarticleService fmSvc = new fmarticleService();
//					fmSvc.update_status(bpst_no,fm_no);
//					
//					/***************************3.����,�ǳ����(Send the Success view)***********/	
//
//					
//					fmarticleVO fmarticleVO = fmSvc.getOnebp(fm_no);
//					req.setAttribute("fmarticleVO", fmarticleVO);
//				
//					String url = "/fm-front/mybp.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url);
//					successView.forward(req, res);
//					
//					/***************************��L�i�઺���~�B�z**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/fm-front/mybp.jsp");
//					failureView.forward(req, res);
//				}
//			}
//			
//			if ("insertreport".equals(action)) { // �Ӧ�listAllEmp.jsp
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//		
//				try {
//					/***************************1.�����ШD�Ѽ�***************************************/
//					
//					String fm_no = null ;
//					fm_no = req.getParameter("fm_no");
//					
//					String mem_no = null ;
//					mem_no = req.getParameter("mem_no");
//
//					String fmrp_text = null ;
//					fmrp_text = req.getParameter("fmrp_text");
//					 if(fmrp_text == null || fmrp_text ==""){
//						 errorMsgs.add("�п�J�d�����e");
//					 }
//					 
//					res.setContentType("text/html;charset=UTF-8");
//						
//					PrintWriter out = res.getWriter();
//					
//					if (!errorMsgs.isEmpty()) {	
//						for(String s :errorMsgs)
//							out.print(s);
//						return;
//					}
//					/** *************************2.���D��Ʀs�J***************************************/
//			
//					FmrpService fmrpSvc = new FmrpService();
//					fmrpSvc.addfmrp(fm_no, mem_no, fmrp_text);
//					
//					/***************************��L�i�઺���~�B�z**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/bpclass-back/listallreport.jsp");
//					failureView.forward(req, res);
//				}
//			
//			}
//		
//			if ("addtr".equals(action)) { // �Ӧ�listAllEmp.jsp
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//		
//				try {
//					/***************************1.�����ШD�Ѽ�***************************************/
//
//					
//					String mem_no = null ;
//					mem_no = req.getParameter("mem_no");
//					 if(mem_no == null || mem_no ==""){
//						 errorMsgs.add("�п�n�J�A�i��l��");
//					 }
//					
//					
//					String fm_no = null ;
//					fm_no = req.getParameter("fm_no");
//					res.setContentType("text/html;charset=UTF-8");
//					PrintWriter out = res.getWriter();
//					if (!errorMsgs.isEmpty()) {	
//						for(String s :errorMsgs)
//							out.print(s);
//						return;
//					}
//					/** *************************2.���D��Ʀs�J***************************************/
//			
//					FmtrService fmtrSvc = new FmtrService();
//					fmtrSvc.addbptr(mem_no,fm_no);
//					
//					/***************************��L�i�઺���~�B�z**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/fm-front/TRY1.jsp");
//					failureView.forward(req, res);
//				}
//			
//			}
//			
//			if ("deletebptr".equals(action)) { // �Ӧ�listAllEmp.jsp
//
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//		
//				try {
//					/***************************1.�����ШD�Ѽ�***************************************/
//
//					
//					String mem_no = null ;
//					mem_no = req.getParameter("mem_no");	
//					
//					String fm_no = null ;
//					fm_no = req.getParameter("fm_no");
//
//					
//					res.setContentType("text/html;charset=UTF-8");
//					PrintWriter out = res.getWriter();
//					if (!errorMsgs.isEmpty()) {	
//						for(String s :errorMsgs)
//							out.print(s);
//						return;
//					}
//					/** *************************2.���D��Ʀs�J***************************************/
//			
//					FmtrService fmtrSvc = new FmtrService();
//					fmtrSvc.delete(mem_no,fm_no);
//					RequestDispatcher failureView =req.getRequestDispatcher("/fm-front/addbp.jsp");
//					failureView.forward(req, res);
//					
//					/***************************��L�i�઺���~�B�z**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/fm-front/TRY1.jsp");
//					failureView.forward(req, res);
//				}
//			}
		}
}
