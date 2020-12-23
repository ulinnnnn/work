package com.chat.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONObject;


@WebServlet("/ChatUpload")
@MultipartConfig(fileSizeThreshold = 50*1024 * 1024, maxFileSize = 50* 1024 * 1024, maxRequestSize = 50 * 10 * 1024 * 1024)
public class ChatUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/chat_upload";
	int floderNumber=1;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		JSONObject obj = new JSONObject();
		PrintWriter out = res.getWriter();
//		System.out.println("ContentType="+req.getContentType()); // 測試用

		String realPath = getServletContext().getRealPath(saveDirectory);
		System.out.println("realPath="+realPath); // 測試用
		File fsaveDirectory = new File(realPath);
		if (!fsaveDirectory.exists())
			 fsaveDirectory.mkdirs(); // 於 ContextPath 之下,自動建立目地目錄
		
		File fsaveDirectory2 = new File(realPath, Integer.toString(floderNumber));
		if (!fsaveDirectory2.exists())
			fsaveDirectory2.mkdirs();
		Collection<Part> parts = req.getParts(); // Servlet3.0新增了Part介面，讓我們方便的進行檔案上傳處理
		for (Part part : parts) {
			String filename = getFileNameFromPart(part);
			if (filename!= null && part.getContentType()!=null) {
				String name = part.getName();
				String ContentType = part.getContentType();
				long size = part.getSize();
				File f = new File(fsaveDirectory2, filename);
				System.out.println("filename: " + filename);
				System.out.println("ContentType: " + ContentType);
				System.out.println(size);
				String sizeS="";
				if(size<1024) {
					size=size%1024;
					sizeS="0."+Long.toString(size)+"KB";
				}else if(1024<=size&&size<1048576){
					long size1=size/1024;
					long s2=size%1024;
					sizeS=Long.toString(size1)+"."+Long.toString(s2)+"KB";
				}else if(1048576<=size&&size<1073741824) {
					long size1=size/1024/1024;
					long s2=size%1048576;
					sizeS=Long.toString(size1)+"."+Long.toString(s2)+"KB";
				}
				
				// 利用File物件,寫入目地目錄,上傳成功
				part.write(f.toString());
				String down=saveDirectory+"/"+floderNumber+"/"+ filename;
				InputStream in = part.getInputStream();
				byte[] buf = new byte[in.available()];
				in.read(buf);
				in.close();
				obj.put("downLoadPath",down);
				obj.put("fileName",filename);
				obj.put("fileSize",sizeS);
				res.setContentType("text/plain");
				out.write(obj.toString());
				out.flush();
				out.close();
			}
		}
		floderNumber++;
	}
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
