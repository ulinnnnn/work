package com.resign.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.resign.model.*;

@WebServlet("/backEndG5/signPic")
public class ShowPicServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		res.setContentType("image/jpeg");
		ServletOutputStream sos = res.getOutputStream();
		
		String empNo = req.getParameter("empNo");
		
		ResignService ResignSvc = new ResignService();
		ResignVO resignVO = ResignSvc.showPic(empNo);
		byte[] signPicByte = resignVO.getSignPicByte();	
		
		sos.write(signPicByte);
							
	}
}
