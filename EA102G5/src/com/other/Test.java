package com.other;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.cproduct.model.CproductDAO;
import com.cproduct.model.CproductVO;
@WebServlet("/Test")
public class Test extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
        
		res.setContentType("text/plain; charset=Big5");
		PrintWriter out = res.getWriter();
        
//		Connection con = null;
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		} catch (ClassNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		try {
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","EA102G5","123456");
//			out.println("Got Connection: " + con.toString());
//			out.println("活著");
//			Statement stmt = con.createStatement();
//		    ResultSet rs = stmt.executeQuery("select * from Cproduct");
//			out.println("活著");
//			while (rs.next()) {
//				out.println("empNo = " + rs.getString(1));
//			}
//			con.close();
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		CproductDAO x=new CproductDAO();
		CproductVO y=new CproductVO();
		x.insert(y);
		
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			if (ds != null) {
				Connection conn = ds.getConnection();
                
				if (conn != null) {
					out.println("Got Connection: " + conn.toString());
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from Cproduct");					
					while (rs.next()) {
						out.println("cp_No = " + rs.getString(1));
					}
					conn.close();
				}
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
    
}