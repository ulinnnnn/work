package com.Bid_commodity_track.model;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_commodity_track.model.Bid_commodity_trackVO;
public class Bid_commodity_trackJDBC implements IBid_commodity_track{
	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
		private static final String INSERT_STMT = "INSERT INTO Bid_commodity_track(MEM_No,BP_No,bp_stat) VALUES(?,?,'1')";
		private static final String GET_ONE_STMT = "SELECT *FROM Bid_commodity_track ORDER BY BP_NO";
		private static final String GET_ONE = "SELECT * FROM Bid_commodity_track WHERE BP_No=? AND MEM_no=?";
		private static final String DELETE = "DELETE FROM Bid_commodity_track WHERE BP_No=? AND MEM_no=?";
		private static final String UPDATEstat = "UPDATE Bid_commodity_track set bp_stat='0' where bp_no=? AND mem_no=?";
//			private Bid_commodityVO bid_commodityVO;
		public void insert(Bid_commodity_trackVO bid_commodity_trackVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			System.out.println(24);
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);
				pstmt.setString(1, bid_commodity_trackVO.getMem_no());
				pstmt.setString(2, bid_commodity_trackVO.getBp_no());
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

		public void delete(String bp_no,String mem_no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);
				pstmt.setString(1, bp_no);	
				pstmt.setString(2, mem_no);
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
		public List<Bid_commodity_trackVO> getAll(){
			List<Bid_commodity_trackVO> list = new ArrayList<Bid_commodity_trackVO>();
			Bid_commodity_trackVO bid_commodity_trackVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					// empVO 也稱為 Domain objects
					bid_commodity_trackVO = new Bid_commodity_trackVO();
					bid_commodity_trackVO.setMem_no(rs.getString("mem_no"));
					bid_commodity_trackVO.setBp_no(rs.getString("bp_no"));
					list.add(bid_commodity_trackVO);	
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
		public void updatestat(Bid_commodity_trackVO Bid_commodity_trackVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATEstat);
				pstmt.setString(1,Bid_commodity_trackVO.getBp_stat());
				pstmt.setString(2,Bid_commodity_trackVO.getBp_no());
				pstmt.setString(3,Bid_commodity_trackVO.getMem_no());
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
		public Bid_commodity_trackVO get_one(String bp_no,String mem_no) {
			Bid_commodity_trackVO bid_commodity_trackVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE);
				pstmt.setString(1, bp_no);
				pstmt.setString(2, mem_no);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					// empVO 也稱為 Domain objects						
					bid_commodity_trackVO = new Bid_commodity_trackVO();
					bid_commodity_trackVO.setBp_no(rs.getString("bp_no"));
					bid_commodity_trackVO.setBp_stat(rs.getString("bp_stat"));	
					bid_commodity_trackVO.setMem_no(rs.getString("mem_no"));

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
			return bid_commodity_trackVO;
		}	
//			public static void main(String[] args) throws IOException {
//				Bid_commodity_trackJDBC dao = new Bid_commodity_trackJDBC();
//////				// 新增
//				Bid_commodity_trackVO bid_commodity_trackVO1 = new Bid_commodity_trackVO();
//				bid_commodity_trackVO1.setMem_no("M0001");
//				bid_commodity_trackVO1.setBp_no("B0002");		
//				dao.insert(bid_commodity_trackVO1);
//				}
////				// 依照會員號碼查詢
//				Bid_commodity_trackVO bid_commodity_trackVO3 = dao.findByPrimaryKey("M0001");			
//				System.out.println(bid_commodity_trackVO3.getMem_no() + ",");
//				System.out.println(bid_commodity_trackVO3.getBp_no() + ",");
//		
//				System.out.println("----");}
			
	//
//				// 刪除
//				dao.delete("B0001","M0001");}
	//
//				// 查詢
//				List<Bid_commodity_trackVO> list = dao.getAll();
//				for (Bid_commodity_trackVO aBid : list) {
//					System.out.println(aBid.getBc_no() + ",");
//					System.out.println(aBid.getBc_commodity() + ",");
//					System.out.println();
//					}
//				}
				
	}



