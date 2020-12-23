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
		System.out.println("��榨�\");
		System.out.println(action);
		
		//�s�W�|��
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
						errorMsgs.add("�ж�|���m�W!!");
					} else if (!mem_name.trim().matches(memReg)) {
						errorMsgs.add("�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
					}
																		
					String	mem_account = req.getParameter("mem_account");
					System.out.println("~~~~"+mem_account);
					MemVO checkAcc=memSvc.memSelect(mem_account);
					if (mem_account.trim().length()==0) {
						errorMsgs.add("�ж�g�b��!!");
						System.out.println("123456");
					} else if (!mem_account.trim().matches(memReg)) {
						errorMsgs.add("���U�b��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����!!");
					}
					if(checkAcc!=null) {
						errorMsgs.add("�ӱb���w�Q���U!!");
					}										
					String mem_pwd = req.getParameter("mem_pwd");
					if (mem_pwd.trim().length() == 0) {
						errorMsgs.add("�ж�g�K�X!!");
					} else if (!mem_pwd.trim().matches(memReg)) {
						errorMsgs.add("�K�X: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����!!");
					}
									
					String	mem_phone = req.getParameter("mem_phone");
					if (mem_phone.trim().length() == 0) {
						errorMsgs.add("�п�J�s���q��");
					}else if(!mem_phone.trim().matches(memReg)) {
						errorMsgs.add("�q�ܥu��O�Ʀr");
					}
					 
					
					String mem_email = req.getParameter("mem_email");
					MemVO checkEmail=memSvc.memSelectByEmail(mem_email);
						if(checkEmail!=null) {
							errorMsgs.add("��Email�w�Q���U!!");
						}
						if (mem_email.trim().length() == 0) {
						errorMsgs.add("�п�J�q�l�l��!!");
						}
						
					java.sql.Date mem_born=null;
						try {
							mem_born = java.sql.Date.valueOf(req.getParameter("mem_born"));
						} catch (IllegalArgumentException e) { // valueOf�ߥXIllegalArgumentException
							mem_born = new java.sql.Date(System.currentTimeMillis());
							errorMsgs.add("�п�ܥͤ�!");
						}
											
					String mem_sex = req.getParameter("mem_sex");
					if(mem_sex.trim().length()==0) {
						errorMsgs.add("�п�ܩʧO");
					}
					String mem_bank =req.getParameter("mem_bank");
					
					StringBuilder sbMem_addr=new StringBuilder();
					String mem_addr1 = req.getParameter("mem_addr1");
					if(!mem_addr1.trim().isEmpty())
						sbMem_addr.append(mem_addr1);
					else
						errorMsgs.add("�п�ܿ���");
					String mem_addr2 = req.getParameter("mem_addr2");
					if(!mem_addr2.trim().isEmpty())
						sbMem_addr.append(mem_addr2);
					else {
						System.out.println(mem_addr2);
						errorMsgs.add("�п�ܰ�");
					}
					String mem_addr3 = req.getParameter("mem_addr3");
					if(!mem_addr3.trim().isEmpty())
						sbMem_addr.append(mem_addr3);
					else
						errorMsgs.add("�ж�J�a�}");
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
								errorMsgs.add("�Ӥ����~");
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
				errorMsgs.add("�ӽп��~:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/signup.jsp");
				failureView.forward(req, res);

			}finally {
				poolSend.close();
			}

		}
		//�ק�|�����
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
									errorMsgs.add("�ж�|���m�W!!");
								} else if (!mem_name.trim().matches(memReg)) {
										errorMsgs.add("���u�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
								}		
											
							String	mem_phone = req.getParameter("mem_phone");
								if (mem_phone.trim().length()==0) {
									errorMsgs.add("�п�J�s���q��");
								}else if(!mem_phone.trim().matches(phoneReg)) {
									errorMsgs.add("�q�ܥu��O�Ʀr");
								}
							 
								
							String mem_email = req.getParameter("mem_email");
								if (mem_email.trim().length() == 0) {
								errorMsgs.add("�п�J�q�l�l��!!");
								}
								
							java.sql.Date mem_born=null;
								try {
									mem_born = java.sql.Date.valueOf(req.getParameter("mem_born"));
								} catch (IllegalArgumentException e) { // valueOf�ߥXIllegalArgumentException
									mem_born = new java.sql.Date(System.currentTimeMillis());
									errorMsgs.add("�п�ܥͤ�!");
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
						errorMsgs.add("�׸Ӹ�T���~:" + e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-profile.jsp");
						failureView.forward(req, res);
					}
				}
		
		
		//�|���n�J
		if ("memLogin".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				HttpSession session=req.getSession();
				//���o�ϥΪ̿�J���b��
				String account = req.getParameter("mem_account");
				if (account.trim().length()==0) {
					errorMsgs.add("�п�J�b��~~~��}");
				}
		System.out.println(account);
				//���o�ϥΪ̿�J���K�X
				String pwd = req.getParameter("mem_pwd");
		System.out.println(pwd);
				if (pwd.trim().length()==0) {
					errorMsgs.add("�n�J�����K�X?�ݸ�?");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/login.jsp");
					failureView.forward(req, res);
					return;
				}
				MemService memSvc=new MemService();
				MemVO memVO=memSvc.memSelect(account);
				
				if (memVO == null) {
					errorMsgs.add("���b�������U!");
				}
				if(!(memVO.getMem_pwd().equals(pwd))) {
					errorMsgs.add("��J�K�X���~!");
				}
				if(memVO.getMem_type().equals("FALSE")) {
					errorMsgs.add("�ӱb���w�Q����!�Q��?��");
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
		
		//�|���n�X
		if("memLogout".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
			HttpSession session=req.getSession();
			session.removeAttribute("location");
			session.removeAttribute("memVO");
			res.sendRedirect(req.getContextPath()+"/index1.jsp");
			
			}catch(Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
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
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/memSelect.jsp");
				failureView.forward(req, res);
			}
		}
					
		
		
		//����|��
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
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back-mem/empSeletAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		//����|��
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
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back-mem/empSeletAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		//�|���s������K�X�����ҭ���
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
				errorMsgs.add("�нT�{�O�_������{�ҫH:"+e);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/index1.jsp");
				failureView.forward(req, res);
			}
		}
		//�|���ӧ�K�X
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
				errorMsgs.add("�нT�{�O�_������{�ҫH:"+e);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/updatePassword.jsp");
				failureView.forward(req, res);
			}
		}
		//�|�����ұb��
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
					errorMsgs.add("��J�����ҽX���~");
				}
				if(openCode.trim().length()==0) {
					errorMsgs.add("�п�J���ҽX");
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
				errorMsgs.add("�нT�{�O�_������{�ҫH:"+e);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front-mem/memVerification.jsp");
				failureView.forward(req, res);
			}
		}
	
	
	
	}

}
