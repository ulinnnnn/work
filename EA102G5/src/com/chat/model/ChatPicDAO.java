package com.chat.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mem.model.MemVO;

public class ChatPicDAO implements ChatPic_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO  CHATPIC(chat_pic_no,chat_pic_number,chat_img )VALUES('CHATPIC'||LPAD(MEM_NO.NEXTVAL,4,0),?,?)";
	private static final String SELECT_STMT_NUMBER = "SELECT * FROM CHATPIC where chat_pic_number=?";
	
	@Override
	public ChatPicVO insertChatPic(ChatPicVO chatPicVO) {
		Connection con=null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, chatPicVO.getChat_pic_number());
			System.out.println(1);
			pstmt.setBytes(2, chatPicVO.getChat_img());
			pstmt.executeUpdate();
			System.out.println(2);
			System.out.println("聊天圖新增成功");
		}catch(Exception se) {
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}finally {

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
		return chatPicVO;
	}
	@Override
	public ChatPicVO selectChatPic(String chat_pic_number) {
		ChatPicVO chatPicVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(SELECT_STMT_NUMBER);
			pstmt.setString(1,chat_pic_number);
			rs = pstmt.executeQuery();
			System.out.println(1);
			while (rs.next()) {
				chatPicVO = new ChatPicVO();
				chatPicVO.setChat_pic_no(rs.getString("chat_pic_no"));
				chatPicVO.setChat_pic_number(rs.getString("chat_pic_number"));
				chatPicVO.setChat_img(rs.getBytes("chat_img"));
			}
			System.out.println("聊天圖查詢成功");
		}catch(Exception se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}finally {

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
		return chatPicVO;
	}
}
