package com.mem.mail;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
	
	
		public static class pwdMail implements Runnable {
		// 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
		 String to;
		 String subject;
		 String ctxtPath;
		 String Scheme;
		 String ServerName;
		 int serverPort;
		 @Override
		 public void run() {
			 // TODO Auto-generated method stub
			 pwdMail();
		 }
		 public pwdMail(String to,String subject,String ctxtPath,String Scheme,String ServerName,int serverPort){
			 this.to=to;
			 this.subject=subject;
			 this.ctxtPath=ctxtPath;
			 this.Scheme=Scheme;
			 this.ServerName=ServerName;
			this.serverPort=serverPort;;
		 }
		public void pwdMail() {
	
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
				 final String myGmail = "ixlogic.wu@gmail.com";
				 final String myGmail_password = "BBB45678BBB";
				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(myGmail, myGmail_password);
					}
				});
	
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(myGmail));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
				String mem_email=to;
				// 設定信中的主旨
				message.setSubject(subject, "UTF-8");
				// 設定信中的內容
	//		   message.setText(messageText);
				message.setContent("<!DOCTYPE html>"
						+"<html>"
						+ "<head>"
						+"<style>"
						+".dark-matter {margin-left: auto;	margin-right: auto;	max-width: 380px;background: #555;padding: 20px 30px 20px 30px;	font: 12px \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n" + 
						"	color: #D3D3D3;\r\n" + 
						"	text-shadow: 1px 1px 1px #444;\r\n" + 
						"	border: none;\r\n" + 
						"	border-radius: 5px;\r\n" + 
						"	-webkit-border-radius: 5px;\r\n" + 
						"	-moz-border-radius: 5px;\r\n" + 
						"}.dark-matter h1 {\r\n" + 
						"	padding: 0px 0px 10px 40px;\r\n" + 
						"	display: block;\r\n" + 
						"	border-bottom: 1px solid #444;\r\n" + 
						"	margin: -10px -30px 30px -30px;\r\n" + 
						"}\r\n" + 
						".dark-matter h1>span {\r\n" + 
						"	display: block;\r\n" + 
						"	font-size: 11px;\r\n" + 
						"}\r\n" + 
						".dark-matter label {\r\n" + 
						"	display: block;\r\n" + 
						"	margin: 0px 0px 5px;\r\n" + 
						"}\r\n" + 
						".dark-matter label>span {\r\n" + 
						"	float: left;\r\n" + 
						"	width: 20%;\r\n" + 
						"	text-align: right;\r\n" + 
						"	padding-right: 10px;\r\n" + 
						"	margin-top: 10px;\r\n" + 
						"	font-weight: bold;\r\n" + 
						"}\r\n" + 
						".dark-matter input[type=\"text\"], .dark-matter input[type=\"email\"], .dark-matter textarea, .dark-matter select {\r\n" + 
						"	border: none;\r\n" + 
						"	color: #525252;\r\n" + 
						"	height: 25px;\r\n" + 
						"	line-height:15px;\r\n" + 
						"	margin-bottom: 16px;\r\n" + 
						"	margin-right: 6px;\r\n" + 
						"	margin-top: 2px;\r\n" + 
						"	outline: 0 none;\r\n" + 
						"	padding: 5px 0px 5px 5px;\r\n" + 
						"	width: 70%;\r\n" + 
						"	border-radius: 2px;\r\n" + 
						"	-webkit-border-radius: 2px;\r\n" + 
						"	-moz-border-radius: 2px;\r\n" + 
						"	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);\r\n" + 
						"	background: #DFDFDF;\r\n" + 
						"}\r\n" + 
						".dark-matter select {\r\n" + 
						"	background: #DFDFDF url('down-arrow.png') no-repeat right;\r\n" + 
						"	background: #DFDFDF url('down-arrow.png') no-repeat right;\r\n" + 
						"	appearance:none;\r\n" + 
						"	-webkit-appearance:none;\r\n" + 
						"	-moz-appearance: none;\r\n" + 
						"	text-indent: 0.01px;\r\n" + 
						"	text-overflow: '';\r\n" + 
						"	width: 70%;\r\n" + 
						"	height: 35px;\r\n" + 
						"	color: #525252;\r\n" + 
						"	line-height: 25px;\r\n" + 
						"}\r\n" + 
						".dark-matter textarea{\r\n" + 
						"	height:100px;\r\n" + 
						"	padding: 5px 0px 0px 5px;\r\n" + 
						"	width: 70%;\r\n" + 
						"}\r\n" + 
						".dark-matter .button {\r\n" + 
						"	background: #FFCC02;\r\n" + 
						"	border: none;\r\n" + 
						"	padding: 10px 25px 10px 25px;\r\n" + 
						"	color: #585858;\r\n" + 
						"	border-radius: 4px;\r\n" + 
						"	-moz-border-radius: 4px;\r\n" + 
						"	-webkit-border-radius: 4px;\r\n" + 
						"	text-shadow: 1px 1px 1px #FFE477;\r\n" + 
						"	font-weight: bold;\r\n" + 
						"	box-shadow: 1px 1px 1px #3D3D3D;\r\n" + 
						"	-webkit-box-shadow:1px 1px 1px #3D3D3D;\r\n" + 
						"	-moz-box-shadow:1px 1px 1px #3D3D3D;\r\n" + 
						"}\r\n" + 
						".dark-matter .button:hover {\r\n" + 
						"	color: #333;\r\n" + 
						"	background-color: #EBEBEB;\r\n" + 
						"}"
						+"</style>"
						+"<script src=\"http://code.jquery.com/jquery-1.12.4.min.js\"></script>"
						+ "</head>"
						+ "<body>"+
						"	<form action=\"http://"+ServerName+":"+serverPort+ctxtPath+"/Front-mem/mem.do\" id=\"form1\" method=\"post\" class=\"dark-matter\" enctype=\"multipart/form-data\" >\r\n" +  
						"	<h1>TOYALLHOT會員密碼更換\r\n" + 
						"	<span></span>\r\n" + 
						"	</h1>\r\n" + 
						"	<label>\r\n" + 
						"	<span>&nbsp;</span>\r\n" + 
						"	<input type=\"submit\" id=\"submit\" class=\"button\" value=\"點我更改密碼\" />\r\n" + 
						"	<input type=\"hidden\" name=\"mem_email\" class=\"button\" value=\""+mem_email+"\" />\r\n" + 
						"	<input type=\"hidden\" name=\"action\" value=\"memDoFromMail\" />\r\n" + 
						"	<input type=\"hidden\" name=\"mailAction\" value=\"goUpdatePWD\" />\r\n" + 
						"	</label>\r\n" + 
						"	</form>"
						+ "</html>", "text/html;charset=UTF-8");
	
						Transport.send(message);
						System.out.println("傳送成功!");
						} catch (MessagingException e) {
							System.out.println("傳送失敗!");
							e.printStackTrace();
						}
					}
		}

		public static class openMail implements Runnable{
			String to;
			String subject;
			String ctxtPath;
			String  mem_verification_code;
			String mem_account;
			String scheme;
			String serverName;
			int serverPort;
			public openMail(String to, String subject, String ctxtPath, String  mem_verification_code,String mem_account,String Scheme ,String ServerName,int serverPort ) {
				this.to = to;
				this.subject = subject;
				this.ctxtPath = ctxtPath;
				this. mem_verification_code =  mem_verification_code;
				this.mem_account = mem_account;
				this.scheme=Scheme;
				this.serverName=ServerName;
				this.serverPort=serverPort;
			}

			@Override
			 public void run() {
				 // TODO Auto-generated method stub
				openMail();
			}
			
			public void openMail() {

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
					 final String myGmail = "ixlogic.wu@gmail.com";
					 final String myGmail_password = "BBB45678BBB";
					Session session = Session.getInstance(props, new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(myGmail, myGmail_password);
						}
					});

					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(myGmail));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
					String mem_email=to;
					// 設定信中的主旨
					message.setSubject(subject, "UTF-8");
					// 設定信中的內容
