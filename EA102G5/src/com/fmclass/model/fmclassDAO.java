package com.fmclass.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class fmclassDAO implements fmclassDAO_I {
//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String userid = "EA102G5";
//	String userpsd = "123456";
	
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
	public void insert(fmclassVO fmclassVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"insert into fmclass (fmcl_no, fmcl_na) "
					+ "values (('f' || lpad(fmcl_no.NEXTVAL,3,'0')),?)"
					);
				
			pstmt.setString(1, fmclassVO.getfmcl_na());
			
			pstmt.executeUpdate();

			

		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());		
		} finally {
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
	}

	@Override
	public void update(fmclassVO fmclassVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"update fmclass set fmcl_na=? where fmcl_no=?"
					);

			pstmt.setString(1, fmclassVO.getfmcl_na());
			
			pstmt.setString(2, fmclassVO.getfmcl_no());
			
			pstmt.executeUpdate();

			
			
		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());		
		} finally {
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
	}
	
	@Override
	public void delete(String fmclassVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"delete from fmclass where fmcl_no = ?"
					);

			pstmt.setString(1, fmclassVO);
			
			pstmt.executeUpdate();

			
		
		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());		
		} finally {
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
	}
	
	@Override
	public fmclassVO getOne(String fmcl_no) {
		fmclassVO fmclassVO = new fmclassVO();;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select fmcl_no, fmcl_na from fmclass where fmcl_no=?"
					);

			pstmt.setString(1, fmcl_no);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
			
				fmclassVO.setfmcl_no(rs.getString("fmcl_no"));
				fmclassVO.setfmcl_na(rs.getString("fmcl_na"));
			}
	
		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());		
		} finally {
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
		return fmclassVO;
	}
	
	@Override
	public List<fmclassVO> getAll(){
		List<fmclassVO> list = new ArrayList<fmclassVO>();
		
//		FuncVO funcVO = new FuncVO();
		fmclassVO fmclassVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select * from fmclass"
					);
	
			rs = pstmt.executeQuery();

			while(rs.next()) {
				fmclassVO = new fmclassVO();
				fmclassVO.setfmcl_no(rs.getString("fmcl_no"));
				fmclassVO.setfmcl_na(rs.getString("fmcl_na"));
			    list.add(fmclassVO);
			}
			
	
		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());		
		} finally {
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
	
	
	public static void main(String[] args) {
		fmclassDAO dao = new fmclassDAO();
		
//		//新增測試
//		fmclassVO fmclassVO1 = new fmclassVO();
//		
//		fmclassVO1.setfmcl_na("安安");
//		dao.insert(fmclassVO1);
		
//		//修改測試
//		fmclassVO fmarticleVO2 = new fmclassVO();
//		fmarticleVO2.setfmcl_no("f005");
//		fmarticleVO2.setfmcl_na("嗨嗨");
//		dao.update(fmarticleVO2);
		
//		//刪除測試
//		dao.delete("f005");
				
//		//查詢單筆		
//		fmarticleVO fmarticleVO3 = dao.getOne("f003");
//		System.out.println(fmarticleVO3.getfm_head());
//		System.out.println(fmarticleVO3.getfm_text());
//		
//		//查詢全部
//		List<fmclassVO> list1 = dao.getAll();
//		for(fmclassVO funcV : list1) {
//			System.out.println(funcV.getfmcl_no());
//			System.out.println(funcV.getfmcl_na());
//		}
				
	}
}
