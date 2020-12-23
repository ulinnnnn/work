package com.emp.ctrl;

import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.auth.model.AuthService;
import com.emp.model.EmpService;
import com.emp.model.EmpVO;

import oracle.net.aso.e;

//@WebServlet("/emp/emp.do")
@MultipartConfig
public class EmpServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("add".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String empName = req.getParameter("empName");

				if (empName == null || empName.trim().length() == 0) {
					errMessages.add("員工姓名不得空白");
				} else if (!empName.trim().matches("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$")) {
					errMessages.add("請輸入正確姓名格式");
				}

				String empPsd = getRandomString(6); // 密碼用亂數產生，之後再用email寄送

				String empPhone = req.getParameter("empPhone").trim();
				if (empPhone == null || empPhone.trim().length() == 0) {
					errMessages.add("請輸入電話");
				}

				String empEmail = req.getParameter("empEmail").trim();
				if (empEmail == null || empEmail.trim().length() == 0) {
					errMessages.add("請輸入信箱");
				}

				Part part = req.getPart("empPic");
				InputStream is = part.getInputStream();

				byte[] buffer = new byte[is.available()];
				is.read(buffer);
				byte[] empPicByte = buffer;
				is.close();
//				ByteArrayOutputStream baos = new ByteArrayOutputStream();
//
//				byte[] buffer = new byte[is.available()];
//				int i;
//				while ((i = is.read(buffer)) != -1) {
//					baos.write(buffer, 0, i);
//				}
//				byte[] empPicByte = baos.toByteArray();// 再接後面的empVO.setEmpPicByte(empPicByte);	

				EmpVO empVO = new EmpVO();
				empVO.setEmpName(empName);
				empVO.setEmpPsd(empPsd);
				empVO.setEmpPhone(empPhone);
				empVO.setEmpEmail(empEmail);

				empVO.setEmpPicByte(empPicByte);

				// 寄送密碼eamil
				String to = empEmail;
				String mailPsd = "b122944183";
				String subject = "Toy All Hot 後台系統密碼通知";
				String messageText = "密碼為:" + empPsd;
				sendMail(to, subject, messageText);

				if (!errMessages.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/addEmp.jsp");
					rd.forward(req, res);
					return;
				}

				EmpService empSvc = new EmpService();
				empVO = empSvc.addEmp(empName, empPsd, empPhone, empEmail, empPicByte);

				req.setAttribute("empVO", empVO);
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllEmp.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add(e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/addEmp.jsp");
				rd.forward(req, res);
			}

		}

		// 取得單筆欲修改之資料
		if ("getOneUpdate".equals(action)) {
			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String empNo = req.getParameter("empNo");

				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(empNo);

				req.setAttribute("empVO", empVO);

				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateEmp.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllEmp.jsp");
				failureView.forward(req, res);
			}
		}

		// 傳送確認修改資料
		if ("update".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String empNo = req.getParameter("empNo");

				String empName = req.getParameter("empName");
				if (empName == null || empName.trim().length() == 0) {
					errMessages.add("員工姓名不得空白");
				} else if (!empName.trim().matches("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$")) {
					errMessages.add("請輸入正確姓名格式");
				}

				String empPsd = req.getParameter("empPsd").trim();
//				if (empPsd == null || empPsd.trim().length() == 0) {
//					errMessages.add("請輸入密碼");
//				}

				String empPhone = req.getParameter("empPhone");
				if (empPhone == null || empPhone.trim().length() == 0) {
					errMessages.add("請輸入電話");
				}

				String empEmail = req.getParameter("empEmail");
				if (empEmail == null || empEmail.trim().length() == 0) {
					errMessages.add("請輸入信箱");
				}

				EmpService empService = new EmpService();
				byte[] empPicByte = null;

				Part part = req.getPart("empPic");
				InputStream is = part.getInputStream();

//				if (is.available() == 0) { //修改時，可以維持看到原圖
				byte[] buffer = new byte[is.available()];
				is.read(buffer);
				empPicByte = buffer;
				is.close();
//             	} else {
//					empPicByte = empService.getOneEmp(empNo).getEmpPicByte();
//				}

//						----------------------------------------------------

				EmpVO empVO = new EmpVO();
				empVO.setEmpNo(empNo);
				empVO.setEmpName(empName);
				empVO.setEmpPsd(empPsd);
				empVO.setEmpPhone(empPhone);
				empVO.setEmpEmail(empEmail);
				empVO.setEmpPicByte(empPicByte);

				if (!errMessages.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateEmp.jsp");
					rd.forward(req, res);
					return;
				}

				EmpService empSvc = new EmpService();
				empVO = empSvc.updateEmp(empNo, empName, empPsd, empPhone, empEmail, empPicByte);

				// 成功更新
				req.setAttribute("empVO", empVO);
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllEmp.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("那個...資料修改失敗:" + e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateEmp.jsp");
				rd.forward(req, res);
			}

		}

		// 查詢單筆
		if ("getOne".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String empNo = req.getParameter("empNo");
				if (empNo == null || (empNo.trim().length() == 0)) {
					errMessages.add("請輸入員工編號");
				}
				if (!errMessages.isEmpty()) {
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/emp_test.jsp");
					rd.forward(req, res);
					return;
				}

				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(empNo);

				if (empVO == null) {
					errMessages.add("查無資料");
				}
				if (!errMessages.isEmpty()) {
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/emp_test.jsp");
					rd.forward(req, res);
					return;
				}

				req.setAttribute("empVO", empVO);

				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOne.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/emp_test.jsp");
				rd.forward(req, res);
			}
		}

		// 刪除
		if ("delete1".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String empNo = req.getParameter("empNo");
				AuthService authSvc = new AuthService();
				authSvc.deleteEmp(empNo);
				
//				EmpService empSvc = new EmpService();
//				empSvc.deleteEmp(empNo);

				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllEmp.jsp");
				rd.forward(req, res);
			} catch (Exception e) {
				errMessages.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllEmp.jsp");
				failureView.forward(req, res);
			}

		}

