package com.depo.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mem.model.MemVO;

public class DepoDAO implements DepoDAO_interface{
//	static String driver = "oracle.jdbc.driver.OracleDriver";
//	static String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	static String userid = "EA102G5";
//	static String passwd = "123456";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx=new InitialContext();
			 ds=(DataSource)ctx.lookup("java:comp/env/EA102G5");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String UPDATE_DEPO_TOK_STATUS="UPDATE depo set depo_tok_status=2 where depo_no=? ";
	private static final String INSERT_STMT="INSERT INTO depo(depo_no,mem_no,depo_amount,depo_point,depo_trans_type,depo_tok_status) VALUES ('DEPO'||LPAD(DEPO_NO.NEXTVAL,4,0),?,?,?,?,?) ";
	private static final String SELECT_STMT="SELECT * FROM depo WHERE mem_no= ? ORDER BY depo_time DESC";
	private static final String SELECT_ALL_STMT="SELECT * FROM DEPO ORDER BY depo_time DESC";
	private static final String NOW_DEPO="SELECT mem_no,depo_point,depo_time  FROM( select mem_no,depo_point,depo_time FROM depo WHERE mem_no= ? ORDER BY depo_time DESC ) WHERE ROWNUM=1";
	@Override
	public void newTransAdd(DepoVO depoVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,depoVO.getMem_no());
			pstmt.setInt(2,depoVO.getDepo_amount());
			pstmt.setInt(3,depoVO.getDepo_point());
			pstmt.setString(4,depoVO.getDepo_trans_type());
			pstmt.setString(5,depoVO.getDepo_tok_status());
			pstmt.executeUpdate();
			System.out.println("新增成功");
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException se) {
						se.printStackTrace(System.err);
				}
			}if (con != null) {
				try {
						con.close();
				}catch (Exception e) {
						e.printStackTrace(System.err);
				}
			}
		}
	}
	@Override
	public void upDateDepoTokStatus(String depo_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(UPDATE_DEPO_TOK_STATUS);
			System.out.println(depo_no);
			pstmt.setString(1, depo_no);

			rs = pstmt.executeQuery();
			System.out.println("會員已封鎖");

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public List<DepoVO> depoSelectByMem(String mem_no) {
		List<DepoVO> list=new ArrayList<DepoVO>();
		DepoVO depoVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(SELECT_STMT);
			pstmt.setString(1,mem_no);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				depoVO=new DepoVO();
				depoVO.setDepo_no(rs.getString("depo_no"));
				depoVO.setMem_no(rs.getString("mem_no"));
				depoVO.setDepo_amount(rs.getInt("depo_amount"));
				depoVO.setDepo_point(rs.getInt("depo_point"));
				depoVO.setDepo_time(rs.getTimestamp("depo_time"));
				depoVO.setDepo_trans_type(rs.getString("depo_trans_type"));
				depoVO.setDepo_tok_status(rs.getString("depo_tok_status"));
				list.add(depoVO);
			}
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public List<DepoVO> depoSelectAllByEmp() {
		List<DepoVO> list=new ArrayList<DepoVO>();
		DepoVO depoVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(SELECT_ALL_STMT);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				depoVO=new DepoVO();
				depoVO.setDepo_no(rs.getString("depo_no"));
				depoVO.setMem_no(rs.getString("mem_no"));
				depoVO.setDepo_amount(rs.getInt("depo_amount"));
				depoVO.setDepo_point(rs.getInt("depo_point"));
				depoVO.setDepo_time(rs.getTimestamp("depo_time"));
				depoVO.setDepo_trans_type(rs.getString("depo_trans_type"));
				depoVO.setDepo_tok_status(rs.getString("depo_tok_status"));
				list.add(depoVO);
			}
		
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public DepoVO memNowDepo(String mem_no) {
		DepoVO depoVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(SELECT_STMT);
			pstmt.setString(1,mem_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				depoVO=new DepoVO();
				depoVO.setDepo_no(rs.getString("depo_no"));
				depoVO.setMem_no(rs.getString("mem_no"));
				depoVO.setDepo_amount(rs.getInt("depo_amount"));
				depoVO.setDepo_point(rs.getInt("depo_point"));
				depoVO.setDepo_time(rs.getTimestamp("depo_time"));
				depoVO.setDepo_trans_type(rs.getString("depo_trans_type"));
				depoVO.setDepo_tok_status(rs.getString("depo_tok_status"));
				break;
			}
//			while(rs.next()) {
//				depoVO=new DepoVO();
//				depoVO.setMem_no(rs.getString("mem_no"));
//				depoVO.setDepo_point(rs.getInt("depo_point"));
//				depoVO.setDepo_time(rs.getTimestamp("depo_time"));
//			}
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
		return depoVO;
	}
}






