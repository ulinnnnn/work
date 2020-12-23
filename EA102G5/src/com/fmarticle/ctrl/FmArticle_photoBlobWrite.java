package com.fmarticle.ctrl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class FmArticle_photoBlobWrite {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "EA102G5";
	private static final String PASSWORD = "123456";
	private static final String SQL2 = "UPDATE fmarticle set fm_pic1 = ? where fm_no = ?";
	private static final String SQL = "UPDATE fmarticle set fm_pic2 = ? where fm_no = ?";

	public static void main(String[] args) {
		
			Connection con = null;
			PreparedStatement pstmt = null;
			Blob blob = null;
			byte[] pic = null;

			try {
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				pstmt = con.prepareStatement(SQL);

				for(int i = 1; i <=9 ; i++) {
					
					String fm_no = null;
					if(i < 10) {
						fm_no = "100" + i;
					} else if(i >= 10 && i < 100){
						fm_no = "10" + i;
					} else if(i >= 100) {
						fm_no = "1" + i;
					}
					
					pstmt.setString(2, fm_no);
					blob = con.createBlob();
					String path = "WebContent/img1/img2/" + fm_no + ".jpg";
					pic = getPictureByteArray(path);
					blob.setBytes(1, pic);
					pstmt.setBlob(1, blob);
					pstmt.executeUpdate();
					pstmt.clearParameters();
					
				}

				System.out.println("新增成功");
				
				pstmt = con.prepareStatement(SQL2);

				for(int i = 1; i <=9 ; i++) {
					
					String fm_no = null;
					if(i < 10) {
						fm_no = "100" + i;
					} else if(i >= 10 && i < 100){
						fm_no = "10" + i;
					} else if(i >= 100) {
						fm_no = "1" + i;
					}
					
					pstmt.setString(2, fm_no);
					blob = con.createBlob();
					String path = "WebContent/img1/" + fm_no + ".jpg";
					
					pic = getPictureByteArray(path);
					blob.setBytes(1, pic);
					pstmt.setBlob(1, blob);
					pstmt.executeUpdate();
					pstmt.clearParameters();
					
				}

				System.out.println("新增成功");
			} catch (ClassNotFoundException ce) {
				System.out.println(ce);
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			} catch (IOException ie) {
				ie.printStackTrace(System.err);
			} finally {
				// 依建立順序關閉資源 (越晚建立越早關閉)
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		}

		// 使用byte[]方式
		public static byte[] getPictureByteArray(String path) throws IOException {
			File file = new File(path);
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buffer = new byte[8192];
			int i;
			while ((i = fis.read(buffer)) != -1) {
				baos.write(buffer, 0, i);
			}
			baos.close();
			fis.close();

			return baos.toByteArray();
		}

}
