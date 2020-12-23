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
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String bp_no = req.getParameter("bp_no");
				if (bp_no == null || (bp_no.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號好咪?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer bp_notest = null;
				try {
					bp_notest = new Integer(bp_no);
				} catch (Exception e) {
					errorMsgs.add("格式? are you cry?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				BpService bpSvc = new BpService();
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				if (bpVO == null) {
					errorMsgs.add("沒資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("bpVO", bpVO); // 資料庫取出的empVO物件,存入req
				String url = "/bp-front/TRY1.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
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
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String bp_head = req.getParameter("bp_head");
				if (bp_head == null || bp_head.trim().length() == 0) {
					errorMsgs.put("bp_head","標題不能空");
				}
				
				String bpcl_no = req.getParameter("bpcl_no").trim();
				if (bpcl_no == null || bpcl_no.trim().length() == 0) {
					errorMsgs.put("bpcl_no","類別不能空");
				}
				
				String bp_new = req.getParameter("bp_new");
	
				String bp_loc = req.getParameter("bp_loc");
				if (bp_loc == null || bp_loc.trim().length() == 0) {
					errorMsgs.put("bp_loc","商品位置不能空");
				}
				
				Integer bp_pri = null;
				try {
					bp_pri = new Integer(req.getParameter("bp_pri").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("bp_pri","價格請填數字");
				}
				
				String bp_del = req.getParameter("bp_del");
				if (bp_del == null || bp_del.trim().length() == 0) {
					errorMsgs.put("bp_del","交易方式不能空");
				}
			
				String bp_text = req.getParameter("bp_text");
				if (bp_text == null || bp_text.trim().length() == 0) {
					errorMsgs.put("bp_text","內文不能空");
				}
				
				java.sql.Date bp_dot = null;
				try {
					bp_dot = java.sql.Date.valueOf(req.getParameter("hiredate"));
				} catch (IllegalArgumentException e) {
					bp_dot = new java.sql.Date(System.currentTimeMillis());
				}
				
				
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.put("mem_no","請登入!");
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
					req.setAttribute("bpVO", bpVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/TRY2.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				/***************************2.開始新增資料***************************************/
				BpService bpSvc = new BpService();
				bpSvc.addbp(bp_head, bpcl_no, bp_new, bp_loc, bp_pri, bp_del, bp_text, bp_dot, mem_no, bp_pic1, bp_pic2,lat,lng);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = req.getContextPath()+"/bp-front/mybp.jsp";
				res.sendRedirect(url);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("exception",e.getMessage()+"被我抓到了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY2.jsp");
				failureView.forward(req, res);
			}

			
		}
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String bp_no = req.getParameter("bp_no");
				/***************************2.開始查詢資料****************************************/
				BpService bpSvc = new BpService();

				BpVO bpVO = bpSvc.getOnebp(bp_no);	

				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("bpVO", bpVO);         // 資料庫取出的empVO物件,存入req
				String url = "/bp-front/TRY3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/mybp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String bp_no = req.getParameter("bp_no");

				String bp_head = req.getParameter("bp_head");
				if (bp_head == null || bp_head.trim().length() == 0) {
					errorMsgs.add("標題不能空");
				}
				
				String bpcl_no = req.getParameter("bpcl_no").trim();
				if (bpcl_no == null || bpcl_no.trim().length() == 0) {
					errorMsgs.add("類別不能空");
				}
				
				String bp_new = req.getParameter("bp_new");
	
				String bp_loc = req.getParameter("bp_loc");
				if (bp_loc == null || bp_loc.trim().length() == 0) {
					errorMsgs.add("商品位置不能空");
				}
				Integer bp_pri = null;
				try {
					bp_pri = new Integer(req.getParameter("bp_pri").trim());
				} catch (NumberFormatException e) {
					bp_pri = 0;
					errorMsgs.add("價格不能空");
				}
				
				String bp_del = req.getParameter("bp_del");
				if (bp_del == null || bp_del.trim().length() == 0) {
					errorMsgs.add("貨運方法不能空");
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
				System.out.println("錯誤處理座標補正");
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
					req.setAttribute("bpVO", bpVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/TRY3.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				bpSvc = new BpService();
				bpVO= bpSvc.updatebp(bp_no , bp_head, bpcl_no, bp_new, bp_loc, bp_pri, bp_del, bp_text, bp_dot, mem_no, bp_pic1, bp_pic2,lat,lng);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("bpVO", bpVO); // 資料庫update成功後,正確的的empVO物件,存入req
				
				String url = "/bp-front/mybp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				System.out.println(384);
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY3.jsp");
				failureView.forward(req, res);
			}
		}
		

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
				
				/***************************2.開始刪除資料***************************************/
				BpService bpSvc = new BpService();
				bpSvc.delete(bp_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/bp-front/listbackbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listbackbp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("upload".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
				/***************************2.開始刪除資料***************************************/
				BpService bpSvc = new BpService();
				bpSvc.upload(bp_no);
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/bp-front/listbackbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listbackbp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("question".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
			
				 String mem_no = null ;
				 mem_no = req.getParameter("mem_no");
				
				 String qmem_no = req.getParameter("qmem_no");
				 System.out.println(qmem_no.length());
				 if(qmem_no == null || qmem_no.length() == 0) {
					 errorMsgs.add("請登入再進行留言");
				 }

			
				 
				 String qbpme_text = req.getParameter("qbpme_text");
				 if(qbpme_text == null || qbpme_text =="" ){
					 errorMsgs.add("請輸入留言內容");
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
			
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY1.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("reply".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			String bp_no = null ;
			 bp_no = req.getParameter("bp_no");
			try {
				/***************************1.接收請求參數***************************************/
			
				 bp_no = req.getParameter("bp_no");
			
				 String bpme_no = null ;
				 bpme_no = req.getParameter("bpme_no");
				 
				 String bpme_text = null ;
				 bpme_text = req.getParameter("bpme_text");
				
				 
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/TRY1.jsp?"+bp_no);
					failureView.forward(req, res);
					return;//程式中斷
				}
				 
				/***************************2.開始新增問題資料***************************************/
		
				BpmeService bpmeSvc = new BpmeService();
				bpmeSvc.updatebpme(bpme_text,bpme_no);
				/***************************3.完成,準備轉交(Send the Success view)***********/	
				BpService bpSvc = new BpService();
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				req.setAttribute("bpVO", bpVO);
			
				String url = "/bp-front/TRY1.jsp?"+bp_no;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp?"+bp_no);
				failureView.forward(req, res);
			}
		}
		
		if ("updatereport".equals(action)) { // 來自listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String bprp_no = null ;
				bprp_no = req.getParameter("bprp_no");
				System.out.println(bprp_no);
				
				String bprp_status = null ;
				bprp_status = req.getParameter("bprp_status");
				System.out.println(bprp_status);
				
				 
				/***************************2.開始新增問題資料***************************************/
		
				BprpService bprpSvc = new BprpService();
				bprpSvc.updatebprp(bprp_status,bprp_no);
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/	
//				BprpVO bprpVO = null ;
				
			
				String url = "/bpclass-back/listbackbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listbackbp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("get_head".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String head = "%"+req.getParameter("head")+"%";
				if (head == null || (head.trim()).length() == 0) {
					errorMsgs.add("?");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}

				
				/***************************2.開始查詢資料*****************************************/
				BpService bpSvc = new BpService();
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req	
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("bpVO", head); // 資料庫取出的empVO物件,存入req
				
				String url = "/bp-front/listallbp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Subscript".equals(action)) { //下標
			List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				HttpSession session=req.getSession();
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || (mem_no.trim()).length() == 0) {
					errorMsgs.add("請登入?");
				}

				String bp_no = req.getParameter("bp_no");

				BpService bpSvc = new BpService();
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				if (bpVO == null) {
					errorMsgs.add("沒資料");
				}
/***************************2.沒登入走這裡*****************************************/
				if (!errorMsgs.isEmpty()) {
					session.setAttribute("bpVO", bpVO);
					RequestDispatcher failureView = req		
							.getRequestDispatcher("/bp-front/corfirmpay.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
/***************************2.正常登入走這裡*****************************************/
				bpSvc = new BpService();
				bpVO = bpSvc.getOnebp(bp_no);
				if (bpVO == null) {
					errorMsgs.add("沒資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/bp-front/listallbp.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("bpVO", bpVO); // 資料庫取出的empVO物件,存入req
				String url = "/bp-front/corfirmpay.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/listallbp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update_status".equals(action)) { // 來自listAllEmp.jsp
			System.out.println("1231");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			
			
			try {
				/***************************1.接收請求參數***************************************/
				 String bp_no = null ;
				 bp_no = req.getParameter("bp_no");
			
				 String bpst_no = null ;
				 bpst_no = req.getParameter("bpst_no");
				 
				 
				/***************************2.開始新增問題資料***************************************/
		
				BpService bpSvc = new BpService();
				bpSvc.update_status(bpst_no,bp_no);
				
				/***************************3.完成,準備轉交(Send the Success view)***********/	

				
				BpVO bpVO = bpSvc.getOnebp(bp_no);
				req.setAttribute("bpVO", bpVO);
			
				String url = "/bp-front/mybp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/mybp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insertreport".equals(action)) { // 來自listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				
				String bp_no = null ;
				bp_no = req.getParameter("bp_no");
				
				String mem_no = null ;
				mem_no = req.getParameter("mem_no");

				String bprp_project = null;
				bprp_project = req.getParameter("bprp_project");
				
				String bprp_text = null ;
				bprp_text = req.getParameter("bprp_text");
				 if(bprp_text == null || bprp_text ==""){
					 errorMsgs.add("請輸入檢舉內容");
				 }
				 
				res.setContentType("text/html;charset=UTF-8");
					
				PrintWriter out = res.getWriter();
				
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				/** *************************2.問題資料存入***************************************/
		
				BprpService bprpSvc = new BprpService();
				bprpSvc.addbprp(bp_no,mem_no, bprp_project, bprp_text);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bpclass-back/listallreport.jsp");
				failureView.forward(req, res);
			}
		
		}
	
		if ("addtr".equals(action)) { // 來自listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/

				
				String mem_no = null ;
				mem_no = req.getParameter("mem_no");
				 if(mem_no == null || mem_no ==""){
					 errorMsgs.add("請輸登入再進行追蹤");
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
				/** *************************2.問題資料存入***************************************/
		
				BptrService bptrSvc = new BptrService();
				bptrSvc.addbptr(mem_no,bp_no);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY1.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		if ("deletebptr".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
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
				/** *************************2.問題資料存入***************************************/
		
				BptrService bptrSvc = new BptrService();
				bptrSvc.delete(mem_no,bp_no);
				RequestDispatcher failureView =req.getRequestDispatcher("/bp-front/track.jsp");
				failureView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/bp-front/TRY1.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
		
	}
}
