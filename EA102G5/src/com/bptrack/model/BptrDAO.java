package com.bptrack.model;

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

import com.bp.model.BpVO;


public class BptrDAO implements BptrDAO_interface{

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

	private static final String NEW_TRACK=
	"INSERT INTO BPTRACK VALUES(?,?)";
	private static final String DELETE_TRACK= 
	"DELETE  FROM BPTRACK where MEM_NO=? AND BP_NO =? ";
	private static final String MY_TRACK=
	"SELECT * FROM BPTRACK where MEM_NO = ? order by BP_NO desc";
	private static final String TRACK_ONE=
	"SELECT * FROM BPTRACK where MEM_NO =? AND BP_NO=?";
	
	
	
	@Override
	public void insert(BptrVO bptrVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(NEW_TRACK);
			
			pstmt.setString(1, bptrVO.getMem_no());
			pstmt.setString(2, bptrVO.getBp_no());
			
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
	public void delete(String mem_no, String bp_no) {
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_TRACK);
			
			pstmt.setString(1, mem_no);
			pstmt.setString(2, bp_no);
			
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
	public List<BptrVO> findBymen_no(String mem_no) {
		// TODO Auto-generated method stub
		List<BptrVO> list = new ArrayList<BptrVO>();
		BptrVO bptrVO = null ; 
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(MY_TRACK);
			
			pstmt.setString(1, mem_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bptrVO = new BptrVO();
				
				bptrVO.setMem_no(rs.getString("mem_no"));
				bptrVO.setBp_no(rs.getString("bp_no"));
				list.add(bptrVO);
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
	public BptrVO findonememtr(String mem_no, String bp_no) {
		
		BptrVO bptrVO = null ; 
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(TRACK_ONE);
			
			pstmt.setString(1, mem_no);
			pstmt.setString(2, bp_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				bptrVO = new BptrVO();
				
				bptrVO.setMem_no(rs.getString("mem_no"));
				bptrVO.setBp_no(rs.getString("bp_no"));

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

		return bptrVO;
	}
	
//	public static void main(String[] args) {
//		BptrDAO dao = new BptrDAO();
//		BptrVO bptrVO = new BptrVO();
//		
//		bptrVO.setMem_no("M0007");
//		bptrVO.setBp_no("800003");
//		dao.insert(bptrVO);
//		
//		bptrVO.setMem_no("M0008");
//		bptrVO.setBp_no("800001");
//		dao.delete(bptrVO);
//		
//		int c = 0;
//		List<BptrVO> list = dao.findBymen_no("M0007");
//		for (BptrVO bptr : list) {
//			System.out.print(bptr.getMem_no()+ ",");
//			System.out.print(bptr.getBp_no() + ",");
//			c++;
//			System.out.println();
//		}
//		System.out.println(c);
//	}
}
