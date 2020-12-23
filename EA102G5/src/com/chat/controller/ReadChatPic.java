package com.chat.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chat.model.ChatPicService;
import com.chat.model.ChatPicVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;


@WebServlet("/ReadChatPic")
public class ReadChatPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("img/gif");
		ServletOutputStream out=res.getOutputStream();
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		try {
			String chat_pic_number=req.getParameter("chatPicNumber");
			ChatPicService chatSvc = new ChatPicService();
			ChatPicVO chatPicVO= chatSvc.selectChatPic(chat_pic_number);
			
			if(chatPicVO.getChat_img()!=null) {
				ByteArrayInputStream bais=new ByteArrayInputStream(chatPicVO.getChat_img());
				BufferedInputStream in=new BufferedInputStream(bais);
				byte[] buf=new byte[4*1024];
				int len;
				while((len=in.read(buf))!=-1) {
					out.write(buf,0,len);
				}
				in.close();
				bais.close();
			}else {
				InputStream in=getServletContext().getResourceAsStream("/images/123.png");
				BufferedInputStream inn=new BufferedInputStream(in);
				byte[] b=new byte[in.available()];
				int len;
				while((len=inn.read(b))!=-1) {
					out.write(b,0,len);
				}
				out.write(b);
				in.close();
				
			}
			
		}catch(Exception e) {
			errorMsgs.add("無法讀取資料:" + e.getMessage());
			RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/index.jsp");
			failureView.forward(req, res);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
