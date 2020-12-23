package com.Bid_commodity_Report.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Bid_commodity_Report.model.Bid_commodity_ReportVO;

public class Bid_commodity_ReportJDBC implements IBid_commodity_Report {
	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO Bid_commodity_REPORT(bre_no,mem_no,bp_no,br_project,br_content,br_time,bap_status) VALUES('BRE'||LPAD(BRE_NO.NEXTVAL,4,0),?,?,?,?,SYSDATE,'0'||LPAD(1,1,0))";
	private static final String GET_ALL_STMT = "SELECT bre_no,mem_no,bp_no,br_project,br_content,br_time,bap_status FROM Bid_commodity_REPORT ORDER BY bre_no";
	private static final String GET_ONE_STMT = "SELECT *FROM Bid_commodity_REPORT WHERE bap_status=?";
	private static final String GET_ALL = "SELECT * FROM Bid_commodity_REPORT WHERE mem_no=? and bap_status=?";
	private static final String UPDATE = "UPDATE Bid_commodity_REPORT set bap_status=? where bre_no=?";

	public void insert(Bid_commodity_ReportVO Bid_commodity_ReportVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, Bid_commodity_ReportVO.getMem_no());
			pstmt.setString(2, Bid_commodity_ReportVO.getBp_no());
			pstmt.setString(3, Bid_commodity_ReportVO.getBr_project());
			pstmt.setString(4, Bid_commodity_ReportVO.getBr_content());		

			pstmt.executeUpdate();
			// Handle any driver errors
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
	public void update(Bid_commodity_ReportVO Bid_commodity_ReportVO) {//後台更新狀態
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);			
			pstmt.setString(1, Bid_commodity_ReportVO.getBap_status());
			pstmt.setString(2, Bid_commodity_ReportVO.getBre_no());
			pstmt.executeUpdate();

		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
			se.printStackTrace();
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
	public Bid_commodity_ReportVO findByPrimaryKey(String mem_no,Integer bap_status) {//會員自己查申訴中的事件
		Bid_commodity_ReportVO Bid_commodity_ReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			pstmt.setString(1, mem_no);
			pstmt.setInt(2, bap_status);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				Bid_commodity_ReportVO = new Bid_commodity_ReportVO();
				Bid_commodity_ReportVO.setBre_no(rs.getString("bre_no"));
				Bid_commodity_ReportVO.setMem_no(rs.getString("mem_no"));
				Bid_commodity_ReportVO.setBp_no(rs.getString("bp_no"));
				Bid_commodity_ReportVO.setBr_project(rs.getString("br_project"));
				Bid_commodity_ReportVO.setBr_content(rs.getString("br_content"));
				Bid_commodity_ReportVO.setBr_time(rs.getTimestamp("br_time"));
				Bid_commodity_ReportVO.setBap_status(rs.getString("bap_status"));			
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
		return Bid_commodity_ReportVO;
	}
	
	@Override
	public List<Bid_commodity_ReportVO> getAll() {
		List<Bid_commodity_ReportVO> list = new ArrayList<Bid_commodity_ReportVO>();
		Bid_commodity_ReportVO bid_commodity_ReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			// "SELECT * FROM Bid_commodity ORDER BY BP_NO
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bid_commodity_ReportVO = new Bid_commodity_ReportVO();
				bid_commodity_ReportVO.setBre_no(rs.getString("bre_no"));
				bid_commodity_ReportVO.setMem_no(rs.getString("mem_no"));
				bid_commodity_ReportVO.setBp_no(rs.getString("bp_no"));
				bid_commodity_ReportVO.setBr_project(rs.getString("br_project"));
				bid_commodity_ReportVO.setBr_content(rs.getString("br_content"));
				bid_commodity_ReportVO.setBr_time(rs.getTimestamp("br_time"));
				bid_commodity_ReportVO.setBap_status(rs.getString("bap_status"));
				list.add(bid_commodity_ReportVO);
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
	public List<Bid_commodity_ReportVO> findByKey(Integer bap_status) {//後台用狀態瑪找申訴
		List<Bid_commodity_ReportVO> list = new ArrayList<Bid_commodity_ReportVO>();
		Bid_commodity_ReportVO Bid_commodity_ReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, bap_status);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// empVO 也稱為 Domain objects
				Bid_commodity_ReportVO = new Bid_commodity_ReportVO();
				Bid_commodity_ReportVO.setBre_no(rs.getString("bre_no"));
				Bid_commodity_ReportVO.setMem_no(rs.getString("mem_no"));
				Bid_commodity_ReportVO.setBp_no(rs.getString("bp_no"));
				Bid_commodity_ReportVO.setBr_project(rs.getString("br_project"));
				Bid_commodity_ReportVO.setBr_content(rs.getString("br_content"));
				Bid_commodity_ReportVO.setBr_time(rs.getTimestamp("br_time"));
				Bid_commodity_ReportVO.setBap_status(rs.getString("bap_status"));				
			
				list.add(Bid_commodity_ReportVO);
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
		return list;
	}


	
//	public static void main(String[] args) {
//		Bid_commodity_ReportJDBC dao = new Bid_commodity_ReportJDBC();
//		// 新增
//		Bid_commodity_ReportVO bid_commodity_ReportVO1 = new Bid_commodity_ReportVO();
//		bid_commodity_ReportVO1.setMem_no("M0001");
//		bid_commodity_ReportVO1.setBp_no("B0002");
//		bid_commodity_ReportVO1.setBr_project("商品不符");
//		bid_commodity_ReportVO1.setBr_content("寄過來的商品跟原本照片的完全不一樣");
//		bid_commodity_ReportVO1.setBap_status(01);
//		dao.insert(bid_commodity_ReportVO1);}

		// 依照號碼查詢
//		Bid_commodity_ReportVO bid_commodity_ReportVO3 = dao.findByKey(1);
//		System.out.println(bid_commodity_ReportVO3.getBre_no() + ",");
//		System.out.println(bid_commodity_ReportVO3.getMem_no() + ",");
//
//		System.out.println("----");
	

//	List<Bid_commodity_ReportVO> list = dao.findByKey(1);
//	for (Bid_commodity_ReportVO aBid : list) {
//	System.out.println(aBid.getBre_no() + ",");
//	System.out.println(aBid.getMem_no() + ",");
//	System.out.println(aBid.getBr_content() + ",");
//
//	System.out.println("----");}
//		List<Bid_commodity_ReportVO> list = dao.getAll();
//		for (Bid_commodity_ReportVO aBid : list) {
//			System.out.println(aBid.getBre_no() + ",");
//			System.out.println(aBid.getMem_no() + ",");
//			System.out.println(aBid.getBp_no() + ",");
//			System.out.println(aBid.getBr_project() + ",");
//			System.out.println(aBid.getBr_content() + ",");
//			System.out.println(aBid.getBr_time() + ",");
//			System.out.println(aBid.getBap_status() + ",");
//			System.out.println();
//			}

//		
//	Bid_commodity_ReportVO bid_commodity_ReportVO4 = new Bid_commodity_ReportVO();
//	bid_commodity_ReportVO4.setBre_no("BRE0001");	
//	bid_commodity_ReportVO4.setBap_status(2);
//	dao.update(bid_commodity_ReportVO4);
	
		// 刪除
//

	}
//	}
//}

