package com.chat.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.chat.model.ChatPicService;
import com.chat.model.ChatPicVO;



@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ChatPicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Collection<Part> parts=req.getParts();
		ChatPicVO chatPicVO = new ChatPicVO();
		String chat_pic_number=req.getParameter("chat_pic_number");
		System.out.println("轉交成功");
		for(Part part:parts) {
			String name=part.getName();
			System.out.println("Part:"+name);
			InputStream in=part.getInputStream();
			if("chat_img".equals(name)) {
				byte[] chat_img=new byte[in.available()];
				in.read(chat_img);
				chatPicVO.setChat_img(chat_img);
				chatPicVO.setChat_pic_number(chat_pic_number);
				in.close();
				ChatPicService chatSvc= new ChatPicService();
				chatSvc.ChatPicInsert(chatPicVO);
			}
		}
	}

}
