package com.emp.ctrl;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;
import com.resign.model.ResignService;
import com.resign.model.ResignVO;

public class EmpLoginServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		String action = req.getParameter("action");
		
		if("login".equals(action)) {
			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);
												
				String empNo = req.getParameter("empNo").trim();				
				String empPsd = req.getParameter("empPsd").trim();				
			
				EmpService empSvc = new EmpService();
				List<EmpVO>empList = empSvc.getAll();
				
				List<String> empNoList = new ArrayList<>();
			
				empNoList = empList.stream()
							.map(e -> e.getEmpNo())
							.collect(Collectors.toList());	
				
				//辭職名單&訊息
				ResignService resignSvc = new ResignService();
				List<ResignVO> resignList = resignSvc.getAll();
				
				List<String> resignEmpNoList = new ArrayList<String>();
				resignEmpNoList = resignList.stream()
						.map(e -> e.getEmpNo())
						.collect(Collectors.toList());
				List<String> getOutMsg = new LinkedList<String>();
				req.setAttribute("getOutMsg", getOutMsg);	
				
				//包裝empVO
				EmpVO empVO = empSvc.getOneEmp(empNo);				
				req.setAttribute("empVO", empVO);
				
				HttpSession session = req.getSession();		
				session.setAttribute("empVO", empVO);
				
				if(resignEmpNoList.contains(empNo)){
//					getOutMsg.add("離職就給快滾!!!");
					RequestDispatcher rd = req.getRequestDispatcher("/empLogin/getOut1.jsp");
					rd.forward(req, res);
					return;
				}
				
				if(empNoList.contains(empNo)) {
					
					if(empPsd.equals(empVO.getEmpPsd())) {
						res.sendRedirect(req.getContextPath()+"/backEndG5/backEndHome.jsp");
//						RequestDispatcher rd = req.getRequestDispatcher("/emp/showAll.jsp");
//						rd.forward(req, res);
					}else {
						errMessages.add("哼!!你的密碼錯了，不給你進入!!");
						RequestDispatcher rd = req.getRequestDispatcher("/empLogin/empLogin.jsp");
						rd.forward(req, res);
					}			
					
//				}else if(resignEmpNoList.contains(empNo)){
//					errMessages.add("滾!!");
//					RequestDispatcher rd = req.getRequestDispatcher("/empLogin/empLogin.jsp");
//					rd.forward(req, res);
				}else {
					errMessages.add("吼~找不到這員工啦!!");
					RequestDispatcher rd = req.getRequestDispatcher("/empLogin/empLogin.jsp");
					rd.forward(req, res);
					
				}
							
		}
		
		if("inputEmail".equals(action)) {
			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);
			
				String empNo = req.getParameter("empNo").trim();									
				String inputEmail = req.getParameter("inputEmail").trim();				
	
				String empPsd = getRandomString(6);
											
				EmpService empSvc = new EmpService();
				empSvc.updateEmpPsd(empNo,empPsd);
				
				String to = inputEmail;
//				String mailPsd = "b122944183";
				String subject = "密碼通知";
				String messageText = "密碼為:"+empPsd;
				sendMail(to, subject, messageText);
				
				RequestDispatcher rd = req.getRequestDispatcher("/empLogin/empLogin.jsp");
				rd.forward(req, res);
											
		}
		
		
	}
	
	public String getRandomString(int len) {
		final String s = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		SecureRandom sRandom = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		
		for(int i=0 ; i<len ; i++ ) {
			int position = sRandom.nextInt(s.length()); //Random class的nextInt(int n):回傳 0 到 n之間的均勻分佈的 int (包括 0,不包括 n)
			char getChar = s.charAt(position);
			sb.append(getChar);
		}
		return sb.toString();
	}
	
	public void sendMail(String to, String subject, String messageText) {
		
		   try {
			   // 設定使用SSL連線至 Gmail smtp Server
			   Properties props = new Properties();
			   props.put("mail.smtp.host", "smtp.gmail.com");
			   props.put("mail.smtp.socketFactory.port", "465");
			   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			   props.put("mail.smtp.auth", "true");
			   props.put("mail.smtp.port", "465");

	       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
	       // ●須將myGmail的【安全性較低的應用程式存取權】打開
		     final String myGmail = "joess.cts02@g2.nctu.edu.tw";
		     final String myGmail_password = "b122944183";
			   Session session = Session.getInstance(props, new Authenticator() {
				   protected PasswordAuthentication getPasswordAuthentication() {
					   return new PasswordAuthentication(myGmail,myGmail_password);
				   }
			   });

			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(to));
			   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			  
			   //設定信中的主旨  
			   message.setSubject(subject);
			   //設定信中的內容 
			   message.setText(messageText);

			   Transport.send(message);
			   System.out.println("傳送成功!");
	     }catch (MessagingException e){
		     System.out.println("傳送失敗!");
		     e.printStackTrace();
	     }
	   }
}	