package com.mem.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.depo.model.*;
import com.mem.mail.MailService;
import com.mem.mail.PoolSend;
import com.mem.model.*;


import javafx.scene.effect.ImageInput;
import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 4 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
@WebServlet("/MemServlet2")
public class MemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		Collection<Part> parts = req.getParts();
		
		res.setHeader("Cache","no-store");
		res.setHeader("Pragma","no-cache");
		res.setDateHeader("Expires",0);
		System.out.println("轉交成功");
		System.out.println(action);
		
		//新增會員
		if ("memSignup".equals(action)) {
			System.out.println("123456");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String memReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			String phoneReg="^([0-9]{3}-?[0-9]{8}|[0-9]{4}-?[0-9]{7})$";			
			PoolSend poolSend=new  PoolSend();
			try {	MemService memSvc=new MemService();
					String	mem_name = req.getParameter("mem_name");
					if (mem_name.trim().length() == 0) {
						errorMsgs.add("請填會員姓名!!");
					} else if (!mem_name.trim().matches(memReg)) {
						errorMsgs.add("姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
					}
																		
					String	mem_account = req.getParameter("mem_account");
					System.out.println("~~~~"+mem_account);
					MemVO checkAcc=memSvc.memSelect(mem_account);
					if (mem_account.trim().length()==0) {
						errorMsgs.add("請填寫帳號!!");
						System.out.println("123456");
					} else if (!mem_account.trim().matches(memReg)) {
						errorMsgs.add("註冊帳號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間!!");
					}
					if(checkAcc!=null) {
						errorMsgs.add("該帳號已被註冊!!");
					}										
					String mem_pwd = req.getParameter("mem_pwd");
					if (mem_pwd.trim().length() == 0) {
						errorMsgs.add("請填寫密碼!!");
					} else if (!mem_pwd.trim().matches(memReg)) {
						errorMsgs.add("密碼: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間!!");
					}
									
					String	mem_phone = req.getParameter("mem_phone");
					if (mem_phone.trim().length() == 0) {
						errorMsgs.add("請輸入連絡電話");
					}else if(!mem_phone.trim().matches(memReg)) {
						errorMsgs.add("電話只能是數字");
					}
					 
					
					String mem_email = req.getParameter("mem_email");
					MemVO checkEmail=memSvc.memSelectByEmail(mem_email);
						if(checkEmail!=null) {
							errorMsgs.add("該Email已被註冊!!");
						}
						if (mem_email.trim().length() == 0) {
						errorMsgs.add("請輸入電子郵件!!");
						}
						
					java.sql.Date mem_born=null;
						try {
							mem_born = java.sql.Date.valueOf(req.getParameter("mem_born"));
						} catch (IllegalArgumentException e) { // valueOf拋出IllegalArgumentException
							mem_born = new java.sql.Date(System.currentTimeMillis());
							errorMsgs.add("請選擇生日!");
						}
											
					String mem_sex = req.getParameter("mem_sex");
					if(mem_sex.trim().length()==0) {
						errorMsgs.add("請選擇性別");
					}
					String mem_bank =req.getParameter("mem_bank");
					
					StringBuilder sbMem_addr=new StringBuilder();
					String mem_addr1 = req.getParameter("mem_addr1");
					if(!mem_addr1.trim().isEmpty())
						sbMem_addr.append(mem_addr1);
					else
						errorMsgs.add("請選擇縣市");
					String mem_addr2 = req.getParameter("mem_addr2");
					if(!mem_addr2.trim().isEmpty())
						sbMem_addr.append(mem_addr2);
					else {
						System.out.println(mem_addr2);
						errorMsgs.add("請選擇區");
					}
					String mem_addr3 = req.getParameter("mem_addr3");
					if(!mem_addr3.trim().isEmpty())
						sbMem_addr.append(mem_addr3);
					else
						errorMsgs.add("請填入地址");
					BASE64Decoder decoder=new BASE64Decoder();
					BASE64Encoder encoder=new BASE64Encoder();
					String mem_base_pic=null;
					byte[]	mem_pic=null;
					for (Part part : parts) {
						String name = part.getName();
						if ("mem_pic".equals(name)) {
							try {	
									InputStream in = part.getInputStream();
									byte[] buf = new byte[in.available()];
									in.read(buf);
									mem_pic=buf;
									mem_base_pic=encoder.encode(buf);
									if(mem_base_pic.trim().length()==0) {
										String check_base_pic=req.getParameter("mem_base_pic");
										if(check_base_pic.trim().length()!=0) {
											mem_pic=decoder.decodeBuffer(req.getParameter("mem_base_pic"));
											mem_base_pic=req.getParameter("mem_base_pic");
										}else {
											mem_pic=null;
										}
									}
									in.close();
							}catch(IOException e) {
								errorMsgs.add("照片有誤");
							}
						}
					}	
						
						MemVO memVO=new MemVO();
						memVO.setMem_name(mem_name);
						memVO.setMem_account(mem_account);
						memVO.setMem_pwd(mem_pwd);
						memVO.setMem_phone(mem_phone);
						memVO.setMem_email(mem_email);
						memVO.setMem_born(mem_born);
						memVO.setMem_sex(mem_sex);
						memVO.setMem_bank(mem_bank);
						memVO.setMem_addr1(mem_addr1);
						memVO.setMem_addr2(mem_addr2);
						memVO.setMem_addr3(mem_addr3);
						memVO.setMem_addr(sbMem_addr.toString());
						memVO.setMem_pic(mem_pic);
						memVO.setBase_mem_pic(mem_base_pic);
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("memVO", memVO);
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/signup.jsp");
						failureView.forward(req, res);
						return;
					}
					
				
				memVO=memSvc.memInsert(mem_name, mem_account, mem_pwd, mem_phone, mem_email, mem_born, mem_sex,sbMem_addr.toString(),
						mem_bank, mem_pic);
				
				HttpSession session=req.getSession();
				memVO.setMem_pic(null);
				session.setAttribute("memVO", memVO);
				
				String url=req.getContextPath()+"/Front-mem/memVerification.jsp";
				res.sendRedirect(url);
			
			} catch (Exception e) {
				errorMsgs.add("申請錯誤:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/signup.jsp");
				failureView.forward(req, res);

			}finally {
				poolSend.close();
			}

		}
		//修改會員資料
		if("memUpdate".equals(action)) {
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					String memReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
					String phoneReg="^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";			
								
						try {
							HttpSession session=req.getSession();
							MemVO updateMemVO=(MemVO)session.getAttribute("memVO");
							String  mem_account=updateMemVO.getMem_account();
							String	mem_name = req.getParameter("mem_name");
								if (mem_name.trim().length() == 0) {
									errorMsgs.add("請填會員姓名!!");
								} else if (!mem_name.trim().matches(memReg)) {
										errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
								}		
											
							String	mem_phone = req.getParameter("mem_phone");
								if (mem_phone.trim().length()==0) {
									errorMsgs.add("請輸入連絡電話");
								}else if(!mem_phone.trim().matches(phoneReg)) {
									errorMsgs.add("電話只能是數字");
								}
							 
								
							String mem_email = req.getParameter("mem_email");
								if (mem_email.trim().length() == 0) {
								errorMsgs.add("請輸入電子郵件!!");
								}
								
							java.sql.Date mem_born=null;
								try {
									mem_born = java.sql.Date.valueOf(req.getParameter("mem_born"));
								} catch (IllegalArgumentException e) { // valueOf拋出IllegalArgumentException
									mem_born = new java.sql.Date(System.currentTimeMillis());
									errorMsgs.add("請選擇生日!");
								}
							
							String mem_bank =(String) req.getParameter("mem_bank");
															
							String mem_addr = req.getParameter("mem_addr");
							
							System.out.println("mem_addr"+mem_addr);
							updateMemVO.setMem_account(mem_account);
							updateMemVO.setMem_name(mem_name);
							updateMemVO.setMem_phone(mem_phone);
							updateMemVO.setMem_email(mem_email);
							updateMemVO.setMem_born(mem_born);
							updateMemVO.setMem_bank(mem_bank);
							updateMemVO.setMem_addr(mem_addr);
							
							MemService memSvc = new MemService();
							if (!errorMsgs.isEmpty()) {
								MemVO memVO=memSvc.memSelect(mem_account);
								session.setAttribute("memVO", memVO);
								req.setAttribute("updateMemVO", updateMemVO);
								RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-profile.jsp");
								failureView.forward(req, res);
								return;
							}
						
						updateMemVO=memSvc.memUpdate(mem_account, mem_name, mem_phone, mem_email, mem_born, mem_addr, mem_bank);
						
						session.setAttribute("memVO", updateMemVO);
						res.sendRedirect(req.getContextPath()+"/Front-mem/account-profile.jsp");
					}catch(Exception e) {
						errorMsgs.add("修該資訊有誤:" + e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-profile.jsp");
						failureView.forward(req, res);
					}
				}
		
		
		//會員登入
		if ("memLogin".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				HttpSession session=req.getSession();
				//取得使用者輸入的帳號
				String account = req.getParameter("mem_account");
				if (account.trim().length()==0) {
					errorMsgs.add("請輸入帳號~~~啾咪");
				}
		System.out.println(account);
				//取得使用者輸入的密碼
				String pwd = req.getParameter("mem_pwd");
		System.out.println(pwd);
				if (pwd.trim().length()==0) {
					errorMsgs.add("登入不打密碼?問號?");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/login.jsp");
					failureView.forward(req, res);
					return;
				}
				MemService memSvc=new MemService();
				MemVO memVO=memSvc.memSelect(account);
				
				if (memVO == null) {
					errorMsgs.add("此帳號未註冊!");
				}
				if(!(memVO.getMem_pwd().equals(pwd))) {
					errorMsgs.add("輸入密碼有誤!");
				}
				if(memVO.getMem_type().equals("FALSE")) {
					errorMsgs.add("該帳號已被封鎖!想哭?嫩");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/login.jsp");
					failureView.forward(req, res);
					return;
				}
				DepoService depoSvc=new DepoService();
				DepoVO depoVO=depoSvc.memNowDepo(memVO.getMem_no());
				System.out.println(depoVO==null);
				if(depoVO==null) {
					depoVO=new DepoVO();
					depoVO.setDepo_point(0);
				}
				if(memVO.getMem_pwd().equals(pwd)) {
					session.setAttribute("memVO", memVO);
					session.setAttribute("mem_type",memVO.getMem_type());
					session.setAttribute("depoVO", depoVO);

					String location=(String)session.getAttribute("location");
	System.out.println("location="+location);
					if(location!=null) {
						res.sendRedirect(location);
						System.out.println(123123);
						return;
					}
					String url=req.getParameter("url");
					if(url==null) {
						res.sendRedirect(req.getContextPath()+"/index1.jsp");
						System.out.println(456456);
					}else {
						res.sendRedirect(url);
						System.out.println(789789);
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/login.jsp");
				failureView.forward(req, res);
			}
		}
		
		//會員登出
		if("memLogout".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
			HttpSession session=req.getSession();
			session.removeAttribute("location");
			session.removeAttribute("memVO");
			res.sendRedirect(req.getContextPath()+"/index1.jsp");
			
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/index1.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if("memUpdateByEmp".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
			String mem_account=req.getParameter("mem_account");
			
			MemService memSvc=new MemService();
			MemVO memVO=memSvc.memSelect(mem_account);
			req.setAttribute("memVO",memVO);
			req.setAttribute("emp","memUpdateByEmp");
			RequestDispatcher successView=req.getRequestDispatcher("/Front-mem/memUpdate.jsp");
			successView.forward(req, res);
			
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/memSelect.jsp");
				failureView.forward(req, res);
			}
		}
					
		
		
		//封鎖會員
		if("blockMem".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
					String mem_account = req.getParameter("mem_account");
					System.out.println(mem_account);
					MemService memSvc = new MemService();
					memSvc.memBlock(mem_account);
					HttpSession session=req.getSession();
					session.removeAttribute("memVO");
					res.sendRedirect(req.getContextPath()+"/Back-mem/empSeletAllMem.jsp");
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back-mem/empSeletAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		//解鎖會員
		if("unlockMem".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String mem_account = req.getParameter("mem_account");
				System.out.println(mem_account);
				MemService memSvc = new MemService();
				memSvc.memUnlock(mem_account);
				res.sendRedirect(req.getContextPath()+"/Back-mem/empSeletAllMem.jsp");
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back-mem/empSeletAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		//會員連結到更改密碼或驗證頁面
		if("memDoFromMail".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			try {
				MemService memSvc=new MemService();
				DepoService depoSvc=new DepoService();
			String mailAction=req.getParameter("mailAction");
			HttpSession session=req.getSession();
//			session.setAttribute("mem_email", mem_email);
			if("goVerification".equals(mailAction)) {
				String mem_email=req.getParameter("mem_email");
				MemVO memVO=memSvc.memSelectByEmail(mem_email);
				String mem_verification_code=req.getParameter("mem_verification_code");
				DepoVO depoVO=depoSvc.memNowDepo(memVO.getMem_no());
				if(depoVO==null) {
					depoVO=new DepoVO();
					depoVO.setDepo_point(0);
				}
				req.setAttribute("mem_verification_code", mem_verification_code);
				session.setAttribute("memVO", memVO);
				session.setAttribute("depoVO", depoVO);
				
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/memVerification.jsp");
				failureView.forward(req, res);
			}else if("goUpdatePWD".equals(mailAction)) {
				String mem_email=req.getParameter("mem_email");
				System.out.println(mem_email);
				MemVO memVO=memSvc.memSelectByEmail(mem_email);
				DepoVO depoVO=depoSvc.memNowDepo(memVO.getMem_no());
				if(depoVO==null) {
					depoVO=new DepoVO();
					depoVO.setDepo_point(0);
				}
				session.setAttribute("memVO", memVO);
				session.setAttribute("depoVO", depoVO);
				res.sendRedirect(req.getContextPath()+"/Front-mem/updatePassword.jsp");
			}
			}catch(Exception e) {
				errorMsgs.add("請確認是否有收到認證信:"+e);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/index1.jsp");
				failureView.forward(req, res);
			}
		}
		//會員該改密碼
		if("memNewPWD".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			try {
				String mem_pwd=req.getParameter("mem_pwd2");
				String mem_email=req.getParameter("mem_email");
				System.out.println(mem_pwd);
				System.out.println(mem_email);
				MemService memSVC=new MemService();
				memSVC.memUpdatePWD(mem_email, mem_pwd);
				
				res.sendRedirect(req.getContextPath()+"/index1.jsp");
			}catch(Exception e) {
				errorMsgs.add("請確認是否有收到認證信:"+e);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/updatePassword.jsp");
				failureView.forward(req, res);
			}
		}
		//會員驗證帳號
		if("memOpenAcc".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			MemService memSvc=new MemService();
			DepoService depoSvc=new DepoService();
			HttpSession session=req.getSession();
			try {
				String openCode=req.getParameter("openCode");
				String mem_account=req.getParameter("mem_account");
				MemVO memVO=memSvc.memSelect(mem_account);
				if(!openCode.equals(memVO.getMem_verification_code())) {
					errorMsgs.add("輸入的驗證碼有誤");
				}
				if(openCode.trim().length()==0) {
					errorMsgs.add("請輸入驗證碼");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Front-mem/memVerification.jsp");
					failureView.forward(req, res);
					return;
				}
				memSvc.memOpen(mem_account);
				memVO=memSvc.memSelect(mem_account);
				
				DepoVO depoVO=depoSvc.memNowDepo(memVO.getMem_no());
				if(depoVO==null) {
					depoVO=new DepoVO();
					depoVO.setDepo_point(0);
				}
				session.setAttribute("memVO", memVO);
				session.setAttribute("depoVO", depoVO);
				res.sendRedirect(req.getContextPath()+"/index1.jsp");
				return;
			}catch(Exception e) {
				errorMsgs.add("請確認是否有收到認證信:"+e);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/memVerification.jsp");
				failureView.forward(req, res);
			}
		}
	
	
	
	}

}
