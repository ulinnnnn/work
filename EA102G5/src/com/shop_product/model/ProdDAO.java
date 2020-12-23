package com.shop_product.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ProdDAO implements ProdDAO_interface {
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
			"INSERT INTO shop_product (prod_no,prod_name,prod_price,prod_brand,"
			+ "prod_intro,category_no,prod_status,prod_photo)"
			+ " VALUES  ('p' || LPAD (SEQ_PROD_NO.NEXTVAL,3,'0'),?,?,?,?,?,?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT prod_no,prod_name,prod_price,prod_brand,prod_photo, prod_date"
			+ ",prod_intro,prod_status,category_no,prod_photo FROM shop_product order by prod_no";
		private static final String GET_ONE_STMT = 
			"SELECT prod_no,prod_name,prod_price,prod_brand,prod_photo, prod_date"
			+ ",prod_intro,prod_status,category_no FROM shop_product where prod_no = ?";
		private static final String DELETE = 
			"DELETE FROM shop_product where prod_no = ?";
		private static final String UPDATE = 
			"UPDATE shop_product set prod_no=?, prod_name=?, prod_price=?, prod_brand=?, " 
			+ "prod_intro=?,category_no=?, prod_status=?,prod_photo=? where prod_no = ?";
		private static final String GET_CATEGORY_PROD = 
			"SELECT prod_no,prod_name,prod_price,prod_brand,prod_photo, prod_date,prod_intro,"
			+ "prod_status,category_no,prod_photo FROM shop_product where category_no = ? order by prod_no";
		private static final String UPDATE_STATUS = 
			"UPDATE shop_product set prod_status=? where prod_no = ?";
		private static final String INSERT_PCHOME = 
			"INSERT INTO shop_product (prod_no,prod_name,prod_price,prod_brand,"
			+ "prod_intro,category_no,prod_status,prod_photo)"
			+ " VALUES  ('p' || LPAD (SEQ_PROD_NO.NEXTVAL,3,'0'),?,?,?,?,?,?,EMPTY_BLOB())";
																	
		
		@Override
		public void insert(ProdVO prodVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, prodVO.getProdName());
				pstmt.setDouble(2, prodVO.getProdPrice());
				pstmt.setString(3, prodVO.getProdBrand());
				pstmt.setString(4, prodVO.getProdIntro());
				pstmt.setString(5, prodVO.getCategoryNo());
				pstmt.setString(6, prodVO.getProdStatus());
				pstmt.setBytes(7, prodVO.getProdPhoto());

				pstmt.executeUpdate();

				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
//			}	catch (IOException ie) {
//					ie.printStackTrace(System.err);
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
		public void update(ProdVO prodVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setString(1, prodVO.getProdNo());
				pstmt.setString(2, prodVO.getProdName());
				pstmt.setDouble(3, prodVO.getProdPrice());
				pstmt.setString(4, prodVO.getProdBrand());
				pstmt.setString(5, prodVO.getProdIntro());
				pstmt.setString(6, prodVO.getCategoryNo());
				pstmt.setString(7, prodVO.getProdStatus());
				pstmt.setBytes(8, prodVO.getProdPhoto());
				
				pstmt.setString(9, prodVO.getProdNo());

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
		public void delete(String prod_no) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);
		
				pstmt.setString(1, prod_no);

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
		public ProdVO findByPrimaryKey(String prod_no) {

			ProdVO prodVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, prod_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// prodVo 也稱為 Domain objects
					prodVO = new ProdVO();
					prodVO.setProdNo(rs.getString("prod_no"));
					prodVO.setProdName(rs.getString("prod_name"));
					prodVO.setProdPrice(rs.getDouble("prod_price"));
					prodVO.setProdBrand(rs.getString("prod_brand"));
					prodVO.setProdDate(rs.getTimestamp("prod_date"));
					prodVO.setProdIntro(rs.getString("prod_intro"));
					prodVO.setCategoryNo(rs.getString("category_no"));
					prodVO.setProdStatus(rs.getString("prod_status"));
					prodVO.setProdPhoto(rs.getBytes("prod_photo"));
				}

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
//			} catch (IOException ie) {
//				System.out.println(ie);
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
			return prodVO;
		}
		
		
		@Override
		public List<ProdVO> getAll() {
			List<ProdVO> list = new ArrayList<ProdVO>();
			ProdVO prodVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// prodVO 也稱為 Domain objects
					prodVO = new ProdVO();
					prodVO.setProdNo(rs.getString("prod_no"));
					prodVO.setProdName(rs.getString("prod_name"));
					prodVO.setProdPrice(rs.getDouble("prod_price"));
					prodVO.setProdBrand(rs.getString("prod_brand"));
					prodVO.setProdDate(rs.getTimestamp("prod_date"));
					prodVO.setProdIntro(rs.getString("prod_intro"));
					prodVO.setProdStatus(rs.getString("prod_status"));
					prodVO.setCategoryNo(rs.getString("category_no"));
					prodVO.setProdPhoto(rs.getBytes("prod_photo"));
					list.add(prodVO); // Store the row in the list
				}
//				System.out.println(prodVO.getProdName());

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
//			} catch (IOException ie) {
//				System.out.println(ie);
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
		public List<ProdVO> getCategoryProd(String category_no) {
			List<ProdVO> list = new ArrayList<ProdVO>();
			ProdVO prodVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_CATEGORY_PROD);
				pstmt.setString(1, category_no);
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// prodVO 也稱為 Domain objects
					prodVO = new ProdVO();
					prodVO.setProdNo(rs.getString("prod_no"));
					prodVO.setProdName(rs.getString("prod_name"));
					prodVO.setProdPrice(rs.getDouble("prod_price"));
					prodVO.setProdBrand(rs.getString("prod_brand"));
					prodVO.setProdDate(rs.getTimestamp("prod_date"));
					prodVO.setProdIntro(rs.getString("prod_intro"));
					prodVO.setProdStatus(rs.getString("prod_status"));
					prodVO.setCategoryNo(rs.getString("category_no"));
					prodVO.setProdPhoto(rs.getBytes("prod_photo"));
					list.add(prodVO); // Store the row in the list
				}
//				System.out.println(prodVO.getProdName());

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
//			} catch (IOException ie) {
//				System.out.println(ie);
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
		public void updateStatus(String prod_no, String prod_status) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_STATUS);

				pstmt.setString(1, prod_status);
				pstmt.setString(2, prod_no);

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
		
		public void insertPchome(ProdVO prodVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_PCHOME);

				pstmt.setString(1, prodVO.getProdName());
				pstmt.setDouble(2, prodVO.getProdPrice());
				pstmt.setString(3, prodVO.getProdBrand());
				pstmt.setString(4, prodVO.getProdIntro());
				pstmt.setString(5, prodVO.getCategoryNo());
				pstmt.setString(6, prodVO.getProdStatus());

				pstmt.executeUpdate();

				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
//			}	catch (IOException ie) {
//					ie.printStackTrace(System.err);
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

}
