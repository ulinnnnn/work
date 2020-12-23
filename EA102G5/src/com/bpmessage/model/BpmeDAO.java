package com.bpmessage.model;

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
import com.bpclass.model.BpclassVO;

public class BpmeDAO implements BpmeDAO_interface{
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
	"INSERT INTO bpmessage (bpme_no,bp_no,MEM_NO,QMEM_NO,QBPME_TEXT) values (bpmessage_seq.NEXTVAL,?,?,?,?)";
	private static final String UPDATE_NEW_RESPONSE = //回答
	"UPDATE bpmessage set bpme_text = ? where bpme_no = ?";	
	private static final String SELECT_ALL=
	"SELECT * from bpmessage order by bpme_no DESC ";
	private static final String SELECT_ONE_BP=
	"SELECT * from bpmessage where bp_no = ? order by bpme_no DESC";
	private static final String SELECT_MEM_ME=
	"SELECT * from bpmessage where qmem_no = ? order by bpme_no DESC ";
	
	@Override
	public void insert_q(BpmeVO bpmeVO) {
		// TODO Auto-generated method stub
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_NEW_QUESTION);
			
			pstmt.setString(1, bpmeVO.getBp_no());
			pstmt.setString(2, bpmeVO.getMem_no());
			pstmt.setString(3, bpmeVO.getQmem_no());
			pstmt.setString(4, bpmeVO.getQbpme_text());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void update_a(BpmeVO bpmeVO) {
		// TODO Auto-generated method stub
		Connection con = null ; 
		PreparedStatement pstmt = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_NEW_RESPONSE);
			
			pstmt.setString(1, bpmeVO.getBpme_text());
			pstmt.setString(2, bpmeVO.getBpme_no());

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
	public void update(BpmeVO bpmeVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String bpcl_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BpmeVO> findBybp_no(String bp_no) {
		List<BpmeVO> list = new ArrayList<BpmeVO>();
		BpmeVO bpmeVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ONE_BP);
			
			pstmt.setString(1, bp_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bpmeVO = new BpmeVO();
				
				bpmeVO.setBpme_no(rs.getString("bpme_no"));
				bpmeVO.setBp_no(rs.getString("bp_no"));
				bpmeVO.setMem_no(rs.getString("mem_no"));
				bpmeVO.setBpme_text(rs.getString("bpme_text"));
				bpmeVO.setQmem_no(rs.getString("qmem_no"));
				bpmeVO.setQbpme_text(rs.getString("qbpme_text"));
				
				list.add(bpmeVO);
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
	public List<BpmeVO> findByqmem_no(String qmem_no) {
		List<BpmeVO> list = new ArrayList<BpmeVO>();
		BpmeVO bpmeVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_MEM_ME);
			
			pstmt.setString(1, qmem_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bpmeVO = new BpmeVO();
				
				bpmeVO.setBpme_no(rs.getString("bpme_no"));
				bpmeVO.setBp_no(rs.getString("bp_no"));
				bpmeVO.setMem_no(rs.getString("mem_no"));
				bpmeVO.setBpme_text(rs.getString("bpme_text"));
				bpmeVO.setQmem_no(rs.getString("qmem_no"));
				bpmeVO.setQbpme_text(rs.getString("qbpme_text"));
				
				list.add(bpmeVO);
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
	public List<BpmeVO> getAll() {
		
		List<BpmeVO> list = new ArrayList<BpmeVO>();
		BpmeVO bpmeVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bpmeVO =new BpmeVO();		
				bpmeVO.setBpme_no(rs.getString("bpme_no"));
				bpmeVO.setBp_no(rs.getString("bp_no"));
				bpmeVO.setMem_no(rs.getString("mem_no"));
				bpmeVO.setBpme_text(rs.getString("bpme_text"));
				bpmeVO.setQmem_no(rs.getString("qmem_no"));
				bpmeVO.setQbpme_text(rs.getString("qbpme_text"));
				
				list.add(bpmeVO);
				
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
		
//		BpmeDAO dao = new BpmeDAO();
//		
//		BpmeVO bpmeVO = new BpmeVO();
//		bpmeVO.setBp_no("800001");
//		bpmeVO.setMem_no("M0001");
//		bpmeVO.setQmem_no("M0007");
//		bpmeVO.setQbpme_text("買多少免運呢?");
//		dao.insert_q(bpmeVO);
//		
//		
//		BpmeVO bpmeVO = new BpmeVO();
//		bpmeVO.setBpme_text("有的,完整");
//		bpmeVO.setBpme_no("2003");
//	
//		dao.update_a(bpmeVO);
//		
//		
//		List<BpmeVO> list = dao.getAll();	
//		for(BpmeVO bpme : list) {
//			System.out.print(bpme.getBpme_no() + ",");
//			System.out.print(bpme.getBp_no() + ",");
//			System.out.print(bpme.getMem_no() + ",");
//			System.out.print(bpme.getBpme_text() + ",");
//			System.out.print(bpme.getQmem_no() + ",");
//			System.out.print(bpme.getQbpme_text() + ",");
//			System.out.println();	
//		}
//		
//		List<BpmeVO> list1 = dao.findBybp_no("800001");	
//		for(BpmeVO bp : list1) {
//			System.out.print(bp.getBpme_no() + ",");
//			System.out.print(bp.getBp_no() + ",");
//			System.out.print(bp.getMem_no() + ",");
//			System.out.print(bp.getBpme_text() + ",");
//			System.out.print(bp.getQmem_no() + ",");
//			System.out.print(bp.getQbpme_text() + ",");
//			System.out.println();	
//		}
		
		

		
		
	}
}
