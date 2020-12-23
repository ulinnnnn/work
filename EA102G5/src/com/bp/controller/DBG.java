package com.bp.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class DBG extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			
			String bp_no = req.getParameter("bp_no");
			
			String image_column = req.getParameter("image_column");
			
			String sq1 = "SELECT bp_pic1 FROM bproduct WHERE bp_no = '"+ bp_no +"'";
			String sq2 = "SELECT bp_pic2 FROM bproduct WHERE bp_no = '"+ bp_no +"'";

			
			ResultSet rs;
			if("bp_pic1".equals(image_column)){
				rs = stmt.executeQuery(sq1);
			} else {
				rs = stmt.executeQuery(sq2);
			}
			
			if(rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(image_column));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				//res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream in = getServletContext().getResourceAsStream("img/1.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("img/1.jpg");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();

		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}