package com.Bid_content.model;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Bid_contentJDBC implements IBid_content {

	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Bid_content(bm_no,bp_no,mem_no,br_content,br_time) VALUES('BM'||LPAD(BM_NO.NEXTVAL,4,0),?,?,?,sysdate)";
	private static final String GET_ALL_STMT = "SELECT * FROM bid_content WHERE bp_no=? ORDER BY br_time";
	private static final String GET_ALL = "SELECT *FROM bid_content  ORDER BY br_time";
	private static final String GET_ONE_STMT = "SELECT *FROM Bid_content WHERE mem_no=?";
	private static final String UPDATE = "UPDATE bid_content set br_content=? where bm_no=?";
	private static final String DELETE = "DELETE FROM Bid_content WHERE bm_no=?";
//		private Bid_contentVO bid_contentVO;

	public void insert(Bid_contentVO bid_contentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, bid_contentVO.getBp_no());
			pstmt.setString(2, bid_contentVO.getMem_no());
			pstmt.setString(3, bid_contentVO.getBr_content());
			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			// Clean up JDBC resources
			System.out.println(se.getMessage());
		} finally {
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

	public void delete(String bm_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, bm_no);		
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	public void update(Bid_contentVO bid_contentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, bid_contentVO.getBr_content());
			pstmt.setString(2, bid_contentVO.getBm_no());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	
	public List<Bid_contentVO> getcontentAll(String bp_no) {
		List<Bid_contentVO> list = new ArrayList<Bid_contentVO>();
		Bid_contentVO bid_contentVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			pstmt.setString(1, bp_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
					// empVO 也稱為 Domain objects
					bid_contentVO = new Bid_contentVO();
					bid_contentVO.setBm_no(rs.getString("bm_no"));
					bid_contentVO.setMem_no(rs.getString("mem_no"));
					bid_contentVO.setBr_content(rs.getString("br_content"));
					bid_contentVO.setBr_time(rs.getTimestamp("br_time"));
					list.add(bid_contentVO);
				}
								
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
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
		return list;
	}

	public List<Bid_contentVO> getAll() {
		List<Bid_contentVO> list = new ArrayList<Bid_contentVO>();
		Bid_contentVO bid_contentVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
					// empVO 也稱為 Domain objects
					bid_contentVO = new Bid_contentVO();
					bid_contentVO.setBm_no(rs.getString("bm_no"));
					bid_contentVO.setBp_no(rs.getString("bp_no"));
					bid_contentVO.setMem_no(rs.getString("mem_no"));
					bid_contentVO.setBr_content(rs.getString("br_content"));
					bid_contentVO.setBr_time(rs.getTimestamp("br_time"));
					list.add(bid_contentVO);
				}
								
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
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
		return list;
	}
	
	@Override
	public Bid_contentVO findByPrimaryKey(String bm_no) {
		Bid_contentVO bid_contentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, bm_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// empVO 也稱為 Domain objects
				bid_contentVO = new Bid_contentVO();
				bid_contentVO.setBp_no(rs.getString("bp_no"));
				bid_contentVO.setBr_content(rs.getString("br_content"));
				bid_contentVO.setBr_time(rs.getTimestamp("br_time"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return bid_contentVO;
	}



//		public static void main(String[] args) throws IOException {
//			Bid_contentJDBC dao = new Bid_contentJDBC();
//		// 新增
//			Bid_contentVO bid_contentVO1 = new Bid_contentVO();
//			bid_contentVO1.setBp_no("B0001");	
//			bid_contentVO1.setMem_no("M0001");		
//			bid_contentVO1.setBr_content("==");
//			dao.insert(bid_contentVO1);
//			}
////			// 依照號碼查詢

//			Bid_contentVO bid_contentVO3 = dao.getcontentAll("B0001");
//			
//			System.out.println(bid_contentVO3.getBp_no() + ",");
//			System.out.println(bid_contentVO3.getMem_no() + ",");
//	
//			System.out.println("----");}
//		List<Bid_contentVO> list = dao.getcontentAll("B0001");
//		for (Bid_contentVO aBid : list) {
//		System.out.println(aBid.getBp_no() + ",");
//		System.out.println(aBid.getMem_no() + ",");
//		System.out.println(aBid.getBr_content() + ",");
//	}}
//	}
//
//			// 刪除
//			dao.delete("10");}
//
//			// 查詢
			 
			
}
