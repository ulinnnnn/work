package com.shop_coupon.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class CoupDAO implements CoupDAO_interface {
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
		
		private static final String INSERT_STMT = 
			"INSERT INTO shop_coupon (coup_no, coup_discount,coup_status)"
			+ " VALUES  (?,?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT coup_no,coup_discount,coup_date,coup_status,mem_no FROM shop_coupon order by coup_date";
		private static final String GET_ONE_STMT = 
			"SELECT coup_no,coup_discount,coup_date,coup_status,mem_no FROM shop_coupon where coup_no = ?";
		private static final String DELETE = 
			"DELETE FROM shop_coupon where coup_no = ?";
		private static final String UPDATE = 
			"UPDATE shop_coupon SET coup_status=?,mem_no=? where coup_no = ?";
		
		private static final String GET_MEM_COUP =
			"SELECT coup_no,coup_discount,coup_date,coup_status,mem_no FROM shop_coupon where mem_no = ?";
		private static final String GET_COUP_STATUS =
			"SELECT coup_no,coup_discount,coup_date,coup_status,mem_no FROM shop_coupon where coup_status = ?";
		private static final String UPDATE_STATUS = 
			"UPDATE shop_coupon SET coup_status=? where coup_no = ?";
		private static final String GET_CAN_USE =
			"SELECT coup_no,coup_discount,coup_date,coup_status,mem_no FROM shop_coupon where mem_no = ? AND coup_status = ?";
																
		
		@Override
		public void insert(CoupVO coupVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, coupVO.getCoupNo());
				pstmt.setDouble(2, coupVO.getCoupDiscount());
				pstmt.setString(3, coupVO.getCoupStatus());

				pstmt.executeUpdate();

				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		public void update(CoupVO coupVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);
			
				pstmt.setString(1, coupVO.getCoupStatus());
				pstmt.setString(2, coupVO.getMemNo());
				pstmt.setString(3, coupVO.getCoupNo());
			
				pstmt.executeUpdate();

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		public CoupVO findByPrimaryKey(String coup_no) {

			CoupVO coupVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, coup_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					coupVO = new CoupVO();
					coupVO.setCoupNo(rs.getString("coup_no"));
					coupVO.setCoupDiscount(rs.getDouble("coup_discount"));
					coupVO.setCoupDate(rs.getTimestamp("coup_date"));
					coupVO.setCoupStatus(rs.getString("coup_status"));
					coupVO.setMemNo(rs.getString("mem_no"));
				}

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
			return coupVO;
		}
		
		@Override
		public void delete(String coup_no) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, coup_no);

				pstmt.executeUpdate();

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		public List<CoupVO> getAll() {
			List<CoupVO> list = new ArrayList<CoupVO>();
			CoupVO coupVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// prodVO 也稱為 Domain objects
					coupVO = new CoupVO();
					coupVO.setCoupNo(rs.getString("coup_no"));
					coupVO.setCoupDiscount(rs.getDouble("coup_discount"));
					coupVO.setCoupDate(rs.getTimestamp("coup_date"));
					coupVO.setCoupStatus(rs.getString("coup_status"));
					coupVO.setMemNo(rs.getString("mem_no"));
					
					list.add(coupVO); // Store the row in the list
				}
	

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		
		@Override
		public List<CoupVO> getMemCoup(String mem_no) {
			List<CoupVO> list = new ArrayList<CoupVO>();
			CoupVO coupVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_MEM_COUP);
				
				pstmt.setString(1, mem_no);
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					coupVO = new CoupVO();
					coupVO.setCoupNo(rs.getString("coup_no"));
					coupVO.setCoupDiscount(rs.getDouble("coup_discount"));
					coupVO.setCoupDate(rs.getTimestamp("coup_date"));
					coupVO.setCoupStatus(rs.getString("coup_status"));
					coupVO.setMemNo(rs.getString("mem_no"));
					
					list.add(coupVO);
				}
	

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		
		@Override
		public List<CoupVO> getCoupStatus(String coup_status) {
			List<CoupVO> list = new ArrayList<CoupVO>();
			CoupVO coupVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_COUP_STATUS);
				
				pstmt.setString(1, coup_status);
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					coupVO = new CoupVO();
					coupVO.setCoupNo(rs.getString("coup_no"));
					coupVO.setCoupDiscount(rs.getDouble("coup_discount"));
					coupVO.setCoupDate(rs.getTimestamp("coup_date"));
					coupVO.setCoupStatus(rs.getString("coup_status"));
					coupVO.setMemNo(rs.getString("mem_no"));
					
					list.add(coupVO);
				}
	

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		
		@Override
		public void updateStatus(String coup_no, String coup_stauts) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_STATUS);
			
				pstmt.setString(1, coup_stauts);
				pstmt.setString(2, coup_no);
			
				pstmt.executeUpdate();

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		public List<CoupVO> getCanUse(String mem_no, String coup_status) {
			List<CoupVO> list = new ArrayList<CoupVO>();
			CoupVO coupVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_CAN_USE);
				
				pstmt.setString(1, mem_no);
				pstmt.setString(2, coup_status);
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					coupVO = new CoupVO();
					coupVO.setCoupNo(rs.getString("coup_no"));
					coupVO.setCoupDiscount(rs.getDouble("coup_discount"));
					coupVO.setCoupDate(rs.getTimestamp("coup_date"));
					coupVO.setCoupStatus(rs.getString("coup_status"));
					coupVO.setMemNo(rs.getString("mem_no"));
					
					list.add(coupVO);
				}
	

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
		

}
