package com.resign.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ResignDAO implements ResignDAO_I {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	

	
	@Override
	public void insert(ResignVO resignVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("insert into resign (emp_no , sign_pic ,resign_time) values (? ,? ,?)");
			
			pstmt.setString(1, resignVO.getEmpNo());
			pstmt.setBytes(2, resignVO.getSignPicByte());
			pstmt.setTimestamp(3,resignVO.getResignTime());

			pstmt.executeUpdate();
			
		}catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
	
	@Override
	public void insertPic(byte[] signPic) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("insert into resign (sign_pic) values (?)");
			
			pstmt.setBytes(1, signPic);

			pstmt.executeUpdate();
			
		}catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		
	}
	
	@Override
	public List<ResignVO> getAll(){
		List<ResignVO> list = new ArrayList<ResignVO>();
		ResignVO resignVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from resign");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resignVO = new ResignVO();
				resignVO.setEmpNo(rs.getString("emp_no"));
				resignVO.setResignTime(rs.getTimestamp("resign_time"));
				list.add(resignVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public ResignVO showPic(String empNo) {
		
		ResignVO resignVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;				
				
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select sign_pic from resign where emp_no=?");
			pstmt.setString(1, empNo);
			rs = pstmt.executeQuery();
															
			if(rs.next()) {
				resignVO = new ResignVO();
				resignVO.setSignPicByte(rs.getBytes("sign_pic"));																	
			}			
							
		} catch (SQLException e) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ e.getMessage());
//		} catch (IOException e){
//			throw new RuntimeException("資料流發生錯誤 "
//					+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return resignVO;
	}	
	
//	public static void main(String[] args) {
//		ResignDAO dao = new ResignDAO();
//		
//		ResignVO resignVO = new ResignVO();
		
//		resignVO.setEmpNo("e007");
//		resignVO.setResignTime(java.sql.Timestamp.valueOf("2002-01-01 00:00:00"));
//		dao.insert(resignVO);
		
		
//		List<ResignVO> list = dao.getAll();
//		for(ResignVO r:list) {
//			System.out.println(r.getEmpNo());
//		}
//	}
}

