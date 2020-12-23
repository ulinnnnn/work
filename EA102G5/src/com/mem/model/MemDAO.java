package com.mem.model;

import java.util.*;
import java.io.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import sun.misc.BASE64Encoder;

public class MemDAO implements MemDAO_interface {
//	static String driver = "oracle.jdbc.driver.OracleDriver";
//	static String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	static String userid = "EA102G5";
//	static String passwd = "123456";

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO  TOYMEMBER(mem_no ,mem_name,mem_account ,mem_pwd ,mem_phone ,mem_email,mem_born,mem_sex,mem_addr,mem_bank,mem_pic )VALUES('M'||LPAD(MEM_NO.NEXTVAL,4,0),?,?,?,?,?,?,?,?,?,?) ";
	private static final String SELECT_STMT_ACC = "SELECT * FROM toymember where mem_account=?";
	private static final String SELECT_STMT_PK = "SELECT * FROM toymember where mem_no=?";
	private static final String SELECT_STMT_EMAIL = "SELECT * FROM toymember where mem_email=?";
	private static final String UPDATE_MEM = "UPDATE toymember set mem_name=?,mem_phone=? ,mem_email=?,mem_born=?,mem_addr=?,mem_bank=? where mem_account=?";
	private static final String BLOCKMEM = "UPDATE toymember set mem_type='FALSE' where mem_account=? ";
	private static final String UNLOCKMEM = "UPDATE toymember set mem_type='TRUE' where mem_account=? ";
	private static final String SELECT_ALL = "SELECT * FROM toymember order by mem_no";
	private static final String UPDATE_PWD = "UPDATE toymember set mem_pwd=?  where mem_email=?";
	private static final String UPDATE_PIC = "UPDATE toymember set mem_pic=?  where mem_no=?";
	private static final String MEM_VERIFICATION = "UPDATE toymember set mem_verification_code=?  where mem_email=?";
	private static final String MEM_OPEN = "UPDATE toymember set mem_status='M1'where mem_account=?";

