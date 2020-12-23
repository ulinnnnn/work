package com.mem.controller;


import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mem.model.MemService;
import com.mem.model.MemVO;


@WebServlet("/upLoad")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemUpdatePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
		HttpSession session=req.getSession();
		Collection<Part> parts=req.getParts();
		MemVO memVO=(MemVO)session.getAttribute("memVO");
		
		for(Part part:parts) {
			String name=part.getName();
//			System.out.println(part==null);
			System.out.println("Part:"+name);
			InputStream in=part.getInputStream();
			if("file".equals(name)) {
				byte[] mem_pic=new byte[in.available()];
				in.read(mem_pic);
				in.close();
				
				MemService memSVC=new MemService();
				memSVC.memUpdatePic(memVO.getMem_no(), mem_pic);
			}
		}
	}

}
