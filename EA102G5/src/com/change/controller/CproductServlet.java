package com.change.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.util.Set;
import java.util.HashSet;
import com.cproduct.model.CproductDAO;
import com.cproduct.model.CproductService;
import com.cproduct.model.CproductVO;
import com.mem.model.MemVO;

import com.CPRECORD.model.CprecordService;
import com.CPRECORD.model.CprecordVO;
import com.CPREPORT.model.CpreportService;
import com.cptrack.model.*;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import websocket.model.*;


@ServerEndpoint("/Change/{mem_No}")

@MultipartConfig 
public class CproductServlet extends HttpServlet {
	
	private static final Set<Session> connectedSessions = Collections.synchronizedSet(new HashSet<>()); 
	
	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		connectedSessions.add(userSession);
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		System.out.println(text);
	}

	

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
		String text = String.format("session ID = %s, disconnected; close code = %d; reason phrase = %s",
				userSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
		System.out.println(text);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}
	
	
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
        
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.print(action);
		
		if ("addtr".equals(action)) { // 來自listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/

				
				String mem_no = null ;
				mem_no = req.getParameter("mem_No");
				 if(mem_no == null || mem_no ==""){
					 errorMsgs.add("請輸登入再進行追蹤");
				 }
				
				
				String bp_no = null ;
				bp_no = req.getParameter("cp_No");
				res.setContentType("text/html;charset=UTF-8");
				PrintWriter out = res.getWriter();
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				/** *************************2.問題資料存入***************************************/
		        
				CptrackService bptrSvc = new CptrackService();
				CptrackVO CptrackVO=bptrSvc.getone(bp_no,mem_no);
				if(CptrackVO!=null) {
					bptrSvc.deleteCproduct(bp_no, mem_no);
					System.out.print("刪除");
					
					
				}
				else {
				System.out.println("----------------------");
					
					
				bptrSvc.addCptrack(mem_no,bp_no);
				System.out.print("新增");
				}
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/changelist.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
		if ("deltr".equals(action)) { // 來自listAllEmp.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/

				
				String mem_no = null ;
				mem_no = req.getParameter("mem_No");
				 if(mem_no == null || mem_no ==""){
					 errorMsgs.add("請輸登入再進行追蹤");
				 }
				
				
				String cp_no = null ;
				cp_no = req.getParameter("cp_No");
				res.setContentType("text/html;charset=UTF-8");
				PrintWriter out = res.getWriter();
				if (!errorMsgs.isEmpty()) {	
					for(String s :errorMsgs)
						out.print(s);
					return;
				}
				/** *************************2.問題資料存入***************************************/
		
				CptrackService bptrSvc = new CptrackService();
				bptrSvc.deleteCproduct(cp_no,mem_no);;
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("失敗:"+e.getMessage()+"來這裡了");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/changelist.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
		
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  	
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Date date=new Date();
				Timestamp Timestamp=null;
				Timestamp=new Timestamp(date.getTime());
				
				
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String cp_No = req.getParameter("cp_No");
			
				
				
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cp_No == null || cp_No.trim().length() == 0) {
					errorMsgs.put("ename","商品編號: 請勿空白");
				}
				else if(!cp_No.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.put("cp_No","商品編號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				String cpname = req.getParameter("cpname").trim();
				if (cpname == null || cpname.trim().length() == 0) {
					errorMsgs.put("cpname","名稱請勿空白");
				}
				
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					errorMsgs.put("hiredate","請輸入日期");
//				}
				String cpState=req.getParameter("cpState").trim();
				if (cpState == null || cpState.trim().length() == 0) {
					errorMsgs.put("cpState","名稱請勿空白");
				}
				
				String mem_No=req.getParameter("mem_No").trim();
				if (mem_No == null || mem_No.trim().length() == 0) {
					errorMsgs.put("mem_No","名稱請勿空白");
				}
				
				
				String emp_NO = req.getParameter("emp_NO").trim();;
				
				String cptext = new String(req.getParameter("cptext").trim());
				if (cptext == null || cptext.trim().length() == 0) {
					errorMsgs.put("cptext","名稱請勿空白");
				}
				String cpClass = new String(req.getParameter("cpClass").trim());
				if (cpClass == null || cpClass.trim().length() == 0) {
					errorMsgs.put("cpClass","名稱請勿空白");
				}
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/addCproduct.jsp");
					failureView.forward(req, res);
					return;
				}
				Part part=req.getPart("pic1");
				
				InputStream in1=part.getInputStream();
				InputStream in2=part.getInputStream();
				InputStream in3=part.getInputStream();
				byte[] buf=new byte[in1.available()];
				
				in1.read(buf);
				
				byte[] pic=buf;
				
				Part part2=req.getPart("pic2");
				
				in2=part2.getInputStream();
				
				byte[] buf2=new byte[in2.available()];
				
				in2.read(buf2);
				
				byte[] pic2=buf2;
				
				Part part3=req.getPart("pic3");
				
				in3=part3.getInputStream();
				
				byte[] buf3=new byte[in3.available()];
				
				in3.read(buf3);
				
				byte[] pic3=buf3;
				String cpmeetup = new String(req.getParameter("cpmeetup").trim());
				
				
				
				
				/***************************2.開始新增資料***************************************/
				CproductService empSvc = new CproductService();
				empSvc.addCproduct(cp_No,cpClass,cpState,mem_No,emp_NO,cpname,cptext,Timestamp,Timestamp,pic,pic2,pic3,cpmeetup);
				in3.close();
				in2.close();
				in1.close();
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/readrequest.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
        
        
        
        
        
        
        if ("chosechange".equals(action)) { // 來自addEmp.jsp的請求  	
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Date date=new Date();
				Timestamp Timestamp=null;
				Timestamp=new Timestamp(date.getTime());
				
				
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String cp_No=req.getParameter("cp_No");
				HttpSession session=req.getSession();
				MemVO memVO=(MemVO)session.getAttribute("memVO");
				String mem_No=memVO.getMem_no();
				if (mem_No == null || mem_No.trim().length() == 0) {
					errorMsgs.put("mem_No","請先登入");
				}
				System.out.print("2");
				
				CproductVO emp = (CproductVO) session.getAttribute("CproductVO");
				System.out.println("-----------------------------");
				System.out.println(emp);
				System.out.println("-----------------------------");
				String emp_NO=emp.getCp_No();
				String mem_No2=emp.getMem_No();
				if (emp_NO == null || emp_NO.length() == 0) {
					errorMsgs.put("emp_NO","逾時請重新遞交申請");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/addCproduct.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				
				
				/***************************2.開始新增資料***************************************/
				CproductService empSvc = new CproductService();
				empSvc.changestate("交換申請中",cp_No);
				
				CprecordService cprecord = new CprecordService();
				cprecord.addCprecord(cp_No,emp_NO,mem_No,mem_No2,Timestamp,"交換申請中");
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				for (Session sessionsocket : connectedSessions) {
					   if (sessionsocket.isOpen())
						sessionsocket.getAsyncRemote().sendText(mem_No2);
					   System.out.print("有射出");
					}
				String url = "/front_end/readrequest.jsp";
				res.sendRedirect(req.getContextPath()+url);			
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
        
        
        
        
        
          if ("search".equals(action)) { // 來自addEmp.jsp的請求  	
			
			try {
				
				
				
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String searchword=req.getParameter("searchword");
				HttpSession session=req.getSession();
				session.setAttribute("searchword",searchword);
				
				// Send the use back to the form, if there were errors
				
				
				
				
			
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/changelist.jsp";
				System.out.print("出錯");
				res.sendRedirect(req.getContextPath()+url);			
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.print(e);
			}
		}
        
          if ("reversesearch".equals(action)) { // 來自addEmp.jsp的請求  	
  			
  			try {
  				
  				
  				
  				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
  				String reversesearchword=req.getParameter("reversesearchword");
  				HttpSession session=req.getSession();
  				session.setAttribute("reversesearchword",reversesearchword);
  				
  				// Send the use back to the form, if there were errors
  				
  				
  				
  				
  			
  				/***************************3.新增完成,準備轉交(Send the Success view)***********/
  				String url = "/front_end/changelist.jsp";
  				System.out.print("出錯");
  				res.sendRedirect(req.getContextPath()+url);			
  				
  				/***************************其他可能的錯誤處理**********************************/
  			} catch (Exception e) {
  				System.out.print(e);
  			}
  		}
          
          if ("cpmeetup".equals(action)) { // 來自addEmp.jsp的請求  	
      		
      		try {
      			
      			
      			
      			/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
      			String cpmeetup=req.getParameter("cpmeetup");
      			HttpSession session=req.getSession();
      			session.setAttribute("cpmeetup",cpmeetup);
      			
      			// Send the use back to the form, if there were errors
      			
      			
      			
      			
      		
      			/***************************3.新增完成,準備轉交(Send the Success view)***********/
      			String url = "/front_end/changelist.jsp";
  				System.out.print("出錯");
  				res.sendRedirect(req.getContextPath()+url);			
      			
      			/***************************其他可能的錯誤處理**********************************/
      		} catch (Exception e) {
      			System.out.print(e);
      		}
      	}
          
       if ("searchclass".equals(action)) { // 來自addEmp.jsp的請求  	
		
		try {
			
			
			
			/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
			String cpclass=req.getParameter("cpclass");
			HttpSession session=req.getSession();
			session.setAttribute("cpclass",cpclass);
			
			// Send the use back to the form, if there were errors
			
			
			
			
		
			/***************************3.新增完成,準備轉交(Send the Success view)***********/
				
			
			/***************************其他可能的錯誤處理**********************************/
		} catch (Exception e) {
			System.out.print(e);
		}
	}
 if ("return".equals(action)) { // 來自addEmp.jsp的請求  	
		
		try {
			
			
			
			/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
			String cpclass=req.getParameter("cpclass");
			HttpSession session=req.getSession();
			session.setAttribute("cpclass",null);
			session.setAttribute("searchword",null);
			session.setAttribute("reversesearchword",null);
			session.setAttribute("cpmeetup",null);
			// Send the use back to the form, if there were errors
			
			
			
			
		
			/***************************3.新增完成,準備轉交(Send the Success view)***********/
				
			
			/***************************其他可能的錯誤處理**********************************/
		} catch (Exception e) {
			System.out.print(e);
		}
	}
        
        if ("change".equals(action)) { // 來自addEmp.jsp的請求  	
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Date date=new Date();
				Timestamp Timestamp=null;
				Timestamp=new Timestamp(date.getTime());
				
				
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String cp_No="";
				System.out.print("1");
				String cpname = req.getParameter("cpname").trim();
				if (cpname == null || cpname.trim().length() == 0) {
					errorMsgs.put("cpname","名稱請勿空白");
				}
				
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					errorMsgs.put("hiredate","請輸入日期");
//				}
				String cpState="交換申請中";
				HttpSession session=req.getSession();
				MemVO memVO=(MemVO)session.getAttribute("memVO");
				String mem_No=memVO.getMem_no();
				if (mem_No == null || mem_No.trim().length() == 0) {
					errorMsgs.put("mem_No","請先登入");
				}
				System.out.print("2");
				
				CproductVO emp = (CproductVO) session.getAttribute("CproductVO");
				System.out.println("-----------------------------");
				System.out.println(emp);
				System.out.println("-----------------------------");
				String emp_NO=emp.getCp_No();
				String mem_No2=emp.getMem_No();
				if (emp_NO == null || emp_NO.length() == 0) {
					errorMsgs.put("emp_NO","逾時請重新遞交申請");
				}
				String cptext = new String(req.getParameter("cptext").trim());
				if (cptext == null || cptext.trim().length() == 0) {
					errorMsgs.put("cptext","名稱請勿空白");
				}
				
				String cpClass = new String(req.getParameter("cpClass").trim());
				if (cpClass == null || cpClass.trim().length() == 0) {
					errorMsgs.put("cpClass","名稱請勿空白");
				}
				
				System.out.print("55");
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/addCproduct.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.print("66");
				System.out.print("3");
				Part part=req.getPart("pic1");
				
				InputStream in1=part.getInputStream();
				InputStream in2=part.getInputStream();
				InputStream in3=part.getInputStream();
				byte[] buf=new byte[in1.available()];
				
				in1.read(buf);
				
				byte[] pic=buf;
				
				Part part2=req.getPart("pic2");
				
				in2=part2.getInputStream();
				
				byte[] buf2=new byte[in2.available()];
				
				in2.read(buf2);
				
				byte[] pic2=buf2;
				
				Part part3=req.getPart("pic3");
				
				in3=part3.getInputStream();
				
				byte[] buf3=new byte[in3.available()];
				
				in3.read(buf3);
				
				byte[] pic3=buf3;
				
				String cpmeetup =req.getParameter("county").trim()+req.getParameter("district");
				
				if (cpmeetup == null || cpClass.trim().length() == 0) {
					cpmeetup="不面交";
				}
				
				
				System.out.print(cpmeetup);
				/***************************2.開始新增資料***************************************/
				CproductService empSvc = new CproductService();
				CproductVO CproductVO=empSvc.addCproduct(cp_No,cpClass,cpState,mem_No,emp_NO,cpname,cptext,Timestamp,Timestamp,pic,pic2,pic3,cpmeetup);
				in3.close();
				in2.close();
				in1.close();
				System.out.print("5");
				
				CprecordService cprecord = new CprecordService();
				cprecord.addCprecord(CproductVO.getCp_No(),emp_NO,mem_No,mem_No2,Timestamp,"交換申請中");
				
				System.out.print("5");
				System.out.print("沒射出");
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				for (Session sessionsocket : connectedSessions) {
					   if (sessionsocket.isOpen())
						sessionsocket.getAsyncRemote().sendText(mem_No2);
					   System.out.print("有射出");
					}
				String url = "/front_end/readrequest.jsp";
				res.sendRedirect(req.getContextPath()+url); // 新增成功後轉交listAllEmp.jsp
							
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/addcproduct.jsp");
				failureView.forward(req, res);
			}
		}
        if ("addcproduct".equals(action)) { // 來自addEmp.jsp的請求  	
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Date date=new Date();
				Timestamp Timestamp=null;
				Timestamp=new Timestamp(date.getTime());
				
				
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String cp_No="";
				System.out.print("1");
				String cpname = req.getParameter("cpname").trim();
				if (cpname == null || cpname.trim().length() == 0) {
					errorMsgs.put("cpname","名稱請勿空白");
				}
				
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					errorMsgs.put("hiredate","請輸入日期");
//				}
				String cpState="已上架";
				HttpSession session=req.getSession();
				MemVO memVO=(MemVO)session.getAttribute("memVO");
				String mem_No=memVO.getMem_no();
				if (mem_No == null || mem_No.trim().length() == 0) {
					errorMsgs.put("mem_No","請先登入");
				}
				System.out.print("2");
				
				
				String emp_NO=req.getParameter("emp_NO");
				
				if (emp_NO == null || emp_NO.length() == 0) {
					
				}
				String cptext = new String(req.getParameter("cptext").trim());
				if (cptext == null || cptext.trim().length() == 0) {
					errorMsgs.put("cptext","名稱請勿空白");
				}
				
				String cpClass = new String(req.getParameter("cpClass").trim());
				if (cpClass == null || cpClass.trim().length() == 0) {
					errorMsgs.put("cpClass","名稱請勿空白");
				}
				
				System.out.print("55");
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/addCproduct.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.print("66");
				System.out.print("3");
				Part part=req.getPart("pic1");
				
				InputStream in1=part.getInputStream();
				InputStream in2=part.getInputStream();
				InputStream in3=part.getInputStream();
				byte[] buf=new byte[in1.available()];
				
				in1.read(buf);
				
				byte[] pic=buf;
				
				Part part2=req.getPart("pic2");
				
				in2=part2.getInputStream();
				
				byte[] buf2=new byte[in2.available()];
				
				in2.read(buf2);
				
				byte[] pic2=buf2;
				
				Part part3=req.getPart("pic3");
				
				in3=part3.getInputStream();
				
				byte[] buf3=new byte[in3.available()];
				
				in3.read(buf3);
				
				byte[] pic3=buf3;
				
				String cpmeetup =req.getParameter("county").trim()+req.getParameter("district");
				
				if (cpmeetup == null || cpClass.trim().length() == 0) {
					cpmeetup="不面交";
				}
				
				
				System.out.print(cpmeetup);
				/***************************2.開始新增資料***************************************/
				CproductService empSvc = new CproductService();
				CproductVO CproductVO=empSvc.addCproduct(cp_No,cpClass,cpState,mem_No,emp_NO,cpname,cptext,Timestamp,Timestamp,pic,pic2,pic3,cpmeetup);
				in3.close();
				in2.close();
				in1.close();
				System.out.print("5");
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/readchange.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
        if ("addreport".equals(action)) { // 來自update_emp_input.jsp的請求
			
			
        	System.out.println("成功");
			
    		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
                 
                 String cpstate = req.getParameter("cpstate");
                 String cpr_No = req.getParameter("cpr_No");
                 String cprstate = req.getParameter("cprstate");
                 String mem_No=null;
                 HttpSession session=req.getSession();
 				MemVO memVO=(MemVO)session.getAttribute("memVO");
 				CproductVO CproductVO=(CproductVO)session.getAttribute("CproductVO");
 				String cp_No = CproductVO.getCp_No();
 				if(CproductVO!=null) {
 				mem_No=memVO.getMem_no();
 				System.out.println("成功"+mem_No+cp_No);
 				}
 				else {
 					mem_No="M0010";
 					System.out.println("成功"+mem_No);
 				}
 				Date date=new Date();
				Timestamp Timestamp=null;
				Timestamp=new Timestamp(date.getTime());
				
				CpreportService CprecordSvc=new CpreportService();
				CprecordSvc.addCpreport("2",cp_No,"待處理",mem_No,null,Timestamp);
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/readrequest.jsp";
				
				res.sendRedirect(req.getContextPath()+url);			
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatemain".equals(action)) { // 來自update_emp_input.jsp的請求
			Date date=new Date();
			Timestamp Timestamp=null;
			Timestamp=new Timestamp(date.getTime());
			
			 SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH24:mm:ss");
			 String now=myFmt2.format(date);
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				CproductVO CproductVO= new CproductVO(); 
                String cp_No = req.getParameter("cp_No");
			     
                System.out.print(cp_No);
				
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cp_No == null || cp_No.trim().length() == 0) {
					errorMsgs.put("ename","商品編號: 請勿空白");
				}
				else if(!cp_No.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.put("cp_No","商品編號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				String cpname = req.getParameter("cpname").trim();
				if (cpname == null || cpname.trim().length() == 0) {
					errorMsgs.put("cpname","名稱請勿空白");
				}
				System.out.print(cpname);
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					errorMsgs.put("hiredate","請輸入日期");
//				}
				
				
				
				
				
				String emp_NO = req.getParameter("emp_NO").trim();;
				
				String cptext = new String(req.getParameter("cptext").trim());
				if (cptext == null || cptext.trim().length() == 0) {
					errorMsgs.put("cptext","名稱請勿空白");
				}
				String cpClass = new String(req.getParameter("cpClass").trim());
				if (cpClass == null || cpClass.trim().length() == 0) {
					errorMsgs.put("cpClass","名稱請勿空白");
				}
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/addCproduct.jsp");
					
					failureView.forward(req, res);
					return;
				}
//				Part part=req.getPart("pic1");
//				
//				InputStream in1=part.getInputStream();
//				InputStream in2=part.getInputStream();
//				InputStream in3=part.getInputStream();
//				byte[] buf=new byte[in1.available()];
//				
//				in1.read(buf);
//				
//				byte[] pic=buf;
//				
//				Part part2=req.getPart("pic2");
//				
//				in2=part2.getInputStream();
//				
//				byte[] buf2=new byte[in2.available()];
//				
//				in2.read(buf2);
//				
//				byte[] pic2=buf2;
//				
//				Part part3=req.getPart("pic3");
//				
//				in3=part3.getInputStream();
//				
//				byte[] buf3=new byte[in3.available()];
//				
//				in3.read(buf3);
//				
//				byte[] pic3=buf3;
				
				String cpmeetup =req.getParameter("county").trim()+req.getParameter("district");

				
				if (cpmeetup == null || cpClass.trim().length() == 0) {
					cpmeetup="不面交";
				}
				// Send the use back to the form, if there were errors
				
				CproductVO.setCp_No(cp_No);
				CproductVO.setCpClass_No(cpClass);
				CproductVO.setCpname(cpname);
				CproductVO.setCpmeetup(cpmeetup);
				CproductVO.setEMP_NO(emp_NO);
				CproductVO.setCptext(cptext);
				CproductService empSvc = new CproductService();
				empSvc.updatemain(CproductVO);
//				in3.close();
//				in2.close();
//				in1.close();
				 
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				HttpSession session=req.getSession();
				
				String url = (String) session.getAttribute("location");
				System.out.println(url);
					CprecordVO CprecordVO = (CprecordVO) session.getAttribute("CprecordVO");
					CproductService CproductSvc = new CproductService();
				if(CprecordVO!=null) {
					CproductSvc.changestate("交換中",CprecordVO.getCp_No1());
					CproductSvc.changestate("交換中",CprecordVO.getCp_No2());
				}
				String mem_No = req.getParameter("mem_No");
				
				if(req.getParameter("url")!=null)
				url = req.getParameter("url").trim();
				if(!url.contentEquals("/front_end/readchange.jsp")){
					for (Session sessionsocket : connectedSessions) {
						   if (sessionsocket.isOpen())
							sessionsocket.getAsyncRemote().sendText(mem_No+"更改商品");
					}
				}
				res.sendRedirect(req.getContextPath()+url);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatepic".equals(action)) { // 來自update_emp_input.jsp的請求
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				CproductVO CproductVO= new CproductVO(); 
                String cp_No = req.getParameter("cp_No");
                CproductDAO dao = new CproductDAO(); 
                System.out.print(cp_No);
				
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (cp_No == null || cp_No.trim().length() == 0) {
//					errorMsgs.put("ename","商品編號: 請勿空白");
//				}
//				else if(!cp_No.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.put("cp_No","商品編號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//				String cpname = req.getParameter("cpname").trim();
//				if (cpname == null || cpname.trim().length() == 0) {
//					errorMsgs.put("cpname","名稱請勿空白");
//				}
//				System.out.print(cpname);
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					errorMsgs.put("hiredate","請輸入日期");
//				}
				
				
				
				
				
//				String emp_NO = req.getParameter("emp_NO").trim();;
//				if (emp_NO == null || emp_NO.trim().length() == 0) {
//					errorMsgs.put("emp_NO","名稱請勿空白");
//				}
//				String cptext = new String(req.getParameter("cptext").trim());
//				if (cptext == null || cptext.trim().length() == 0) {
//					errorMsgs.put("cptext","名稱請勿空白");
//				}
//				String cpClass = new String(req.getParameter("cpClass").trim());
//				if (cpClass == null || cpClass.trim().length() == 0) {
//					errorMsgs.put("cpClass","名稱請勿空白");
//				}
//				
//				
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front_end/addCproduct.jsp");
//					
//					failureView.forward(req, res);
//					return;
//				}
                
                byte[] pic1 = null;
                byte[] pic2 = null;
                byte[] pic3 = null;
                
                String cppic1="pic1"+cp_No;
                System.out.print(cppic1);
				Part part=req.getPart(cppic1);				
				InputStream in1=part.getInputStream();	
				 System.out.print(in1);
				 if(in1.available()!=0) {
				byte[] buf=new byte[in1.available()];				
				in1.read(buf);				
				pic1=buf;
				 }
				 else {
					 pic1=dao.getPicture(cp_No, "1");
				 }
				String cppic2="pic2"+cp_No;
	            System.out.print(cppic2);
				Part part2=req.getPart(cppic2);
				InputStream in2=part2.getInputStream();				
				if(in2.available()!=0) {
					byte[] buf=new byte[in2.available()];				
					in2.read(buf);				
					pic2=buf;
					 }
					 else {
						 pic2=dao.getPicture(cp_No, "2");
					 }
				
				String cppic3="pic3"+cp_No;
	            System.out.print(cppic3);
				Part part3=req.getPart(cppic3);
				
				InputStream in3=part3.getInputStream();
				if(in3.available()!=0) {
					byte[] buf=new byte[in3.available()];				
					in3.read(buf);				
					pic3=buf;
					 }
					 else {
						 pic3=dao.getPicture(cp_No, "3");
					 }
				
//				String cpmeetup =req.getParameter("county").trim()+req.getParameter("district");

				
//				if (cpmeetup == null || cpClass.trim().length() == 0) {
//					cpmeetup="不面交";
//				}
				// Send the use back to the form, if there were errors
				
				CproductVO.setCp_No(cp_No);
				if(pic1!=null)
				CproductVO.setCpPicture_No1(pic1);
				if(pic2!=null)
				CproductVO.setCpPicture_No2(pic2);
				if(pic3!=null)
				CproductVO.setCpPicture_No3(pic3);
				
				CproductService empSvc = new CproductService();
				empSvc.updatepic(CproductVO);
				in3.close();
				in2.close();
				in1.close();
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				HttpSession session=req.getSession();
				CprecordVO CprecordVO = (CprecordVO) session.getAttribute("CprecordVO");
				CproductService CproductSvc = new CproductService();
				if(CprecordVO!=null) {
				CproductSvc.changestate("交換中",CprecordVO.getCp_No1());
				CproductSvc.changestate("交換中",CprecordVO.getCp_No2());
				}
				String url = (String) session.getAttribute("location");
                String mem_No = req.getParameter("mem_No");
				
				if(req.getParameter("url")!=null)
				url = req.getParameter("url").trim();
				if(!url.contentEquals("/front_end/readchange.jsp")){
					for (Session sessionsocket : connectedSessions) {
						   if (sessionsocket.isOpen())
							sessionsocket.getAsyncRemote().sendText(mem_No+"更改商品");
					}
				}
				res.sendRedirect(req.getContextPath()+url);		
//				return;
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
		if ("checkchange".equals(action)) { // 來自update_emp_input.jsp的請求
			Date date=new Date();
			Timestamp Timestamp=null;
			Timestamp=new Timestamp(date.getTime());
			
			 SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH24:mm:ss");
			 String now=myFmt2.format(date);
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mem_No = req.getParameter("mem_No");
				for (Session sessionsocket : connectedSessions) {
					   if (sessionsocket.isOpen()) {
						sessionsocket.getAsyncRemote().sendText(mem_No+"確定商品");
					}
				}
				
				
				String cp_No = req.getParameter("cp_No");
                 HttpSession session=req.getSession();
                 String cpstate = req.getParameter("cpstate");
				
				
				
				
				CproductService empSvc = new CproductService();
				empSvc.changestate(cpstate,cp_No);
				
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/changeorder.jsp";
				String Cprecord_No=(String)session.getAttribute("Cprecord_No");
				res.sendRedirect(req.getContextPath()+url+"?"+Cprecord_No);
								
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception",e.getMessage());
				errorMsgs.put("cpClass","不明錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestate".equals(action)) { // 來自update_emp_input.jsp的請求
			
			
			
			
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
                 String cp_No = req.getParameter("cp_No");
                 String cpstate = req.getParameter("cpstate");
                 String cpr_No = req.getParameter("cpr_No");
                 String cprstate = req.getParameter("cprstate");
                 HttpSession session=req.getSession();
				
				
				
				
				CprecordService CprecordSvc=new CprecordService();
				CprecordSvc.changestate(cprstate, cpr_No);
				CproductService empSvc = new CproductService();
				empSvc.changestate(cpstate,cp_No);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/readrequest.jsp";
				
				res.sendRedirect(req.getContextPath()+url);			
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatecpstate".equals(action)) { // 來自update_emp_input.jsp的請求
			
			
			
			
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
                 String cp_No = req.getParameter("cp_No");
                 String cpstate = req.getParameter("cpstate");
                
                 
                 CproductService empSvc = new CproductService();
 				  empSvc.changestate(cpstate,cp_No);
				
 				
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/readchange.jsp";
				
				res.sendRedirect(req.getContextPath()+url);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("refuseother".equals(action)) { // 來自update_emp_input.jsp的請求
			
			
			
			
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
                 String cp_No = req.getParameter("cp_No");
                 String cpstate = req.getParameter("cpstate");
                 
                 
				
				
				
				
				CprecordService CprecordSvc=new CprecordService();
				
				
				CprecordSvc.updateall(cpstate,cp_No);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/readrequest.jsp";
				
				res.sendRedirect(req.getContextPath()+url);		
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
				failureView.forward(req, res);
			}
		}
		 
		
            if ("stopchange".equals(action)) { // 來自update_emp_input.jsp的請求
			
			
			
			
			
            	try {
    				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
                     String cp_No = req.getParameter("cp_No");
                     String cp_No2 = req.getParameter("cp_No2");
                     String cpr_No = req.getParameter("cpr_No");
                     String mem_No = req.getParameter("mem_No");
                     HttpSession session=req.getSession();
    				
    				
    				
    				
    				CprecordService CprecordSvc=new CprecordService();
    				CprecordSvc.changestate("交換取消", cpr_No);
    				CproductService empSvc = new CproductService();
    				empSvc.changestate("已上架",cp_No);
    				empSvc.changestate("已上架",cp_No2);
    				
    				/***************************3.新增完成,準備轉交(Send the Success view)***********/
    				String url = "/front_end/changeorder.jsp";

    					for (Session sessionsocket : connectedSessions) {
    						   if (sessionsocket.isOpen())
    							sessionsocket.getAsyncRemote().sendText(mem_No+"交換取消");
    						}
    					
    				String Cprecord_No=(String)session.getAttribute("Cprecord_No");
    				res.sendRedirect(req.getContextPath()+url+"?"+Cprecord_No);		
    				
    				/***************************其他可能的錯誤處理**********************************/
    			} catch (Exception e) {
    				
    				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
    				failureView.forward(req, res);
    			}
    		}

		 if ("getone".equals(action)) { // 來自addEmp.jsp的請求  
	        	
				Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
				req.setAttribute("errorMsgs", errorMsgs);

               String cp_No = req.getParameter("cp_No");
		       String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cp_No == null || cp_No.trim().length() == 0) {
					errorMsgs.put("ename:","商品編號: 請勿空白");
				}
				else if(!cp_No.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.put("cp_No商品編號:"," 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				CproductService empSvc = new CproductService();
				CproductVO CproductVO= empSvc.getOneCproduct(cp_No);
				if(CproductVO!=null) {
				req.setAttribute("CproductVO", CproductVO);
				
				}	else
					errorMsgs.put("enames:","查無商品");
				String url = "/front_end/getone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
		 }	
		 if ("toupdate".equals(action)) { // 來自listAllEmp.jsp的請求

				List<String> errorMessages = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMessages", errorMessages);
				
				try {
					/***************************1.接收請求參數****************************************/
					String cp_No = req.getParameter("cp_No").trim();
					
					
					/***************************2.開始查詢資料****************************************/
					CproductService CproductSvc = new CproductService();
					
					CproductVO Cproduct = CproductSvc.getOneCproduct(cp_No);
					
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("Cproduct", Cproduct);         // 資料庫取出的empVO物件,存入req
					
					String url = "/front_end/Update.jsp";
					
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					 
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMessages.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/exception.jsp");
					failureView.forward(req, res);
				}
			}
		 if ("CSS".equals(action)) { // 來自listAllEmp.jsp

			 Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
				req.setAttribute("errorMsgs", errorMsgs);

            String cp_No = req.getParameter("cp_No");
		       String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cp_No == null || cp_No.trim().length() == 0) {
					errorMsgs.put("ename:","商品編號: 請勿空白");
				}
				else if(!cp_No.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.put("cp_No商品編號:"," 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				CproductService empSvc = new CproductService();
				CproductVO CproductVO= empSvc.getOneCproduct(cp_No);
				if(CproductVO!=null) {
			    HttpSession session=req.getSession();
				session.setAttribute("CproductVO", CproductVO);
				
				
				}	else
					errorMsgs.put("enames:","查無商品");
				String url = "/front_end/getoneCSS.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
					
				
			}
		 if ("delete".equals(action)) { // 來自listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String cp_No =req.getParameter("cp_No");
					
					/***************************2.開始刪除資料***************************************/
					CproductService Cproduct = new CproductService();
					Cproduct.deleteCproduct(cp_No);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/front_end/listAllCproduct.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher( "/front_end/exception.jsp");
					failureView.forward(req, res);
				}
			}
	
	 if ("newupdate".equals(action)) { // 來自listAllEmp.jsp

			
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
		 HttpSession session=req.getSession();
		 session.setAttribute("location", req.getServletPath());
				String url = "/front_end/readchange.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			
		}
}
	
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}

}