//		if("login".equals(action)) {
//			List<String> errMessages = new LinkedList<String>();
//			req.setAttribute("errMessages", errMessages);
//												
//				String empNo = req.getParameter("empNo").trim();				
//				String empPsd = req.getParameter("empPsd").trim();				
////System.out.println("empNo="+empNo);				
////System.out.println("empPsd="+empPsd);				
//				EmpService empSvc = new EmpService();
//				List<EmpVO >empList = empSvc.getAll();
//				
//				List<String> empNoList = new ArrayList<>();
//			
//				empNoList = empList.stream()
//							.map(e -> e.getEmpNo())
//							.collect(Collectors.toList());				
//				
//				EmpVO empVO = empSvc.getOneEmp(empNo);
//				
//				req.setAttribute("empVO", empVO);
//				
//				HttpSession session = req.getSession();		
//				session.setAttribute("empVO", empVO);
//				
//				if(empNoList.contains(empNo)) {
//					
//					if(empPsd.equals(empVO.getEmpPsd())) {
//						res.sendRedirect("/backEndHome/backEndHome.jsp");
////						RequestDispatcher rd = req.getRequestDispatcher("/emp/showAllEmp.jsp");
////						rd.forward(req, res);
//					}else {
//						errMessages.add("哼!!你的密碼錯了，不給你進入!!");
//						RequestDispatcher rd = req.getRequestDispatcher("/empLogin/empLogin.jsp");
//						rd.forward(req, res);
//					}			
//					
//				}else {
//					errMessages.add("吼~找不到這員工啦!!");
//					RequestDispatcher rd = req.getRequestDispatcher("/empLogin/empLogin.jsp");
//					rd.forward(req, res);
//				}
//							
//		}

//		if("inputEmail".equals(action)) {
//			List<String> errMessages = new LinkedList<String>();
//			req.setAttribute("errMessages", errMessages);
//			
//				String empNo = req.getParameter("empNo").trim();									
//				String inputEmail = req.getParameter("inputEmail").trim();				
//	
//				String empPsd = getRandomString(6);
//				
////				EmpVO empVO = new EmpVO();				
////				empVO.setEmpPsd(empPsd);
//												
//				EmpService empSvc = new EmpService();
//				empSvc.updateEmpPsd(empNo,empPsd);
//				
//				String to = inputEmail;
//				String mailPsd = "b122944183";
//				String subject = "密碼通知";
//				String messageText = "密碼為:"+empPsd;
//				sendMail(to, mailPsd, subject, messageText);
//											
//		}

		// 回首頁鍵
//		if ("homepage".equals(action)) {
//			RequestDispatcher homepage = req.getRequestDispatcher("/emp/emp_test.jsp");
//			homepage.forward(req, res);
//		}

	}

	public String getRandomString(int len) {
		final String s = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		SecureRandom sRandom = new SecureRandom();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < len; i++) {
			int position = sRandom.nextInt(s.length()); // Random class的nextInt(int n):回傳 0 到 n之間的均勻分佈的 int (包括 0,不包括 n)
			char getChar = s.charAt(position);
			sb.append(getChar);
		}
		return sb.toString();
	}

	// 寄送email
	public void sendMail(String to, String subject, String messageText) {

		try {
			// 設定使用SSL連線至 Gmail smtp Server
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			// ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
			// ●須將myGmail的【安全性較低的應用程式存取權】打開
		     final String myGmail = "joess.cts02@g2.nctu.edu.tw";
		     final String myGmail_password = "b122944183";
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(myGmail, myGmail_password);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(to));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// 設定信中的主旨
			message.setSubject(subject);
			// 設定信中的內容
			message.setText(messageText);

			Transport.send(message);
			System.out.println("傳送成功!");
		} catch (MessagingException e) {
			System.out.println("傳送失敗!");
			e.printStackTrace();
		}
	}

}
