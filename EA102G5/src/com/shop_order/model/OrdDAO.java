package com.shop_order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop_item.model.*;


public class OrdDAO implements OrdDAO_interface {
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
			"INSERT INTO shop_order (ord_no,ord_status,ord_name,"
			+ "ord_address,ord_phone,ord_mail,mem_no,emp_no,ord_coup)"
			+ " VALUES  ('ord' || LPAD (SEQ_ORD_NO.NEXTVAL,3,'0'),?,?,?,?,?,?,?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT ord_no,ord_status,ord_date,ord_name,ord_code,ord_city,ord_section,ord_address, ord_phone"
			+ ",ord_mail,mem_no,emp_no,ord_coup,ord_price FROM shop_order order by ord_no";
		private static final String GET_ONE_STMT = 
			"SELECT ord_no,ord_status,ord_date,mem_no,emp_no,ord_price,ord_name"
			+ ", ord_phone,ord_mail,ord_code,ord_city,ord_section,ord_address,ord_coup FROM shop_order where ord_no = ?";
		private static final String DELETE = 
			"DELETE FROM shop_order where ord_no = ?";
		private static final String UPDATE = 
			"UPDATE shop_order set ord_status=? where ord_no = ?";
		private static final String GET_ORDNO_STMT = 
			"SELECT ord_no FROM shop_order where mem_no = ? AND ord_status = ?";
		
		private static final String GET_MEM_ORD = 
			"SELECT ord_no,ord_status,ord_date,ord_name,ord_address, ord_phone"
			+ ",ord_mail,mem_no,emp_no,ord_price,ord_coup FROM shop_order where mem_no = ?";
		
		private static final String INSERT_WITH_ITEM = 
			"INSERT INTO shop_order (ord_no,ord_status,mem_no,emp_no,ord_price"
			+ ",ord_name,ord_phone,ord_mail,ord_code,ord_city,ord_section,ord_address,ord_coup)"
			+ " VALUES  ('ord' || LPAD (SEQ_ORD_NO.NEXTVAL,3,'0'),?,?,?,?,?,?,?,?,?,?,?,?)";
		private static final String GET_ORD_STATUS = 
			"SELECT ord_no,ord_status,ord_date,ord_name,ord_code,ord_city,ord_section,ord_address, ord_phone"
			+ ",ord_mail,mem_no,emp_no,ord_coup,ord_price FROM shop_order where ord_status = ?";
																
		
		@Override
		public void insert(OrdVO ordVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, ordVO.getOrdStatus());
				pstmt.setString(2, ordVO.getOrdName());
				pstmt.setString(3, ordVO.getOrdAddress());
				pstmt.setString(4, ordVO.getOrdPhone());
				pstmt.setString(5, ordVO.getOrdMail());
				pstmt.setString(6, ordVO.getMemNo());
				pstmt.setString(7, ordVO.getEmpNo());
				pstmt.setString(8, ordVO.getOrdCoup());

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
		public void updateStatus(OrdVO ordVO) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);
//				System.out.println(ordVO.getOrdStatus());
//				System.out.println(ordVO.getOrdNo());
				
			 	pstmt.setString(1, ordVO.getOrdStatus());
			 	pstmt.setString(2, ordVO.getOrdNo());

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
		public OrdVO findByPrimaryKey(String ord_no) {

			OrdVO ordVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, ord_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					ordVO = new OrdVO();
					ordVO.setOrdNo(rs.getString("ord_no"));
					ordVO.setOrdStatus(rs.getString("ord_status"));
					ordVO.setOrdDate(rs.getTimestamp("ord_date"));
					ordVO.setMemNo(rs.getString("mem_no"));
					ordVO.setEmpNo(rs.getString("emp_no"));
					ordVO.setOrdPrice(rs.getNString("ord_price"));
					ordVO.setOrdName(rs.getString("ord_name"));
					ordVO.setOrdPhone(rs.getString("ord_phone"));
					ordVO.setOrdMail(rs.getString("ord_mail"));
					ordVO.setOrdCode(rs.getString("ord_code"));
					ordVO.setOrdCity(rs.getString("ord_city"));
					ordVO.setOrdSection(rs.getString("ord_section"));
					ordVO.setOrdAddress(rs.getString("ord_address"));
					ordVO.setOrdCoup(rs.getString("ord_coup"));
					
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
			return ordVO;
		}
		
		@Override
		public void delete(String ord_no) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, ord_no);

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
		public List<OrdVO> getAll() {
			List<OrdVO> list = new ArrayList<OrdVO>();
			OrdVO ordVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();
//
				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					ordVO = new OrdVO();
					ordVO.setOrdNo(rs.getString("ord_no"));
					ordVO.setOrdStatus(rs.getString("ord_status"));
					ordVO.setOrdDate(rs.getTimestamp("ord_date"));
					ordVO.setOrdName(rs.getString("ord_name"));
					ordVO.setOrdCode(rs.getString("ord_code"));
					ordVO.setOrdCity(rs.getString("ord_city"));
					ordVO.setOrdSection(rs.getString("ord_section"));
					ordVO.setOrdAddress(rs.getString("ord_address"));
					ordVO.setOrdPhone(rs.getString("ord_phone"));
					ordVO.setOrdMail(rs.getString("ord_mail"));
					ordVO.setMemNo(rs.getString("mem_no"));
					ordVO.setEmpNo(rs.getString("emp_no"));
					ordVO.setOrdCoup(rs.getString("ord_coup"));
					ordVO.setOrdPrice(rs.getString("ord_price"));
					list.add(ordVO); // Store the row in the list
				}
