package com.Bid_commodity_no.model;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Bid_commodity_noJDBC implements IBid_commodity_no {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO Bid_commodity_no(BC_No,BC_COMMODITY) VALUES(?,?)";
	private static final String GET_ALL_STMT = "SELECT bc_no,bc_commodity FROM Bid_commodity_no ORDER BY bc_no";
	private static final String GET_ONE_STMT = "SELECT *FROM Bid_commodity_no WHERE bc_no=?";
	private static final String UPDATE = "UPDATE Bid_commodity_no set Bc_commodity=?where Bc_NO=?";
	private static final String DELETE = "DELETE FROM Bid_commodity_no WHERE bc_no=?";
//		private Bid_commodityVO bid_commodityVO;

	public void insert(Bid_commodity_noVO bid_commodity_noVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, bid_commodity_noVO.getBc_no());
			pstmt.setString(2, bid_commodity_noVO.getBc_commodity());
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

	public void delete(String bc_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, bc_no);		
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

	public void update(Bid_commodity_noVO bid_commodity_noVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, bid_commodity_noVO.getBc_no());
			pstmt.setString(2, bid_commodity_noVO.getBc_commodity());
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
	public List<Bid_commodity_noVO> getAll() {
		List<Bid_commodity_noVO> list = new ArrayList<Bid_commodity_noVO>();
		Bid_commodity_noVO bid_commodity_noVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			// "SELECT * FROM Bid_commodity ORDER BY BP_NO
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bid_commodity_noVO = new Bid_commodity_noVO();
				bid_commodity_noVO.setBc_no(rs.getString("bc_no"));
				bid_commodity_noVO.setBc_commodity(rs.getString("bc_commodity"));
				list.add(bid_commodity_noVO);
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
	public Bid_commodity_noVO findByPrimaryKey(String bc_no) {
		Bid_commodity_noVO bid_commodity_noVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, bc_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// empVO 也稱為 Domain objects
				bid_commodity_noVO = new Bid_commodity_noVO();
				bid_commodity_noVO.setBc_no(rs.getString("bc_no"));
				bid_commodity_noVO.setBc_commodity(rs.getString("bc_commodity"));
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
		return bid_commodity_noVO;
	}


//		public static void main(String[] args) throws IOException {
//			Bid_commodity_noJDBC dao = new Bid_commodity_noJDBC();
////			// 新增
//			Bid_commodity_noVO bid_commodity_noVO1 = new Bid_commodity_noVO();
//			bid_commodity_noVO1.setBc_no("10");
//			bid_commodity_noVO1.setBc_commodity("模型類");		
//			dao.insert(bid_commodity_noVO1);
//			}
////			// 依照號碼查詢

//			Bid_commodity_noVO bid_commodity_noVO3 = dao.findByPrimaryKey("10");
//			
//			System.out.println(bid_commodity_noVO3.getBc_no() + ",");
//			System.out.println(bid_commodity_noVO3.getBc_commodity() + ",");
//	
//			System.out.println("----");}
//		
//
//			// 刪除
//			dao.delete("10");}
//
//			// 查詢
//			List<Bid_commodity_noVO> list = dao.getAll();
//			for (Bid_commodity_noVO aBid : list) {
//				System.out.println(aBid.getBc_no() + ",");
//				System.out.println(aBid.getBc_commodity() + ",");
//				System.out.println();
//				}
//			}
			
}
