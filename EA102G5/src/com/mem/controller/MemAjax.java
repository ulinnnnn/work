package com.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mem.mail.MailService;
import com.mem.mail.PoolSend;
import com.mem.model.MemService;
import com.mem.model.MemVO;


@WebServlet("/MemAjax")
public class MemAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		if("send_verification_code".equals(action)) {
				MemService memSvc=new MemService();
				MailService mailSvc=new MailService();
				try {
					String mem_email=req.getParameter("mem_email");
					String mem_account=req.getParameter("mem_account");
					String mem_verification_code=mailSvc.genAuthCode();
					PoolSend poolSend=new  PoolSend();
					memSvc.memVerification(mem_email, mem_verification_code);
					MailService.openMail openMail=new MailService.openMail(mem_email, "TOYALLHOT會員通知",req.getContextPath(), mem_verification_code,mem_account,req.getScheme(),req.getServerName(),req.getServerPort());
					poolSend.send(openMail);
					poolSend.close();
					res.setContentType("text/plain");
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.write(array.toString());
					out.flush();
					out.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
		
		}
		if("forgetPWD".equals(action)) {
			MemService memSvc=new MemService();
			MailService mailSvc=new MailService();
			String mem_email=req.getParameter("mem_email");
			System.out.println("email="+mem_email);
			PoolSend poolSend=new  PoolSend();
			MailService.pwdMail pwdMail=new MailService.pwdMail(mem_email,"TOYALLHOT會員通知",req.getContextPath(),req.getScheme(),req.getServerName(),req.getServerPort());
			poolSend.send(pwdMail);
			poolSend.close();
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
			
		}
		
		if("reMemName".equals(action)) {
			MemService memSvc=new MemService();
			String memAccount=req.getParameter("mem_account");
			MemVO memVO=memSvc.memSelect(memAccount);
			String mem_name=memVO.getMem_name();
			
			obj.put("mem_name", mem_name);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			array.put(obj);
			out.write(array.toString());
			out.flush();
			out.close();
		}
		if("checkAcc".equals(action)) {
			MemService memSvc=new MemService();
			String memReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			String mem_account=req.getParameter("mem_account");
			MemVO memVO=memSvc.memSelect(mem_account);
			String isOK="";
			if(memVO==null&&mem_account.trim().matches(memReg)) 
				isOK="OK";
			else
				isOK="NO";
			obj.put("check",isOK);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			array.put(obj);
			out.write(obj.toString());
			out.flush();
			out.close();
		}
		if("checkEmail".equals(action)) {
			MemService memSvc=new MemService();
			String memReg = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
			String mem_email=req.getParameter("mem_email");
			MemVO memVO=memSvc.memSelectByEmail(mem_email);
			String isOK="";
			if(memVO==null&&mem_email.trim().matches(memReg)) 
				isOK="OK";
			else
				isOK="NO";
			obj.put("check",isOK);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			array.put(obj);
			out.write(obj.toString());
			out.flush();
			out.close();
		}
		if("memsAddr".equals(action)) {
			String mem_account=req.getParameter("mem_account");
			String mem_addr1=req.getParameter("mem_addr1");
			String mem_addr2=req.getParameter("mem_addr2");
			String mem_addr3=req.getParameter("mem_addr3");
			MemService memSvc=new MemService();
			StringBuilder sbMem_addr=new StringBuilder();
			String mem_addr=sbMem_addr.append(mem_addr1).append(mem_addr2).append(mem_addr3).toString();
			MemVO memVO=memSvc.memSelect(mem_account);
			memVO.setMem_addr(mem_addr);
			memVO=memSvc.memUpdate2(memVO);
			System.out.println("~~~~~~~~"+memVO.getMem_addr());
			HttpSession session=req.getSession();
			session.setAttribute("memVO", memVO);
			obj.put("mem_addr", mem_addr);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			System.out.println(obj.toString());
			out.write(obj.toString());
			out.flush();
			out.close();
		}
	
	}

}
