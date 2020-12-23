package com.resign.ctrl;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.EmpService;
import com.resign.model.ResignService;
import com.resign.model.ResignVO;
import com.sun.org.apache.bcel.internal.generic.NEW;
//@WebServlet("/backEndG5/resign")
public class ResignServlet extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doPost(req, res);
		}

		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			
			try {
				String empNo = req.getParameter("empNo");
				
				String signPic = req.getParameter("signPic");
				
				String base64Image = (signPic.split(","))[1];
				byte[] signPicByte = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
			
				Date date = new Date();			
				Timestamp resignTime = new Timestamp(date.getTime());								
				
//				ResignVO resignVO = new ResignVO();				
//				resignVO.setEmpNo(empNo);
//				resignVO.setSignPicByte(signPicByte);
//				resignVO.setResignTime(resignTime);
				
//				EmpService empSvc = new EmpService();
//				empSvc.deleteEmp(empNo);
				
				ResignService resignSvc = new ResignService();
				resignSvc.addResign(empNo, signPicByte ,resignTime);
				
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/resign.jsp");
				rd.forward(req, res);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}		
}
