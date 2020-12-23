package com.shop;



import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;


import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_product.model.ProdService;
import com.shop_product.model.ProdVO;


@WebServlet("/getPictureServlet")
public class getPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection con;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		String prod_no = req.getParameter("prod_no");
		
		try {
				
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_no);
				byte[] prod_photo = prodVO.getProdPhoto();
				
				res.setContentType("image/jpg");
				ServletOutputStream out = res.getOutputStream();
				
				InputStream ins = new ByteArrayInputStream(prod_photo);
				BufferedInputStream buf = new BufferedInputStream(ins);
				//buf¬Oinªº·N«ä

				byte[] bytes = new byte[4 * 1024];
				int i;
				while((i = buf.read(bytes)) != -1) {
					out.write(bytes, 0, i);
				}
				buf.close();
				out.close();
			
//			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
//	}
	
//	public void init() throws ServletException {
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "EA102G5", "123456");
//		} catch (ClassNotFoundException e) {
//			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
//		} catch (SQLException e) {
//			throw new UnavailableException("Couldn't get db connection");
//		}
//	}
//
//	public void destroy() {
//		try {
//			if (con != null) con.close();
//		} catch (SQLException e) {
//			System.out.println(e);
//		}
	}
	


	

}