//				System.out.println(list);

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
		public OrdVO findOrdNo(String mem_no) {
			
			OrdVO ordVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ORDNO_STMT);
				

				pstmt.setString(1, mem_no);
				pstmt.setString(2, "未付款");

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					ordVO = new OrdVO();
					ordVO.setOrdNo(rs.getString("ord_no"));
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
			return ordVO;
		}
		
		@Override
		public List<OrdVO> getMemOrd(String mem_no) {

			List<OrdVO> list = new ArrayList<OrdVO>();
			OrdVO ordVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_MEM_ORD);
				
				pstmt.setString(1, mem_no);
				
				rs = pstmt.executeQuery();
//
				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					ordVO = new OrdVO();
					ordVO.setOrdNo(rs.getString("ord_no"));
					ordVO.setOrdStatus(rs.getString("ord_status"));
					ordVO.setOrdDate(rs.getTimestamp("ord_date"));
					ordVO.setOrdName(rs.getString("ord_name"));
					ordVO.setOrdAddress(rs.getString("ord_address"));
					ordVO.setOrdPhone(rs.getString("ord_phone"));
					ordVO.setOrdMail(rs.getString("ord_mail"));
					ordVO.setMemNo(rs.getString("mem_no"));
					ordVO.setEmpNo(rs.getString("emp_no"));
					ordVO.setOrdPrice(rs.getString("ord_price"));
					ordVO.setOrdCoup(rs.getString("ord_coup"));
					
					list.add(ordVO); // Store the row in the list
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
		
		public String insertWithItem(OrdVO ordVO, List<ItemVO> list) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String next_ord_no = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_WITH_ITEM);
				
				// 1.設定於 pstm.executeUpdate()之前
	    		con.setAutoCommit(false);
	    		
	    		//先新增訂單
	    		String cols[] = {"ORD_NO"};
	    		pstmt = con.prepareStatement(INSERT_WITH_ITEM , cols);
	    		
	    		pstmt.setString(1, ordVO.getOrdStatus());
				pstmt.setString(2, ordVO.getMemNo());
				pstmt.setString(3, ordVO.getEmpNo());
				pstmt.setString(4, ordVO.getOrdPrice());
				pstmt.setString(5, ordVO.getOrdName());
				pstmt.setString(6, ordVO.getOrdPhone());
				pstmt.setString(7, ordVO.getOrdMail());
				pstmt.setString(8, ordVO.getOrdCode());
				pstmt.setString(9, ordVO.getOrdCity());
				pstmt.setString(10, ordVO.getOrdSection());
				pstmt.setString(11, ordVO.getOrdAddress());
				pstmt.setString(12, ordVO.getOrdCoup());
				
				
				pstmt.executeUpdate();
				//掘取對應的自增主鍵值
				
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					next_ord_no = rs.getString(1);
				}
				rs.close();
				//再同時新增訂單明細
				ItemDAO itemDAO = new ItemDAO();
				for(ItemVO itemVO : list) {
					itemVO.setOrdNo(next_ord_no);
					itemDAO.insert(itemVO,con);
					}
				// 2.設定於 pstm.executeUpdate()之後
				con.commit();
				con.setAutoCommit(true);
				
				// Handle any SQL errors
			} catch (SQLException se) {
				if (con != null) {
					try {
						// 3.設定於當有exception發生時之catch區塊內
						System.err.print("Transaction is being ");
						System.err.println("rolled back-由-ordDAO");
						con.rollback();
					} catch (SQLException excep) {
						throw new RuntimeException("rollback error occured. "
								+ excep.getMessage());
					}
				}
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
			
			//新增完訂單後要回傳訂單編號給付款頁面
			return next_ord_no;

		}
		
		@Override
		public List<OrdVO> getOrdStatus(String ord_status) {
			List<OrdVO> list = new ArrayList<OrdVO>();
			OrdVO ordVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ORD_STATUS);
				
				pstmt.setString(1, ord_status);
				
				rs = pstmt.executeQuery();
//
				while (rs.next()) {
					// ordVO 也稱為 Domain objects
					ordVO = new OrdVO();
					ordVO.setOrdNo(rs.getString("ord_no"));
					ordVO.setOrdStatus(rs.getString("ord_status"));
					ordVO.setOrdDate(rs.getTimestamp("ord_date"));
					ordVO.setOrdName(rs.getString("ord_name"));
					ordVO.setOrdCode(rs.getString("ord_code"));
					ordVO.setOrdCity(rs.getString("ord_city"));
					ordVO.setOrdSection(rs.getString("ord_section"));
					ordVO.setOrdAddress(rs.getString("ord_address"));
					ordVO.setOrdPhone(rs.getString("ord_phone"));
					ordVO.setOrdMail(rs.getString("ord_mail"));
					ordVO.setMemNo(rs.getString("mem_no"));
					ordVO.setEmpNo(rs.getString("emp_no"));
					ordVO.setOrdCoup(rs.getString("ord_coup"));
					ordVO.setOrdPrice(rs.getString("ord_price"));
					list.add(ordVO); // Store the row in the list
				}
//				System.out.println(list);

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