//				   message.setText(messageText);
					message.setContent("<!DOCTYPE html>\r\n" + 
							"<html >\r\n" + 
							"<head>\r\n" + 
							"<meta charset=\"UTF-8\">\r\n" + 
							"<title>FORM Text</title>\r\n" + 
							"\r\n" + 
							"<style>.dark-matter {margin-left: auto;	margin-right: auto;	max-width: 380px;background: #555;padding: 20px 30px 20px 30px;	font: 16px \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n" + 
							"	color: #D3D3D3;\r\n" + 
							"	text-shadow: 1px 1px 1px #444;\r\n" + 
							"	border: none;\r\n" + 
							"	border-radius: 5px;\r\n" + 
							"	-webkit-border-radius: 5px;\r\n" + 
							"	-moz-border-radius: 5px;\r\n" + 
							"}\r\n" + 
							".dark-matter h1 {\r\n" + 
							"	padding: 0px 0px 10px 40px;\r\n" + 
							"	display: block;\r\n" + 
							"	border-bottom: 1px solid #444;\r\n" + 
							"	margin: -10px -30px 30px -30px;\r\n" + 
							"}\r\n" + 
							".dark-matter h1>span {\r\n" + 
							"	display: block;\r\n" + 
							"	font-size: 11px;\r\n" + 
							"}\r\n" + 
							".dark-matter label {\r\n" + 
							"	display: block;\r\n" + 
							"	margin: 15px 10px 5px;\r\n" + 
							"}\r\n" + 
							".dark-matter label>span {\r\n" + 
							"	float: left;\r\n" + 
							"	width: 20%;\r\n" + 
							"	text-align: right;\r\n" + 
							"	padding-right: 10px;\r\n" + 
							"	margin-top: 10px;\r\n" + 
							"	font-weight: bold;\r\n" + 
							"}\r\n" + 
							".dark-matter input[type=\"text\"], .dark-matter input[type=\"email\"], .dark-matter textarea, .dark-matter select {\r\n" + 
							"	border: none;\r\n" + 
							"	color: #525252;\r\n" + 
							"	height: 25px;\r\n" + 
							"	line-height:15px;\r\n" + 
							"	margin-bottom: 16px;\r\n" + 
							"	margin-right: 6px;\r\n" + 
							"	margin-top: 2px;\r\n" + 
							"	outline: 0 none;\r\n" + 
							"	padding: 5px 0px 5px 5px;\r\n" + 
							"	width: 70%;\r\n" + 
							"	border-radius: 2px;\r\n" + 
							"	-webkit-border-radius: 2px;\r\n" + 
							"	-moz-border-radius: 2px;\r\n" + 
							"	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);\r\n" + 
							"	background: #DFDFDF;\r\n" + 
							"}\r\n" + 
							".dark-matter select {\r\n" + 
							"	background: #DFDFDF url('down-arrow.png') no-repeat right;\r\n" + 
							"	background: #DFDFDF url('down-arrow.png') no-repeat right;\r\n" + 
							"	appearance:none;\r\n" + 
							"	-webkit-appearance:none;\r\n" + 
							"	-moz-appearance: none;\r\n" + 
							"	text-indent: 0.01px;\r\n" + 
							"	text-overflow: '';\r\n" + 
							"	width: 70%;\r\n" + 
							"	height: 35px;\r\n" + 
							"	color: #525252;\r\n" + 
							"	line-height: 25px;\r\n" + 
							"}\r\n" + 
							".dark-matter textarea{\r\n" + 
							"	height:100px;\r\n" + 
							"	padding: 5px 0px 0px 5px;\r\n" + 
							"	width: 70%;\r\n" + 
							"}\r\n" + 
							".dark-matter .button {\r\n" + 
							"	background: #FFCC02;\r\n" + 
							"	border: none;\r\n" + 
							"	padding: 10px 25px 10px 25px;\r\n" + 
							"	color: #585858;\r\n" + 
							"	border-radius: 4px;\r\n" + 
							"	-moz-border-radius: 4px;\r\n" + 
							"	-webkit-border-radius: 4px;\r\n" + 
							"	text-shadow: 1px 1px 1px #FFE477;\r\n" + 
							"	font-weight: bold;\r\n" + 
							"	box-shadow: 1px 1px 1px #3D3D3D;\r\n" + 
							"	-webkit-box-shadow:1px 1px 1px #3D3D3D;\r\n" + 
							"	-moz-box-shadow:1px 1px 1px #3D3D3D;\r\n" + 
							"}\r\n" + 
							".dark-matter .button:hover {\r\n" + 
							"	color: #333;\r\n" + 
							"	background-color: #EBEBEB;\r\n" + 
							"}\r\n" + 
							"</style>\r\n" + 
							"</head>\r\n" + 
							"<!-- action=\"http://localhost:8081/EA102G5-Version10/Front-mem/login.jsp\"  -->\r\n" + 
							"<body>\r\n" + 
							"	<form action=\"http://"+serverName+":"+serverPort+ctxtPath+"/Front-mem/mem.do\" id=\"form1\" method=\"post\" class=\"dark-matter\" enctype=\"multipart/form-data\" >\r\n" + 
							"		<h1>TOYALLHOT 帳戶驗證\r\n" + 
							"		<span></span>\r\n" + 
							"		</h1>\r\n" + 
							"		<span>您的驗證碼 :</span>\r\n" + 
							"		<input  type=\"text\" name=\"mem_opneCode\" disabled=\"disabled\" value=\""+ mem_verification_code+"\" />\r\n" + 
							"		<input type=\"hidden\" name=\"mem_email\" class=\"button\" value=\""+mem_email+"\" />\r\n" + 
							"		</label>\r\n" + 
							"		<label>\r\n" + 
							"		<span>&nbsp;</span>\r\n" + 
							"		<input id=\"submit\" type=\"submit\" class=\"button\" value=\"點我去驗證\" />\r\n" + 
							"		<input type=\"hidden\" name=\"mem_verification_code\" value=\""+mem_verification_code+"\" />\r\n" +
							"		<input type=\"hidden\" name=\"mem_account\" value=\""+mem_account+"\" />\r\n" +
							"		<input type=\"hidden\" name=\"action\" value=\"memDoFromMail\" />\r\n" +
							"		<input type=\"hidden\" name=\"mailAction\" value=\"goVerification\" />\r\n" +
							"		</label>\r\n" + 
							"	</form>\r\n" + 
							"	\r\n" + 
							"	\r\n" + 
							"</body>\r\n" + 
							"\r\n" + 
							"</html>", "text/html;charset=UTF-8");

					Transport.send(message);
					System.out.println("傳送成功!");
				} catch (MessagingException e) {
					System.out.println("傳送失敗!");
					e.printStackTrace();
				}
			}
		}
		
		public static String genAuthCode() {
			String ranString="";
			for (int i = 1; i <= 8; i++) {
				int num = (int) (Math.random() * 74) + 48;
				if (num >= 48 && num <= 57 || num >= 65 && num <= 90 || num >= 97 && num <= 122) {
					char luan = (char) (num);
					ranString+=String.valueOf(luan);
				} else {
					i--;
				}
			}
			return ranString;
		}
	}
	
	
