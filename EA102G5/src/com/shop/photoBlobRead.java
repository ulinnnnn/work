package com.shop;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class photoBlobRead {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "EA102G5";
	private static final String PASSWORD = "123456";
	private static final String SQL = "SELECT prod_photo FROM shop_product WHERE prod_no = ?";

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL);

			// 1. getBlob
			pstmt.setString(1, "p001");
			ResultSet rs1 = pstmt.executeQuery();
			rs1.next();
			Blob blob = rs1.getBlob(1);
			readPicture(blob);

			// �M�Ÿ̭��ѼơA���ШϥΤw���o��PreparedStatement����
			pstmt.clearParameters();

			// 2. getBytes
//			pstmt.setInt(1, 2);
//			ResultSet rs2 = pstmt.executeQuery();
//			rs2.next();
//			byte[] pic = rs2.getBytes(1);
//			readPicture(pic);

			// �M�Ÿ̭��ѼơA���ШϥΤw���o��PreparedStatement����
//			pstmt.clearParameters();

			// 3. setBinaryStream
//			pstmt.setInt(1, 3);
//			ResultSet rs3 = pstmt.executeQuery();
//			rs3.next();
//			InputStream is = rs3.getBinaryStream(1);
//			readPicture(is);

			System.out.println("�d�ߦ��\");

			rs1.close();
//			rs2.close();
//			rs3.close();

		} catch (ClassNotFoundException ce) {
			System.out.println(ce);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException ie) {
			System.out.println(ie);
		} finally {
			// �̫إ߶��������귽 (�V�߫إ߶V������)
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}

	// Handle with blob data
	public static void readPicture(Blob blob) throws IOException, SQLException {
		InputStream is = blob.getBinaryStream();
		FileOutputStream fos = new FileOutputStream("WebContent/Output/1.jpeg");
		int i;
		while ((i = is.read()) != -1) {
			fos.write(i);
		}
		fos.flush();
		fos.close();
	}

	// Handle with byte array data
//	public static void readPicture(byte[] bytes) throws IOException {
//		FileOutputStream fos = new FileOutputStream("Output/2.png");
//		fos.write(bytes);
//		fos.flush();
//		fos.close();
//	}

	// Handle with stream data
//	public static void readPicture(InputStream is) throws IOException {
//		FileOutputStream fos = new FileOutputStream("Output/3.png");
//		int i;
//		while ((i = is.read()) != -1) {
//			fos.write(i);
//		}
//		fos.flush();
//		fos.close();
//	}
}
