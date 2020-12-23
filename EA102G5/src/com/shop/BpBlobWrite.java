package com.shop;

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


public class BpBlobWrite {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "EA102G5";
	private static final String PASSWORD = "123456";
	private static final String SQL = "UPDATE bproduct set BP_PIC1 = ? where bp_no = ?";

	public static void main(String[] args) {
		
			Connection con = null;
			PreparedStatement pstmt = null;
			Blob blob = null;
			byte[] pic = null;

			try {
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				pstmt = con.prepareStatement(SQL);

				for(int i = 1; i <=10 ; i++) {
					
					String bp_no = null;
					if(i < 10) {
						bp_no = "80000" + i;
					} else if(i >= 10 && i < 100){
						bp_no = "8000" + i;
					} else if(i >= 100) {
						bp_no = "800" + i;
					}
					
					pstmt.setString(2, bp_no);
					blob = con.createBlob();
					String path = "WebContent/imagesbp/" + bp_no + ".png";
					pic = getPictureByteArray(path);
					blob.setBytes(1, pic);
					pstmt.setBlob(1, blob);
					pstmt.executeUpdate();
					pstmt.clearParameters();
					
					
				}

				System.out.println("�s�W���\");
			} catch (ClassNotFoundException ce) {
				System.out.println(ce);
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			} catch (IOException ie) {
				ie.printStackTrace(System.err);
			} finally {
				// �̫إ߶��������귽 (�V�߫إ߶V������)
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

		// �ϥ�byte[]�覡
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
