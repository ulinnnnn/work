package com.fmarticle.ctrl;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DBGG extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String fm_no = req.getParameter("fm_no");
			String image_column = req.getParameter("image_column");
			String sq1 = "SELECT fm_pic1 FROM fmarticle WHERE fm_no = '"+ fm_no +"'";
			String sq2 = "SELECT fm_pic2 FROM fmarticle WHERE fm_no = '"+ fm_no +"'";
			
			ResultSet rs;
			if("fm_pic1".equals(image_column)){
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
				InputStream in = getServletContext().getResourceAsStream("img/null.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
				System.out.println("else");
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("img/null.png");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
			System.out.println("catch");
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "EA102G5", "123456");
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
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