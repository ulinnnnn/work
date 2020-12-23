package com.chat.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatdownLoad")
public class ChatDownLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		   // Use a ServletOutputStream because we may pass binary information
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
	    // Get the file to view
	    String file = req.getPathTranslated();
	    
	    System.out.println("file:"+file);
	   
	    // No file, nothing to view
	    if (file == null) {
	      out.println("No file to view");
	      return;
	    }else {
	    	 System.out.println("file:"+file.length());
	    }

	    // Get and set the type of the file
	    String contentType = getServletContext().getMimeType(file);
	    String file1=(new File(file).getName());
	    res.setContentType("application/force-download");
	    res.setHeader("Content-Disposition", "attachment; filename=\""+file1+"\" ");

	    // Return the file
	    FileInputStream in = null;
		  try {
//			  File fsaveDirectory = new File("C:/TAHDownloads");
//				if (!fsaveDirectory.exists())
//					fsaveDirectory.mkdirs(); // 於 ContextPath 之下,自動建立目地目錄
//			  
//			  FileOutputStream f1= new FileOutputStream(fsaveDirectory+"/"+file1);
//			  BufferedOutputStream bu1= new BufferedOutputStream(f1);
			  in = new FileInputStream(file);
			  byte[] buf = new byte[in.available()]; // buffer
			  in.read(buf);
			  out.write(buf);
//			  bu1.write(buf);
//			  bu1.flush();
//			  bu1.close();
		  } catch (FileNotFoundException e) {
			  out.println("File not found");
		  } catch (IOException e) {
			  out.println("Problem sending file: " + e.getMessage());
		  } finally {
			  if (in != null)
				  in.close();
		  }
		  String action=req.getParameter("action");
		  if("downLo2".equals(action)) {
			  System.out.println(action);
			  try {
				  String[] cmd = new String[5];
				  String url = "C:/TAHDownloads";
				  cmd[0] = "cmd";
				  cmd[1] = "/c";
				  cmd[2] = "start";
				  cmd[3] = " ";
				  cmd[4] = url;
				  Runtime.getRuntime().exec(cmd);
			  } catch (IOException e) {
				  e.printStackTrace();
			  }
		  }
	}
		


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
