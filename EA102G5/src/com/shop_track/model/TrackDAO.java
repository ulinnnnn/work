package com.shop_track.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class TrackDAO implements TrackDAO_interface {
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
			"INSERT INTO shop_track (mem_no, prod_no)"
			+ " VALUES  (?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT mem_no,prod_no FROM shop_track order by mem_no = ?";
		private static final String GET_ONE_STMT = 
			"SELECT mem_no,prod_no FROM shop_track where mem_no = ? AND prod_no=?";
		private static final String DELETE = 
			"DELETE FROM shop_track where mem_no = ? AND prod_no=?";
		private static final String UPDATE = 
			"UPDATE mem_no=?,prod_no=? where mem_no = ? AND prod_no = ?";
		
		private static final String Find_TRACK_STMT = 
			"SELECT mem_no,prod_no FROM shop_track where mem_no = ?";
																
		
		@Override
		public void insert(TrackVO trackVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, trackVO.getMemNo());
				pstmt.setString(2, trackVO.getProdNo());

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
		public void update(TrackVO trackVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);
				
				pstmt.setString(1, trackVO.getMemNo());
				pstmt.setString(2, trackVO.getProdNo());
				pstmt.setString(3, trackVO.getMemNo());
				pstmt.setString(4, trackVO.getProdNo());

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
		public TrackVO findByPrimaryKey(String mem_no, String prod_no) {

			TrackVO trackVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, mem_no);
				pstmt.setString(2, prod_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					trackVO = new TrackVO();
					trackVO.setMemNo(rs.getString("mem_no"));
					trackVO.setProdNo(rs.getString("prod_no"));
					
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
			return trackVO;
		}
		
		@Override
		public void deleteTrack(TrackVO trackVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, trackVO.getMemNo());
				pstmt.setString(2, trackVO.getProdNo());
				

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
		public List<TrackVO> getAll() {
			List<TrackVO> list = new ArrayList<TrackVO>();
			TrackVO trackVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();
//
				while (rs.next()) {
					// prodVO 也稱為 Domain objects
					trackVO = new TrackVO();
					trackVO.setMemNo(rs.getString("mem_no"));
					trackVO.setProdNo(rs.getString("prod_no"));
					
					list.add(trackVO); // Store the row in the list
				}
//				System.out.println(prodVO.getProdName());

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
		public List<TrackVO> getMemTrack(String mem_no) {
			List<TrackVO> list = new ArrayList<TrackVO>();
			TrackVO trackVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(Find_TRACK_STMT);
				
				pstmt.setString(1, mem_no);
				
				
				rs = pstmt.executeQuery();
//
				while (rs.next()) {
					// trackVO 也稱為 Domain objects
					trackVO = new TrackVO();
					trackVO.setMemNo(rs.getString("mem_no"));
					trackVO.setProdNo(rs.getString("prod_no"));
					
					list.add(trackVO); // Store the row in the list
				}
//				System.out.println(prodVO.getProdName());

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
