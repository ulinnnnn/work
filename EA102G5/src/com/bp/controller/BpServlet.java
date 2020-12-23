package com.bp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.JSONException;
import org.json.JSONObject;
import com.bp.model.BpService;
import com.bp.model.BpVO;
import com.bpmessage.model.BpmeService;
import com.bpreport.model.BprpService;
import com.bpreport.model.BprpVO;
import com.bptrack.model.BptrService;



@MultipartConfig()

public class BpServlet extends HttpServlet {
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
				String bp_no = req.getParameter("bp_no");
				if (bp_no == null || (bp_no.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s���n�}?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer bp_notest = null;
				try {
					bp_notest = new Integer(bp_no);
				} catch (Exception e) {
					errorMsgs.add("�榡? are you cry?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				BpService bpSvc = new BpService();
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				if (bpVO == null) {
					errorMsgs.add("�S���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("bpVO", bpVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bp-front/TRY1.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if("insert".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String bp_head = req.getParameter("bp_head");
				if (bp_head == null || bp_head.trim().length() == 0) {
					errorMsgs.put("bp_head","���D�����");
				}
				
				String bpcl_no = req.getParameter("bpcl_no").trim();
				if (bpcl_no == null || bpcl_no.trim().length() == 0) {
					errorMsgs.put("bpcl_no","���O�����");
				}
				
				String bp_new = req.getParameter("bp_new");
	
				String bp_loc = req.getParameter("bp_loc");
				if (bp_loc == null || bp_loc.trim().length() == 0) {
					errorMsgs.put("bp_loc","�ӫ~��m�����");
				}
				
				Integer bp_pri = null;
				try {
					bp_pri = new Integer(req.getParameter("bp_pri").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("bp_pri","����ж�Ʀr");
				}
				
				String bp_del = req.getParameter("bp_del");
				if (bp_del == null || bp_del.trim().length() == 0) {
					errorMsgs.put("bp_del","����覡�����");
				}
			
				String bp_text = req.getParameter("bp_text");
				if (bp_text == null || bp_text.trim().length() == 0) {
					errorMsgs.put("bp_text","���夣���");
				}
				
				java.sql.Date bp_dot = null;
				try {
					bp_dot = java.sql.Date.valueOf(req.getParameter("hiredate"));
				} catch (IllegalArgumentException e) {
					bp_dot = new java.sql.Date(System.currentTimeMillis());
				}
				
				
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.put("mem_no","�еn�J!");
				}
				
				
				byte[] bp_pic1 = null;
				   Part part = req.getPart("bp_pic1");
				   java.io.InputStream in = part.getInputStream();
				   byte[] buf = new byte[in.available()];
				   in.read(buf);
				   bp_pic1 = buf;
				   in.close();
	
				 
			    byte[] bp_pic2 = null;
				   Part part2 = req.getPart("bp_pic2");
				   java.io.InputStream in2 = part2.getInputStream();
				   byte[] buf2 = new byte[in2.available()];
				   in2.read(buf2);
				   bp_pic2 = buf2;
				   in.close();

					String lat =req.getParameter("lat");
					String lng =req.getParameter("lng");
				   
				   
				BpVO bpVO = new BpVO();
		
				bpVO.setBp_head(bp_head);
				bpVO.setBpcl_no(bpcl_no);
				bpVO.setBp_new(bp_new);
				bpVO.setBp_loc(bp_loc);
				bpVO.setBp_pri(bp_pri);
				bpVO.setBp_del(bp_del);
				bpVO.setBp_text(bp_text);
				bpVO.setBp_dot(bp_dot);
				bpVO.setMem_no(mem_no);
				bpVO.setBp_pic1(bp_pic1);
				bpVO.setBp_pic2(bp_pic2);
				bpVO.setLat(lat);
				bpVO.setLng(lng);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bpVO", bpVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/TRY2.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				/***************************2.�}�l�s�W���***************************************/
				BpService bpSvc = new BpService();
				bpSvc.addbp(bp_head, bpcl_no, bp_new, bp_loc, bp_pri, bp_del, bp_text, bp_dot, mem_no, bp_pic1, bp_pic2,lat,lng);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = req.getContextPath()+"/bp-front/mybp.jsp";
				res.sendRedirect(url);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.put("exception",e.getMessage()+"�Q�ڧ��F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY2.jsp");
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
				String bp_no = req.getParameter("bp_no");
				/***************************2.�}�l�d�߸��****************************************/
				BpService bpSvc = new BpService();

				BpVO bpVO = bpSvc.getOnebp(bp_no);	

				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("bpVO", bpVO);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bp-front/TRY3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/mybp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String bp_no = req.getParameter("bp_no");

				String bp_head = req.getParameter("bp_head");
				if (bp_head == null || bp_head.trim().length() == 0) {
					errorMsgs.add("���D�����");
				}
				
				String bpcl_no = req.getParameter("bpcl_no").trim();
				if (bpcl_no == null || bpcl_no.trim().length() == 0) {
					errorMsgs.add("���O�����");
				}
				
				String bp_new = req.getParameter("bp_new");
	
				String bp_loc = req.getParameter("bp_loc");
				if (bp_loc == null || bp_loc.trim().length() == 0) {
					errorMsgs.add("�ӫ~��m�����");
				}
				Integer bp_pri = null;
				try {
					bp_pri = new Integer(req.getParameter("bp_pri").trim());
				} catch (NumberFormatException e) {
					bp_pri = 0;
					errorMsgs.add("���椣���");
				}
				
				String bp_del = req.getParameter("bp_del");
				if (bp_del == null || bp_del.trim().length() == 0) {
					errorMsgs.add("�f�B��k�����");
				}
			
				String bp_text = req.getParameter("bp_text");

				java.sql.Date bp_dot = null;
				
				try {
					bp_dot = java.sql.Date.valueOf(req.getParameter("hiredate"));
				} catch (IllegalArgumentException e) {
					bp_dot = new java.sql.Date(System.currentTimeMillis());

				}
						
				String mem_no = req.getParameter("mem_no");
				BpService bpSvc = new BpService();
				
				byte[] bp_pic1 = null;
				   Part part = req.getPart("bp_pic1");
				   java.io.InputStream in = part.getInputStream();
			if(in.available()!=0){	
				   byte[] buf = new byte[in.available()];
				   in.read(buf);
				   bp_pic1 = buf;
				   in.close();   
			}else{
				bp_pic1 = bpSvc.getOnebp(bp_no).getBp_pic1();
				
			}

			    byte[] bp_pic2 = null;
				   Part part2 = req.getPart("bp_pic2");
				   java.io.InputStream in2 = part2.getInputStream();
			if(in2.available()!=0){		   
				   byte[] buf2 = new byte[in2.available()];
				   in2.read(buf2);
				   bp_pic2 = buf2;
				   in2.close();
			}else{

				bp_pic2 = bpSvc.getOnebp(bp_no).getBp_pic2();
			}
			
			String lat = null;
			lat = req.getParameter("lat");
			System.out.println(lat.equals(""));
			if(lat.equals("")) {
				lat = bpSvc.getOnebp(bp_no).getLat();
				System.out.println("���~�B�z�y�иɥ�");
			}
			
			String lng = null;
		    lng =req.getParameter("lng");
			System.out.println(lng.equals(""));
			if(lng.equals("")) {
				lng = bpSvc.getOnebp(bp_no).getLng();
			}
			
			
				BpVO bpVO = new BpVO();
				
				bpVO.setBp_no(bp_no);
				bpVO.setBp_head(bp_head);
				bpVO.setBpcl_no(bpcl_no);
				bpVO.setBp_new(bp_new);
				bpVO.setBp_loc(bp_loc);
				bpVO.setBp_pri(bp_pri);
				bpVO.setBp_del(bp_del);
				bpVO.setBp_text(bp_text);
				bpVO.setBp_dot(bp_dot);
				bpVO.setMem_no(mem_no);
				bpVO.setBp_pic1(bp_pic1);	
				bpVO.setBp_pic2(bp_pic2);
				bpVO.setLat(lat);
				bpVO.setLng(lng);

				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bpVO", bpVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/TRY3.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				bpSvc = new BpService();
				bpVO= bpSvc.updatebp(bp_no , bp_head, bpcl_no, bp_new, bp_loc, bp_pri, bp_del, bp_text, bp_dot, mem_no, bp_pic1, bp_pic2,lat,lng);
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("bpVO", bpVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				
				String url = "/bp-front/mybp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				System.out.println(384);
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY3.jsp");
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
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
				
				/***************************2.�}�l�R�����***************************************/
				BpService bpSvc = new BpService();
				bpSvc.delete(bp_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/bp-front/listbackbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listbackbp.jsp");
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
				String url = "/bp-front/listbackbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listbackbp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("question".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
			
				 String mem_no = null ;
				 mem_no = req.getParameter("mem_no");
				
				 String qmem_no = req.getParameter("qmem_no");
				 System.out.println(qmem_no.length());
				 if(qmem_no == null || qmem_no.length() == 0) {
					 errorMsgs.add("�еn�J�A�i��d��");
				 }

			
				 
				 String qbpme_text = req.getParameter("qbpme_text");
				 if(qbpme_text == null || qbpme_text =="" ){
					 errorMsgs.add("�п�J�d�����e");
				 }
			
				res.setContentType("text/html;charset=UTF-8");
				
				PrintWriter out = res.getWriter();
				
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				
				BpmeService bpmeSvc = new BpmeService();
				bpmeSvc.addbpme(bp_no,mem_no,qmem_no,qbpme_text);
			
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY1.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("reply".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			String bp_no = null ;
			 bp_no = req.getParameter("bp_no");
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
			
				 bp_no = req.getParameter("bp_no");
			
				 String bpme_no = null ;
				 bpme_no = req.getParameter("bpme_no");
				 
				 String bpme_text = null ;
				 bpme_text = req.getParameter("bpme_text");
				
				 
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/TRY1.jsp?"+bp_no);
					failureView.forward(req, res);
					return;//�{�����_
				}
				 
				/***************************2.�}�l�s�W���D���***************************************/
		
				BpmeService bpmeSvc = new BpmeService();
				bpmeSvc.updatebpme(bpme_text,bpme_no);
				/***************************3.����,�ǳ����(Send the Success view)***********/	
				BpService bpSvc = new BpService();
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				req.setAttribute("bpVO", bpVO);
			
				String url = "/bp-front/TRY1.jsp?"+bp_no;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp?"+bp_no);
				failureView.forward(req, res);
			}
		}
		
		if ("updatereport".equals(action)) { // �Ӧ�listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String bprp_no = null ;
				bprp_no = req.getParameter("bprp_no");
				System.out.println(bprp_no);
				
				String bprp_status = null ;
				bprp_status = req.getParameter("bprp_status");
				System.out.println(bprp_status);
				
				 
				/***************************2.�}�l�s�W���D���***************************************/
		
				BprpService bprpSvc = new BprpService();
				bprpSvc.updatebprp(bprp_status,bprp_no);
				/***************************3.�R������,�ǳ����(Send the Success view)***********/	
//				BprpVO bprpVO = null ;
				
			
				String url = "/bpclass-back/listbackbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listbackbp.jsp");
				failureView.forward(req, res);
			}
		}
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
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				
				/***************************2.�}�l�d�߸��*****************************************/
				BpService bpSvc = new BpService();
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req	
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("bpVO", head); // ��Ʈw���X��empVO����,�s�Jreq
				
				String url = "/bp-front/listallbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Subscript".equals(action)) { //�U��
			List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				HttpSession session=req.getSession();
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || (mem_no.trim()).length() == 0) {
					errorMsgs.add("�еn�J?");
				}

				String bp_no = req.getParameter("bp_no");

				BpService bpSvc = new BpService();
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				if (bpVO == null) {
					errorMsgs.add("�S���");
				}
/***************************2.�S�n�J���o��*****************************************/
				if (!errorMsgs.isEmpty()) {
					session.setAttribute("bpVO", bpVO);
					RequestDispatcher failureView = req		
							.getRequestDispatcher("/bp-front/corfirmpay.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
/***************************2.���`�n�J���o��*****************************************/
				bpSvc = new BpService();
				bpVO = bpSvc.getOnebp(bp_no);
				if (bpVO == null) {
					errorMsgs.add("�S���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("bpVO", bpVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/bp-front/corfirmpay.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update_status".equals(action)) { // �Ӧ�listAllEmp.jsp
			System.out.println("1231");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			
			
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				 String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
			
				 String bpst_no = null ;
				 bpst_no = req.getParameter("bpst_no");
				 
				 
				/***************************2.�}�l�s�W���D���***************************************/
		
				BpService bpSvc = new BpService();
				bpSvc.update_status(bpst_no,bp_no);
				
				/***************************3.����,�ǳ����(Send the Success view)***********/	

				
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				req.setAttribute("bpVO", bpVO);
			
				String url = "/bp-front/mybp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/mybp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insertreport".equals(action)) { // �Ӧ�listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				
				String bp_no = null ;
				bp_no = req.getParameter("bp_no");
				
				String mem_no = null ;
				mem_no = req.getParameter("mem_no");

				String bprp_project = null;
				bprp_project = req.getParameter("bprp_project");
				
				String bprp_text = null ;
				bprp_text = req.getParameter("bprp_text");
				 if(bprp_text == null || bprp_text ==""){
					 errorMsgs.add("�п�J���|���e");
				 }
				 
				res.setContentType("text/html;charset=UTF-8");
					
				PrintWriter out = res.getWriter();
				
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				/** *************************2.���D��Ʀs�J***************************************/
		
				BprpService bprpSvc = new BprpService();
				bprpSvc.addbprp(bp_no,mem_no, bprp_project, bprp_text);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listallreport.jsp");
				failureView.forward(req, res);
			}
		
		}
	
		if ("addtr".equals(action)) { // �Ӧ�listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/

				
				String mem_no = null ;
				mem_no = req.getParameter("mem_no");
				 if(mem_no == null || mem_no ==""){
					 errorMsgs.add("�п�n�J�A�i��l��");
				 }
				
				
				String bp_no = null ;
				bp_no = req.getParameter("bp_no");
				res.setContentType("text/html;charset=UTF-8");
				PrintWriter out = res.getWriter();
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				/** *************************2.���D��Ʀs�J***************************************/
		
				BptrService bptrSvc = new BptrService();
				bptrSvc.addbptr(mem_no,bp_no);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY1.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		if ("deletebptr".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String mem_no = null ;
				mem_no = req.getParameter("mem_no");	
				
				String bp_no = null ;
				bp_no = req.getParameter("bp_no");

				
				res.setContentType("text/html;charset=UTF-8");
				PrintWriter out = res.getWriter();
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				/** *************************2.���D��Ʀs�J***************************************/
		
				BptrService bptrSvc = new BptrService();
				bptrSvc.delete(mem_no,bp_no);
				RequestDispatcher failureView =req.getRequestDispatcher("/bp-front/track.jsp");
				failureView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("����:"+e.getMessage()+"�ӳo�̤F");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY1.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
		
	}
}
