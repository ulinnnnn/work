package com.Bid_commodity.model;
import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class Bid_commodityJDBC implements Bid_commodityDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}

		private static final String INSERT_STMT = "INSERT INTO Bid_commodity(BP_NO,MEM_NO,BS_PRICE,B_INTRO,BPLUS_PRICE,B_startime,B_endtime,Bc_no,B_name,B_picture,B_picture2) VALUES('B'||LPAD(BP_NO.NEXTVAL,4,0),?,?,?,?,?,?,?,?,?,?)";
		private static final String GET_ALL_STMT = "SELECT BS_PRICE,B_INTRO,BPLUS_PRICE,B_startime,B_endtime,Bc_no,B_name,B_picture,B_picture2,bp_no,bn_price,b_times,mem_no FROM Bid_commodity ORDER BY BP_NO";
		private static final String GET_ONE_STMT = "SELECT * FROM Bid_commodity WHERE bp_no=?";
		private static final String GET_ONE_bc_no = "SELECT BS_PRICE,B_INTRO,BPLUS_PRICE,B_startime,B_endtime,Bc_no,B_name,B_picture,B_picture2,bp_no,bn_price,b_times,mem_no FROM Bid_commodity WHERE bc_no=?";
		private static final String UPDATE = "UPDATE Bid_commodity set BS_PRICE=?,B_INTRO=?,BPLUS_PRICE=?,B_startime=?,B_endtime=?,B_name=?,B_picture=?,B_picture2=?,bc_no=? where bp_no=?";
		private static final String DELETE = "DELETE FROM Bid_commodity WHERE BP_NO=?";
		private static final String UPDATETIME = "UPDATE Bid_commodity set B_times=? where bp_no=?";
		private static final String UPDATEPRICE = "UPDATE Bid_commodity set Bn_PRICE=? where bp_no=?";		
//		private Bid_commodityVO bid_commodityVO;

		public void Bidinsert(Bid_commodityVO bid_commodityVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1, bid_commodityVO.getMem_no());