	@Override
	public void memInsert(MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(INSERT_STMT);
			MemVO selectMem = memSelectByAcc(memVO.getMem_account());
			System.out.println("是否重複帳號:" + !(selectMem == null));

			pstmt.setString(1, memVO.getMem_name());
			System.out.println(1);
			pstmt.setString(2, memVO.getMem_account());
			System.out.println(2);
			pstmt.setString(3, memVO.getMem_pwd());
			System.out.println(3);
			pstmt.setString(4, memVO.getMem_phone());
			System.out.println(4);
			pstmt.setString(5, memVO.getMem_email());
			System.out.println(5);
			pstmt.setDate(6, memVO.getMem_born());
			System.out.println(6);
			pstmt.setString(7, memVO.getMem_sex());
			System.out.println(7);
			pstmt.setString(8, memVO.getMem_addr());
			System.out.println(8);
			pstmt.setString(9, memVO.getMem_bank());
			System.out.println(9);
			pstmt.setBytes(10, memVO.getMem_pic());
			System.out.println(10);
			pstmt.executeUpdate();
			System.out.println("會員新增成功");

		} catch (Exception se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void memUpdate(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		MemVO memVOP = memSelectByAcc(memVO.getMem_account());// 尋要求 更新會員 資料

		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(UPDATE_MEM);
			pstmt.setString(1, memVO.getMem_name());
			pstmt.setString(2, memVO.getMem_phone());
			pstmt.setString(3, memVO.getMem_email());
			pstmt.setDate(4, memVO.getMem_born());
			pstmt.setString(5, memVO.getMem_addr());
			pstmt.setString(6, memVO.getMem_bank());
			pstmt.setString(7, memVO.getMem_account());// 將帳號填入寫死，不讓會員更改，以帳號去查詢

			pstmt.executeUpdate();
			System.out.println("更新成功");
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
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
	public void memBlock(String mem_account) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(BLOCKMEM);
			System.out.println(mem_account);
			pstmt.setString(1, mem_account);

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
	public void memUnlock(String mem_account) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(UNLOCKMEM);
			System.out.println(mem_account);
			pstmt.setString(1, mem_account);

			rs = pstmt.executeQuery();
			System.out.println("會員已解鎖");

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
	public MemVO memSelectByAcc(String memAccount) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_STMT_ACC);
			pstmt.setString(1, memAccount);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_pwd(rs.getString("mem_pwd"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_born(rs.getDate("mem_born"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_bank(rs.getString("mem_bank"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				memVO.setMem_creScore(rs.getInt("mem_creScore"));
				memVO.setMem_add_date(rs.getDate("mem_addDate"));
				memVO.setMem_abandon(rs.getInt("mem_abandon"));
				memVO.setMem_type(rs.getString("mem_type"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_verification_code(rs.getString("mem_verification_code"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				if (Integer.parseInt(rs.getString("mem_level")) >= 90) {
					memVO.setMem_level("高級會員");
				} else {
					memVO.setMem_level("普通會員");
				}

			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

		return memVO;

	}
	@Override
	public MemVO memSelectByPk(String mem_no) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_STMT_PK);
			pstmt.setString(1, mem_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_pwd(rs.getString("mem_pwd"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_born(rs.getDate("mem_born"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_bank(rs.getString("mem_bank"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				memVO.setMem_creScore(rs.getInt("mem_creScore"));
				memVO.setMem_add_date(rs.getDate("mem_addDate"));
				memVO.setMem_abandon(rs.getInt("mem_abandon"));
				memVO.setMem_type(rs.getString("mem_type"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_verification_code(rs.getString("mem_verification_code"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				if (Integer.parseInt(rs.getString("mem_level")) >= 90) {
					memVO.setMem_level("高級會員");
				} else {
					memVO.setMem_level("普通會員");
				}
				
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		
		return memVO;
		
	}
	@Override
	public MemVO memSelectByEmail(String mem_email) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_STMT_EMAIL);
			pstmt.setString(1, mem_email);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_pwd(rs.getString("mem_pwd"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_born(rs.getDate("mem_born"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_bank(rs.getString("mem_bank"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				memVO.setMem_creScore(rs.getInt("mem_creScore"));
				memVO.setMem_add_date(rs.getDate("mem_addDate"));
				memVO.setMem_abandon(rs.getInt("mem_abandon"));
				memVO.setMem_type(rs.getString("mem_type"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_verification_code(rs.getString("mem_verification_code"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				if (Integer.parseInt(rs.getString("mem_level")) >= 90) {
					memVO.setMem_level("高級會員");
				} else {
					memVO.setMem_level("普通會員");
				}
				
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		
		return memVO;
		
	}

	@Override
	public List<MemVO> selectAllMem() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_phone(rs.getString("mem_phone"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_born(rs.getDate("mem_born"));
				memVO.setMem_sex(rs.getString("mem_sex"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_bank(rs.getString("mem_bank"));
				memVO.setMem_creScore(rs.getInt("mem_creScore"));
				memVO.setMem_add_date(rs.getDate("mem_addDate"));
				memVO.setMem_abandon(rs.getInt("mem_abandon"));
				memVO.setMem_type(rs.getString("mem_type"));
				memVO.setMem_status(rs.getString("mem_status"));
				memVO.setMem_verification_code(rs.getString("mem_verification_code"));
				memVO.setMem_pic(rs.getBytes("mem_pic"));
				if (Integer.parseInt(rs.getString("mem_level")) >= 90) {
					memVO.setMem_level("高級會員");
				} else {
					memVO.setMem_level("普通會員");
				}
				list.add(memVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void memUpdatePWD(String mem_email, String mem_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			System.out.println("連線成功");
			pstmt = con.prepareStatement(UPDATE_PWD);
			pstmt.setString(1, mem_pwd);
			pstmt.setString(2, mem_email);
			pstmt.executeUpdate();
			System.out.println("更新成功");
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
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
	public void memUpdatePic(String mem_no, byte[] mem_pic) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
//			System.out.println("連線成功");
			pstmt = con.prepareStatement(UPDATE_PIC);
			pstmt.setBytes(1, mem_pic);
			pstmt.setString(2, mem_no);

			pstmt.executeUpdate();
			System.out.println("更新成功");
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
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
	public void memVerification(String mem_email, String mem_verification_code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
//			System.out.println("連線成功");
			pstmt = con.prepareStatement(MEM_VERIFICATION);
			pstmt.setString(1, mem_verification_code);
			pstmt.setString(2, mem_email);

			pstmt.executeUpdate();
			System.out.println("會員加入認證碼");
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
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
	public void memOpen(String mem_account) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
//			System.out.println("連線成功");
			pstmt = con.prepareStatement(MEM_OPEN);
			pstmt.setString(1, mem_account);

			pstmt.executeUpdate();
			System.out.println("會員開通成功");
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
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
}
