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

public class ImpPic {

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		Blob blob = null;
		byte[] pic = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "EA102G5", "123456");
			pstmt = con.prepareStatement("update emp set emp_pic=? where emp_no=?");

			for (int i = 1; i <= 10; i++) {
				
				String empNo = null;
				
				if(i<10) {
					empNo = "e00"+i;					
				}else if(i>=10) {
					empNo = "e0"+i;
				}
				
				blob = con.createBlob();
				String path = "WebContent/backEndG5/img/"+i+".png";				
				pic = getPictureByteArray(path);
				blob.setBytes(1, pic);
				pstmt.setBlob(1, blob);
				pstmt.setString(2, empNo);
				pstmt.executeUpdate();
				pstmt.clearParameters();
			
			}
			System.out.println("管理員圖片匯入成功");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
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