//				pstmt.setInt(1, bid_commodityVO.getBc_no());pstmt.setInt(5, bid_commodityVO.getB_TIMES());
				pstmt.setInt(2,bid_commodityVO.getBs_price());				
				pstmt.setString(3,bid_commodityVO.getB_intro());
				pstmt.setInt(4,bid_commodityVO.getBplus_price());
				pstmt.setTimestamp(5,bid_commodityVO.getB_startime());
				pstmt.setTimestamp(6,bid_commodityVO.getB_endtime());
				pstmt.setString(7,bid_commodityVO.getBc_no());				
				pstmt.setString(8,bid_commodityVO.getB_name());	
				pstmt.setBytes(9,bid_commodityVO.getB_picture());
				pstmt.setBytes(10,bid_commodityVO.getB_picture2());
				
				pstmt.executeUpdate();
				// Handle any driver errors
			} catch (SQLException se) {
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
		public void delete(String bp_no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1,bp_no);

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
		public void update(Bid_commodityVO bid_commodityVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);
				pstmt.setInt(1,bid_commodityVO.getBs_price());				
				pstmt.setString(2,bid_commodityVO.getB_intro());
				pstmt.setInt(3,bid_commodityVO.getBplus_price());
				pstmt.setTimestamp(4,bid_commodityVO.getB_startime());
				pstmt.setTimestamp(5,bid_commodityVO.getB_endtime());
				pstmt.setString(6,bid_commodityVO.getB_name());	
				pstmt.setBytes(7,bid_commodityVO.getB_picture());
				pstmt.setBytes(8,bid_commodityVO.getB_picture2());
				pstmt.setString(9,bid_commodityVO.getBc_no());
				pstmt.setString(10,bid_commodityVO.getBp_no());
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
		public void updatetimes(Bid_commodityVO bid_commodityVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATETIME);
				pstmt.setInt(1,bid_commodityVO.getB_times());				
				pstmt.setString(2,bid_commodityVO.getBp_no());

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
		
		public void updateprice(Bid_commodityVO bid_commodityVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATEPRICE);
				pstmt.setInt(1,bid_commodityVO.getBn_price());
				pstmt.setString(2,bid_commodityVO.getBp_no());
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
		synchronized public List<Bid_commodityVO> getAll() {

			List<Bid_commodityVO> list = new ArrayList<Bid_commodityVO>();
            Bid_commodityVO bid_commodityVO=null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					bid_commodityVO = new Bid_commodityVO();
					bid_commodityVO.setBs_price(rs.getInt("bs_price"));	
					bid_commodityVO.setBp_no(rs.getString("bp_no"));
					bid_commodityVO.setB_intro(rs.getString("b_intro"));
					bid_commodityVO.setBplus_price(rs.getInt("bplus_price"));								
					bid_commodityVO.setB_startime(rs.getTimestamp("b_startime"));
					bid_commodityVO.setB_endtime(rs.getTimestamp("b_endtime"));				
					bid_commodityVO.setBc_no(rs.getString("bc_no"));
					bid_commodityVO.setB_name(rs.getString("b_name"));
					bid_commodityVO.setB_picture(rs.getBytes("b_picture"));
					bid_commodityVO.setB_picture2(rs.getBytes("b_picture2"));	
					bid_commodityVO.setBn_price(rs.getInt("bn_price"));
					bid_commodityVO.setB_times(rs.getInt("b_times"));
					bid_commodityVO.setMem_no(rs.getString("mem_no"));
					
					list.add(bid_commodityVO);				
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
		public Bid_commodityVO findByPrimaryKey(String bp_no) {
			Bid_commodityVO bid_commodityVO = null;
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
					bid_commodityVO = new Bid_commodityVO();
					bid_commodityVO.setBp_no(rs.getString("bp_no"));
					bid_commodityVO.setBs_price(rs.getInt("bs_price"));	
					bid_commodityVO.setMem_no(rs.getString("mem_no"));
					bid_commodityVO.setB_intro(rs.getString("b_intro"));
					bid_commodityVO.setBplus_price(rs.getInt("bplus_price"));								
					bid_commodityVO.setB_startime(rs.getTimestamp("b_startime"));
					bid_commodityVO.setB_endtime(rs.getTimestamp("b_endtime"));				
					bid_commodityVO.setBc_no(rs.getString("bc_no"));
					bid_commodityVO.setB_name(rs.getString("B_name"));
					bid_commodityVO.setB_picture(rs.getBytes("B_picture"));	
					bid_commodityVO.setB_picture2(rs.getBytes("B_picture2"));	
					bid_commodityVO.setBn_price(rs.getInt("bn_price"));
					bid_commodityVO.setB_times(rs.getInt("b_times"));
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
			return bid_commodityVO;
		}	
		
		@Override
		public List<Bid_commodityVO> getbc_no(String bc_no) {
			List<Bid_commodityVO> list = new ArrayList<Bid_commodityVO>();
            Bid_commodityVO bid_commodityVO1;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_bc_no);
				pstmt.setString(1, bc_no);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// empVO 也稱為 Domain objects		
					bid_commodityVO1 = new Bid_commodityVO();
					bid_commodityVO1.setBs_price(rs.getInt("bs_price"));	
					bid_commodityVO1.setBp_no(rs.getString("bp_no"));
					bid_commodityVO1.setB_intro(rs.getString("b_intro"));
					bid_commodityVO1.setBplus_price(rs.getInt("bplus_price"));								
					bid_commodityVO1.setB_startime(rs.getTimestamp("b_startime"));
					bid_commodityVO1.setB_endtime(rs.getTimestamp("b_endtime"));				
					bid_commodityVO1.setBc_no(rs.getString("bc_no"));
					bid_commodityVO1.setB_name(rs.getString("b_name"));
					bid_commodityVO1.setB_picture(rs.getBytes("b_picture"));
					bid_commodityVO1.setB_picture2(rs.getBytes("b_picture2"));	
					bid_commodityVO1.setBn_price(rs.getInt("bn_price"));
					bid_commodityVO1.setB_times(rs.getInt("b_times"));
					bid_commodityVO1.setMem_no(rs.getString("mem_no"));
					list.add(bid_commodityVO1);
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
//
//		public static void main(String[] args) throws IOException {
//			Bid_commodityJDBC dao = new Bid_commodityJDBC();
//			// 新增
//			Bid_commodityVO bid_commodityVO1 = new Bid_commodityVO();
////			bidVO1.setbp_no(1);
//			bid_commodityVO1.setBs_price(10);
//			bid_commodityVO1.setB_intro("你贏了");
//			bid_commodityVO1.setBplus_price(123);
//			bid_commodityVO1.setB_startime(java.sql.Timestamp.valueOf("2002-01-01 20:00:00"));
//			bid_commodityVO1.setB_endtime(java.sql.Timestamp.valueOf("2008-01-01 20:00:00"));
//			bid_commodityVO1.setBc_no("01");
//			bid_commodityVO1.setB_name("5555555");
//			byte[] B_picture = getPictureByteArray("C:/dog.jpeg");
//			bid_commodityVO1.setB_picture(B_picture);
//			byte[] B_picture2 = getPictureByteArray("C:/dog.jpeg");
//			bid_commodityVO1.setB_picture2(B_picture);
//		
//			dao.Bidinsert(bid_commodityVO1);}

			// 依照名稱查詢
//			Bid_commodityVO bid_commodityVO3 = dao.findByPrimaryKey("B0001");
//			System.out.println(bid_commodityVO3.getBs_price() + ",");
//			System.out.println(bid_commodityVO3.getB_intro() + ",");
//			System.out.println(bid_commodityVO3.getBplus_price() + ",");
//			System.out.println(bid_commodityVO3.getB_startime() + ",");
//			System.out.println(bid_commodityVO3.getB_endtime() + ",");
//			System.out.println(bid_commodityVO3.getBc_no() + ",");
//			System.out.println(bid_commodityVO3.getB_name()+",");
//			System.out.println(bid_commodityVO3.getB_picture()+",");
//			System.out.println(bid_commodityVO3.getB_picture2()+",");		
//			System.out.println("----");}
		
//
//			 刪除
//			dao.delete("1");
////
////			// 查詢
//			List<Bid_commodityVO> list = dao.getAll();
//			for (Bid_commodityVO aBid : list) {
//				System.out.println(aBid.getBs_price() + ",");
//				System.out.println(aBid.getBp_no() + ",");
//				System.out.println(aBid.getB_intro() + ",");
//				System.out.println(aBid.getBs_price() + ",");
//				System.out.println(aBid.getB_startime() + ",");
//				System.out.println(aBid.getB_endtime() + ",");
//				System.out.println(aBid.getBc_no() + ",");
//				System.out.println(aBid.getB_name()+",");
//				System.out.println(aBid.getB_picture()+",");
//				System.out.println();
//			}
//			}
//			
////			Bid_commodityVO bid_commodityVO3 = dao.findByPrimaryKey("01");
////			System.out.println(bid_commodityVO3.getBS_PRICE() + ",");
////			System.out.println(123);System.out.println(bid_commodityVO3.getB_INTRO() + ",");
////			System.out.println(bid_commodityVO3.getBPLUS_PRICE() + ",");
////			System.out.println(bid_commodityVO3.getB_startime() + ",");
////			System.out.println(bid_commodityVO3.getB_endtime() + ",");
////			System.out.println(bid_commodityVO3.getBc_no() + ",");
////			System.out.println(bid_commodityVO3.getB_name()+",");
////			System.out.println(bid_commodityVO3.getB_picture()+",");
//			
////			
//			Bid_commodityVO bid_commodityVO4 = new Bid_commodityVO();
//			bid_commodityVO4.setBs_price(10);
//			bid_commodityVO4.setB_intro("你贏了");
//			bid_commodityVO4.setBplus_price(123);
//			bid_commodityVO4.setB_startime(java.sql.Timestamp.valueOf("2002-01-01 20:00:00"));
//			bid_commodityVO4.setB_endtime(java.sql.Timestamp.valueOf("2002-01-01 20:00:00"));
//			bid_commodityVO4.setBc_no("B0001");
//			bid_commodityVO4.setB_name("5555555");
//			byte[] B_picture = getPictureByteArray("/EA102_WebApp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/EA102G5/bid_front_end/jpg/dog.jpeg");
//			bid_commodityVO4.setB_picture(B_picture);
//			System.out.println(123);
//			dao.update(bid_commodityVO4);
//		}
//		
		
		public static byte[] getPictureByteArray(String path) throws IOException {
			File file = new File(path);
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buffer = new byte[8192];
			int i;
			while ((i = fis.read(buffer)) != -1) {
				baos.write(buffer, 0, i);
			}
			baos.close();
			fis.close();

			return baos.toByteArray();
		}
		@Override
		public Set<Bid_commodityVO> getBidsByBAP_STATUS(Integer bAP_STATUS) {
			// TODO Auto-generated method stub
			return null;
		}


	}



