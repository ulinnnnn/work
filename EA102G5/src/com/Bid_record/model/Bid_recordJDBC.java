package com.Bid_record.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Bid_recordJDBC implements IBid_record {
	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Bid_record(br_no,bp_no,mem_no,b_price,BO_StatusNo) VALUES('BR'||LPAD(br_no.NEXTVAL,4,0),?,?,?,'01')";
	private static final String GET_ONE_STMT = "SELECT *FROM Bid_record WHERE bp_no=?";
	private static final String GET_ALL_STMT = "SELECT br_no,bp_no,mem_no,b_price,b_time,bo_statusno FROM Bid_record ORDER BY br_no";	
	private static final String UPDATE = "UPDATE Bid_record set bo_statusno=?where Br_NO=?";//會員進行動作改動商品狀態
	private static final String UPDATE1 = "UPDATE Bid_record set bo_statusno=?where Bp_NO=?";


	public void insert(Bid_recordVO bid_recordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, bid_recordVO.getBp_no());
			pstmt.setString(2, bid_recordVO.getMem_no());
			pstmt.setInt(3, bid_recordVO.getB_price());
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
	public void update(Bid_recordVO bid_recordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, bid_recordVO.getBo_statusno());
			pstmt.setString(2, bid_recordVO.getBr_no());
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
	public void update1(Bid_recordVO bid_recordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE1);
			pstmt.setString(1, bid_recordVO.getBo_statusno());
			pstmt.setString(2, bid_recordVO.getBp_no());
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
	@Override
	public List<Bid_recordVO> getAll() {
		List<Bid_recordVO> list = new ArrayList<Bid_recordVO>();
		Bid_recordVO bid_recordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			// "SELECT * FROM Bid_commodity ORDER BY BP_NO
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bid_recordVO = new Bid_recordVO();
				bid_recordVO.setBr_no(rs.getString("br_no"));
				bid_recordVO.setBp_no(rs.getString("bp_no"));
				bid_recordVO.setMem_no(rs.getString("mem_no"));
				bid_recordVO.setB_price(rs.getInt("b_price"));
				bid_recordVO.setB_time(rs.getTimestamp("b_time"));
				bid_recordVO.setBo_statusno(rs.getString("bo_statusno"));
				list.add(bid_recordVO);
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
	public Bid_recordVO findByPrimaryKey(String bp_no) {
		Bid_recordVO bid_recordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, bp_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// empVO 也稱為 Domain objects
				bid_recordVO = new Bid_recordVO();
				bid_recordVO.setBr_no(rs.getString("br_no"));
				bid_recordVO.setBp_no(rs.getString("bp_no"));
				bid_recordVO.setMem_no(rs.getString("mem_no"));
				bid_recordVO.setB_price(rs.getInt("b_price"));
				bid_recordVO.setB_time(rs.getTimestamp("b_time"));
				bid_recordVO.setBo_statusno(rs.getString("bo_statusno"));
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
		return bid_recordVO;
	}
		public static void main(String[] args)  {
			Bid_recordJDBC dao = new Bid_recordJDBC();
////			// 新增
			Bid_recordVO bid_recordVO1 = new Bid_recordVO();
			bid_recordVO1.setBp_no("B0001");
			bid_recordVO1.setMem_no("M0001");
			bid_recordVO1.setB_price(1000);
			dao.insert(bid_recordVO1);
			}
////			// 依照號碼查詢

//			Bid_recordVO bid_recordVO3 = dao.findByPrimaryKey("10");
//			
//			System.out.println(bid_recordVO3.getBc_no() + ",");
//			System.out.println(bid_recordVO3.getBc_commodity() + ",");
//	
//			System.out.println("----");}
//		
//
//			// 刪除
//			dao.delete("10");}
//
//			// 查詢
//			List<Bid_recordVO> list = dao.getAll();
//			for (Bid_recordVO aBid : list) {
//				System.out.println(aBid.getBc_no() + ",");
//				System.out.println(aBid.getBc_commodity() + ",");
//				System.out.println();
//				}
//			}
			
}
