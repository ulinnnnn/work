package com.bpclass.model;

import java.io.IOException;
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



public class BpclassDAO  implements BpclassDAO_interface {
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
	private static final String INSERT_STMT_CLASS =
			"INSERT INTO bpclass values (bpclass_seq.NEXTVAL,?)";
	private static final String UPDATE_CLASS =
			"UPDATE bpclass set bpcl_name = ? where bpcl_no = ?";
	private static final String DELETE_CLASS =
			"DELETE FROM bpclass where bpcl_no = ? ";
	private static final String GET_ALL_CLASS=
			"SELECT bpcl_no , bpcl_name FROM bpclass order by bpcl_no DESC";
	private static final String GET_ONE_CLASS=
			"SELECT bpcl_no,bpcl_name FROM bpclass where bpcl_no = ?";
	
	
	@Override
	public void insert(BpclassVO bpclassVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT_CLASS);
		
			pstmt.setString(1, bpclassVO.getBpcl_name());
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
	public void update(BpclassVO bpclassVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null;
		
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_CLASS);
			
			pstmt.setString(1, bpclassVO.getBpcl_name());
			pstmt.setString(2, bpclassVO.getBpcl_no());

			
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
	public void delete(String bpcl_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_CLASS);

			pstmt.setString(1, bpcl_no);

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
	public BpclassVO findByPrimaryKey(String bpcl_no) {
		BpclassVO bpclassVO = null ; 
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_CLASS);
			
			pstmt.setString(1, bpcl_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bpclassVO = new BpclassVO();
				
				bpclassVO.setBpcl_no(rs.getString("bpcl_no"));
				bpclassVO.setBpcl_name(rs.getString("bpcl_name"));
				
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
		return bpclassVO;
	}

	@Override
	public List<BpclassVO> getAll() {
		List<BpclassVO> list = new ArrayList<BpclassVO>();
		BpclassVO bpclassVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_CLASS);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bpclassVO =new BpclassVO();		
				bpclassVO.setBpcl_no(rs.getString("bpcl_no"));
				bpclassVO.setBpcl_name(rs.getString("bpcl_name"));
			
				
				list.add(bpclassVO);
				
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
	
//	public static void main(String[] args) throws IOException {		
//		BpclassDAO dao =new BpclassDAO();
//		BpclassVO bpclassVO = new BpclassVO();
//		
//		bpclassVO.setBpcl_name("«÷¹Ï");
//		dao.insert(bpclassVO);
//		
//		
//		dao.delete("70");
//		
//		List<BpclassVO> list = dao.getAll();	
//		for(BpclassVO bp : list) {
//			System.out.print(bp.getBpcl_no() + ",");
//			System.out.print(bp.getBpcl_name() + ",");
//
//			System.out.println();	
//		}
//		
//		bpclassVO = dao.findByPrimaryKey("10");
//		System.out.print(bpclassVO.getBpcl_no() + ",");
//		System.out.print(bpclassVO.getBpcl_name() + ",");
//		System.out.println();
//			
//	}
		
}
