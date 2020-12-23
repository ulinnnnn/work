package com.bpreport.model;
import java.sql.Connection;
import java.sql.Date;
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
import com.bpmessage.model.BpmeDAO_interface;
import com.bpmessage.model.BpmeVO;

public class BprpDAO implements BprpDAO_interface{
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
	
	private static final String INSERT_NEW_REPORT = //發出檢舉
	"INSERT INTO BPREPORT (BPRP_NO,BP_NO,MEM_NO,BPRP_PROJECT,bprp_text) VALUES (bpreport_seq.NEXTVAL,?,?,?,?)";
	private static final String UPDATE_PEPORT =//回應檢舉
	"UPDATE BPREPORT SET BPRP_STATUS=? WHERE BPRP_NO =?";		
	private static final String SELECT_ALL_REPORT=
	"SELECT * FROM BPREPORT order by BPRP_NO desc";
	private static final String SELECT_MEM_REPORT=
	"SELECT * FROM BPREPORT where mem_no= ? order by BPRP_NO desc";
	
	
	@Override
	public void insert_rp(BprpVO bprpVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_NEW_REPORT);

			pstmt.setString(1, bprpVO.getBp_no());
			pstmt.setString(2, bprpVO.getMem_no());
			pstmt.setString(3, bprpVO.getBprp_project());
			pstmt.setString(4, bprpVO.getBprp_text());
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
	public void update_rp(BprpVO bprpVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_PEPORT);

			pstmt.setString(1, bprpVO.getBprp_status());
			pstmt.setString(2, bprpVO.getBprp_no());
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
	public List<BprpVO> getAll() {
		List<BprpVO> list = new ArrayList<BprpVO>();
		BprpVO bprpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ALL_REPORT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bprpVO =new BprpVO();		
				bprpVO.setBprp_no(rs.getString("bprp_no"));
				bprpVO.setBp_no(rs.getString("bp_no"));
				bprpVO.setMem_no(rs.getString("mem_no"));
				bprpVO.setBprp_project(rs.getString("bprp_project"));
				bprpVO.setBprp_text(rs.getString("bprp_text"));
				bprpVO.setBprp_time(rs.getDate("bprp_time"));
				bprpVO.setBprp_status(rs.getString("bprp_status"));
				
				list.add(bprpVO);
				
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
	public List<BprpVO> getmemrp(String mem_no) {
		List<BprpVO> list = new ArrayList<BprpVO>();
		BprpVO bprpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_MEM_REPORT);
			
			pstmt.setString(1, mem_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bprpVO = new BprpVO();
					
				bprpVO.setBprp_no(rs.getString("bprp_no"));
				bprpVO.setBp_no(rs.getString("bp_no"));
				bprpVO.setMem_no(rs.getString("mem_no"));
				bprpVO.setBprp_project(rs.getString("bprp_project"));
				bprpVO.setBprp_text(rs.getString("bprp_text"));
				bprpVO.setBprp_time(rs.getDate("bprp_time"));
				bprpVO.setBprp_status(rs.getString("bprp_status"));
				
				
				list.add(bprpVO);
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
	
//	public static void main(String[] args) {
//		BprpDAO dao =new BprpDAO();
//		BprpVO bprpVO = new BprpVO();
//		
//		
//		bprpVO.setBp_no("800007");
//		bprpVO.setMem_no("M0005");
//		bprpVO.setBprp_project("上架");
//		bprpVO.setBprp_text("圖文不符合的樣子");
//		dao.insert_rp(bprpVO);
//
//
//		bprpVO.setBprp_status("檢舉未通過");
//		bprpVO.setBprp_no("1002");
//		dao.update_rp(bprpVO);
//		
//		List<BprpVO> list = dao.getAll();	
//		for(BprpVO bprp : list) {
//			System.out.print(bprp.getBprp_no() + ",");
//			System.out.print(bprp.getBp_no() + ",");
//			System.out.print(bprp.getMem_no() + ",");
//			System.out.print(bprp.getBprp_project() + ",");
//			System.out.print(bprp.getBprp_text()+ ",");
//			System.out.print(bprp.getBprp_time()+ ",");
//			System.out.print(bprp.getBprp_status()+ ",");
//			System.out.println();	
//		}
//		
//		
//		List<BprpVO> list = dao.getmemrp("M0001");	
//		for(BprpVO bprp : list) {
//			System.out.print(bprp.getBprp_no() + ",");
//			System.out.print(bprp.getBp_no() + ",");
//			System.out.print(bprp.getMem_no() + ",");
//			System.out.print(bprp.getBprp_project() + ",");
//			System.out.print(bprp.getBprp_text()+ ",");
//			System.out.print(bprp.getBprp_time()+ ",");
//			System.out.print(bprp.getBprp_status()+ ",");
//			System.out.println();	
//		}
//	}


}
