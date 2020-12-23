package com.shop;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.shop_order.model.*;
import com.mem.model.*;

public class MailService {
	
	// 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
	public void sendMail(String to, String subject, String messageText) {
		
//		String to = "";
//		String subject = "";
//		String messageText = "";
//		
//		//取得訂單和會員資料
//		OrdService ordSvc = new OrdService();
//		OrdVO ordVO = ordSvc.getOneOrd(ord_no);
//		MemService memSvc = new MemService();
//		MemVO memVO = memSvc.memSelect(ordVO.getMemNo());	
//		String ord_name = memVO.getMem_name();
//		
//		if(ord_status.equals("已出貨")) {
//			to = "denny0329denny0329@gmail.com";
//			subject = "ToyAllHot通知：你訂購的商品已出貨";
//			
//			messageText = "親愛的會員 "+ord_name+" 你好：\n"
//						+"訂單"+ord_no+"已寄出\n"
//						+"帶著期待的心收件吧～\n"
//						+"ToyAllHot感謝您的購買～";			
//		}
//		
//		if(ord_status.equals("已付款")) {
//			to = "denny0329denny0329@gmail.com";
//			subject = "ToyAllHot通知：你的訂單成立囉";
//			
//			messageText = "Hi " + ord_name+",\n"
//						+"訂單編號："+ord_no+"\n"
//						+"訂單總金額："+ordVO.getOrdPrice()+"\n\n"
//						+"收件人\n"
//						+"姓名："+ordVO.getOrdName()+"\n"
//						+"電話："+ordVO.getOrdPhone()+"\n"
//						+"收件地址："+ordVO.getOrdCode()+" "+ordVO.getOrdCity()
//						+" "+ordVO.getOrdSection()+" "+ordVO.getOrdAddress()+"\n\n"
//						+"商品寄出會再另行通知，\n"
//						+"ToyAllHot感謝您的購買～";
//		}
			
	   try {
		   // 設定使用SSL連線至 Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.socketFactory.port", "465");
		   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.port", "465");

       // 1.設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
       // 2.須將myGmail的【安全性較低的應用程式存取權】打開
	     final String myGmail = "denny0329denny0329@gmail.com";
	     final String myGmail_password = "tom18251929";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(myGmail));
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
	
//	 public static void main (String args[]){
//
//      String to = "denny0329denny0329@gmail.com";
//      
//      String subject = "第一次測試";
//      
//      String ch_name = "Maggie";
//      String passRandom = "工作辛苦了ㄛ！";
//      String messageText = "Hello! " + ch_name + "\n等等想去哪裡走走呢？" + passRandom + "\n"; 
//       
//      MailService mailService = new MailService();
//      mailService.sendMail(to, subject, messageText);
//
//   }


}
