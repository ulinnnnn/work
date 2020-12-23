package Photoinpit;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertMemPic {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "EA102G5";
	private static final String PASSWORD = "123456";
	private static final String SQL = "UPDATE toymember set mem_pic = ? where mem_no = ?";

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
					
					String mem_no = null;
					if(i < 10) {
						mem_no = "M000" + i;
					} else if(i >= 10 && i < 100){
						mem_no = "M00" + i;
					} else if(i >= 100) {
						mem_no = "M0" + i;
					}
					
					pstmt.setString(2, mem_no);
					String path = "WebContent/images/" + mem_no + ".jpg";
					pic = getPictureByteArray(path);
					pstmt.setBytes(1, pic);
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
