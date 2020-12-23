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
	
	// �]�w�ǰe�l��:�ܦ��H�H��Email�H�c,Email�D��,Email���e
	public void sendMail(String to, String subject, String messageText) {
		
//		String to = "";
//		String subject = "";
//		String messageText = "";
//		
//		//���o�q��M�|�����
//		OrdService ordSvc = new OrdService();
//		OrdVO ordVO = ordSvc.getOneOrd(ord_no);
//		MemService memSvc = new MemService();
//		MemVO memVO = memSvc.memSelect(ordVO.getMemNo());	
//		String ord_name = memVO.getMem_name();
//		
//		if(ord_status.equals("�w�X�f")) {
//			to = "denny0329denny0329@gmail.com";
//			subject = "ToyAllHot�q���G�A�q�ʪ��ӫ~�w�X�f";
//			
//			messageText = "�˷R���|�� "+ord_name+" �A�n�G\n"
//						+"�q��"+ord_no+"�w�H�X\n"
//						+"�a�۴��ݪ��ߦ���a��\n"
//						+"ToyAllHot�P�±z���ʶR��";			
//		}
//		
//		if(ord_status.equals("�w�I��")) {
//			to = "denny0329denny0329@gmail.com";
//			subject = "ToyAllHot�q���G�A���q�榨���o";
//			
//			messageText = "Hi " + ord_name+",\n"
//						+"�q��s���G"+ord_no+"\n"
//						+"�q���`���B�G"+ordVO.getOrdPrice()+"\n\n"
//						+"����H\n"
//						+"�m�W�G"+ordVO.getOrdName()+"\n"
//						+"�q�ܡG"+ordVO.getOrdPhone()+"\n"
//						+"����a�}�G"+ordVO.getOrdCode()+" "+ordVO.getOrdCity()
//						+" "+ordVO.getOrdSection()+" "+ordVO.getOrdAddress()+"\n\n"
//						+"�ӫ~�H�X�|�A�t��q���A\n"
//						+"ToyAllHot�P�±z���ʶR��";
//		}
			
	   try {
		   // �]�w�ϥ�SSL�s�u�� Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.socketFactory.port", "465");
		   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.port", "465");

       // 1.�]�w gmail ���b�� & �K�X (�N�ǥѧA��Gmail�ӶǰeEmail)
       // 2.���NmyGmail���i�w���ʸ��C�����ε{���s���v�j���}
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
		  
		   //�]�w�H�����D��  
		   message.setSubject(subject);
		   //�]�w�H�������e 
		   message.setText(messageText);

		   Transport.send(message);
		   System.out.println("�ǰe���\!");
     }catch (MessagingException e){
	     System.out.println("�ǰe����!");
	     e.printStackTrace();
     }
   }
	
//	 public static void main (String args[]){
//
//      String to = "denny0329denny0329@gmail.com";
//      
//      String subject = "�Ĥ@������";
//      
//      String ch_name = "Maggie";
//      String passRandom = "�u�@���W�F���I";
//      String messageText = "Hello! " + ch_name + "\n�����Q�h���̨����O�H" + passRandom + "\n"; 
//       
//      MailService mailService = new MailService();
//      mailService.sendMail(to, subject, messageText);
//
//   }


}
