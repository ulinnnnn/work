package com.fmmessage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;




public class fmmeDAO implements fmmeDAO_interface{
//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String userid = "EA102G5";
//	String passwd = "123456";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	private static final String INSERT_NEW_QUESTION = //發問
	"INSERT INTO fmmessage (fmme_no,fm_no,MEM_NO,QMEM_NO,QFMME_TEXT) values (fmmessage_seq.NEXTVAL,?,?,?,?)";
	private static final String UPDATE_NEW_RESPONSE = //回答
	"UPDATE fmmessage set fmme_text = ? where fmme_no = ?";	
	private static final String SELECT_ALL=
	"SELECT * from fmmessage order by fmme_no DESC ";
	private static final String SELECT_ONE_fm=
	"SELECT * from fmmessage where fm_no = ? order by fmme_no DESC";
	private static final String SELECT_MEM_ME=
	"SELECT * from fmmessage where qmem_no = ? order by fmme_no DESC ";
	
	@Override
	public void insert_q(fmmeVO fmmeVO) {
		// TODO Auto-generated method stub
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_NEW_QUESTION);
			
			pstmt.setString(1, fmmeVO.getFm_no());
			pstmt.setString(2, fmmeVO.getMem_no());
			pstmt.setString(3, fmmeVO.getQmem_no());
			pstmt.setString(4, fmmeVO.getQfmme_text());
			pstmt.executeUpdate();
			
			
			
		
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
	public void update_a(fmmeVO fmmeVO) {
		// TODO Auto-generated method stub
		Connection con = null ; 
		PreparedStatement pstmt = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_NEW_RESPONSE);
			
			pstmt.setString(1, fmmeVO.getFmme_text());
			pstmt.setString(2, fmmeVO.getFmme_no());

			pstmt.executeUpdate();
			
	

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
	public void update(fmmeVO fmmeVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String fmcl_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<fmmeVO> findByfm_no(String fm_no) {
		List<fmmeVO> list = new ArrayList<fmmeVO>();
		fmmeVO fmmeVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ONE_fm);
			
			pstmt.setString(1, fm_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fmmeVO = new fmmeVO();
				
				fmmeVO.setFmme_no(rs.getString("fmme_no"));
				fmmeVO.setFm_no(rs.getString("fm_no"));
				fmmeVO.setMem_no(rs.getString("mem_no"));
				fmmeVO.setFmme_text(rs.getString("fmme_text"));
				fmmeVO.setQmem_no(rs.getString("qmem_no"));
				fmmeVO.setQfmme_text(rs.getString("qfmme_text"));
				
				list.add(fmmeVO);
			}
			
	
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
	public List<fmmeVO> findByqmem_no(String qmem_no) {
		List<fmmeVO> list = new ArrayList<fmmeVO>();
		fmmeVO fmmeVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_MEM_ME);
			
			pstmt.setString(1, qmem_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fmmeVO = new fmmeVO();
				
				fmmeVO.setFmme_no(rs.getString("fmme_no"));
				fmmeVO.setFm_no(rs.getString("fm_no"));
				fmmeVO.setMem_no(rs.getString("mem_no"));
				fmmeVO.setFmme_text(rs.getString("fmme_text"));
				fmmeVO.setQmem_no(rs.getString("qmem_no"));
				fmmeVO.setQfmme_text(rs.getString("qfmme_text"));
				
				list.add(fmmeVO);
			}
			
			
	
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
	public List<fmmeVO> getAll() {
		
		List<fmmeVO> list = new ArrayList<fmmeVO>();
		fmmeVO fmmeVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				fmmeVO =new fmmeVO();		
				fmmeVO.setFmme_no(rs.getString("fmme_no"));
				fmmeVO.setFm_no(rs.getString("fm_no"));
				fmmeVO.setMem_no(rs.getString("mem_no"));
				fmmeVO.setFmme_text(rs.getString("fmme_text"));
				fmmeVO.setQmem_no(rs.getString("qmem_no"));
				fmmeVO.setQfmme_text(rs.getString("qfmme_text"));
				
				list.add(fmmeVO);
				
			}
			
			
		
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
	
	public static void main(String[] args) {
		
//		fmmeDAO dao = new fmmeDAO();
//		
//		fmmeVO fmmeVO = new fmmeVO();
//		fmmeVO.setfm_no("800001");
//		fmmeVO.setMem_no("M0001");
//		fmmeVO.setQmem_no("M0007");
//		fmmeVO.setQfmme_text("買多少免運呢?");
//		dao.insert_q(fmmeVO);
//		
//		
//		fmmeVO fmmeVO = new fmmeVO();
//		fmmeVO.setfmme_text("有的,完整");
//		fmmeVO.setfmme_no("2003");
//	
//		dao.update_a(fmmeVO);
//		
//		
//		List<fmmeVO> list = dao.getAll();	
//		for(fmmeVO fmme : list) {
//			System.out.print(fmme.getfmme_no() + ",");
//			System.out.print(fmme.getfm_no() + ",");
//			System.out.print(fmme.getMem_no() + ",");
//			System.out.print(fmme.getfmme_text() + ",");
//			System.out.print(fmme.getQmem_no() + ",");
//			System.out.print(fmme.getQfmme_text() + ",");
//			System.out.println();	
//		}
//		
//		List<fmmeVO> list1 = dao.findByfm_no("800001");	
//		for(fmmeVO fm : list1) {
//			System.out.print(fm.getfmme_no() + ",");
//			System.out.print(fm.getfm_no() + ",");
//			System.out.print(fm.getMem_no() + ",");
//			System.out.print(fm.getfmme_text() + ",");
//			System.out.print(fm.getQmem_no() + ",");
//			System.out.print(fm.getQfmme_text() + ",");
//			System.out.println();	
//		}
		
		

		
		
	}
}
