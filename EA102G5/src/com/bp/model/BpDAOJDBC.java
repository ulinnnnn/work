package com.bp.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;


public class BpDAOJDBC implements BpDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA102G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 	
	"INSERT INTO bproduct (bp_no,bp_head,bpcl_no,bp_new,bp_loc,bp_pri,bp_del,bp_text,bp_dot,MEM_NO,bp_pic1,bp_pic2) VALUES (bproduct_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE =
	"UPDATE bproduct set bp_head=? , bpcl_no=? , bp_new=? , bp_loc=? , bp_pri=? , bp_del=? , bp_text=?,bp_dot=? where bp_no = ? ";
	private static final String DELETE = 
	"DELETE FROM bproduct where bp_no = ?";
	private static final String GET_ALL_STMT =
	"SELECT bp_no,bp_head,bpcl_no,bp_new,bp_loc,bp_pri,bp_del,bp_upt,bp_dot,bp_text,mem_no FROM bproduct order by bp_no";
	private static final String GET_ONE = 
	"SELECT bp_no,bp_head,bpcl_no,bp_new,bp_loc,bp_pri,bp_del,bp_upt,bp_dot,bp_text,mem_no FROM bproduct where bp_no=?";
	@Override
	public void insert(BpVO bpVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, bpVO.getBp_head());
			pstmt.setString(2, bpVO.getBpcl_no());
			pstmt.setString(3, bpVO.getBp_new());
			pstmt.setString(4, bpVO.getBp_loc());
			pstmt.setInt(5, bpVO.getBp_pri());
			pstmt.setString(6, bpVO.getBp_del());
			pstmt.setString(7, bpVO.getBp_text());
			pstmt.setDate(8, bpVO.getBp_dot());
			pstmt.setString(9, bpVO.getMem_no());
			pstmt.setBytes(10, bpVO.getBp_pic1());
			pstmt.setBytes(11, bpVO.getBp_pic2());
			pstmt.executeUpdate();
			
			
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public void update(BpVO bpVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, bpVO.getBp_head());
			pstmt.setString(2, bpVO.getBpcl_no());
			pstmt.setString(3, bpVO.getBp_new());
			pstmt.setString(4, bpVO.getBp_loc());
			pstmt.setInt(5, bpVO.getBp_pri());
			pstmt.setString(6, bpVO.getBp_del());
			pstmt.setString(7, bpVO.getBp_text());
			pstmt.setDate(8, bpVO.getBp_dot());
			pstmt.setString(9, bpVO.getBp_no());
			
			pstmt.executeUpdate();
			
	
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public void delete(String bp_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, bp_no);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public List<BpVO> getAll() {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
		
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bpVO =new BpVO();		
				bpVO.setBp_no(rs.getString("bp_no"));
				bpVO.setBp_head(rs.getString("bp_head"));
				bpVO.setBpcl_no(rs.getString("bpcl_no"));
				bpVO.setBp_new(rs.getString("bp_new"));
				bpVO.setBp_loc(rs.getString("bp_loc"));
				bpVO.setBp_pri(rs.getInt("bp_pri"));
				bpVO.setBp_del(rs.getString("bp_del"));
				bpVO.setBp_upt(rs.getDate("bp_upt"));
				bpVO.setBp_dot(rs.getDate("bp_dot"));
				bpVO.setBp_text(rs.getString("bp_text"));
				bpVO.setMem_no(rs.getString("mem_no"));
				
				list.add(bpVO);
				
			}
			
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
	public BpVO findByPrimaryKey(String bp_no) {
		
		BpVO bpVO = null ; 
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ONE);
			
			pstmt.setString(1, bp_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bpVO = new BpVO();
				
				bpVO.setBp_no(rs.getString("bp_no"));
				bpVO.setBp_head(rs.getString("bp_head"));
				bpVO.setBpcl_no(rs.getString("bpcl_no"));
				bpVO.setBp_new(rs.getString("bp_new"));
				bpVO.setBp_loc(rs.getString("bp_loc"));
				bpVO.setBp_pri(rs.getInt("bp_pri"));
				bpVO.setBp_del(rs.getString("bp_del"));
				bpVO.setBp_upt(rs.getDate("bp_upt"));
				bpVO.setBp_dot(rs.getDate("bp_dot"));
				bpVO.setBp_text(rs.getString("bp_text"));
				bpVO.setMem_no(rs.getString("mem_no"));
			}
			
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		
		
		
		
		return bpVO;
	}
	
	
	public static InputStream getPictureStream(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		return fis;
	}
	
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
	
	
	
	
	
	public static void main(String[] args) throws IOException {
		
		BpDAOJDBC dao =new BpDAOJDBC();
		
		BpVO bpVO = new BpVO();
		bpVO.setBp_head("00DOG");
		bpVO.setBpcl_no("02");
		bpVO.setBp_new("¥þ·s");
		bpVO.setBp_loc("¥x¥_¥«");
		bpVO.setBp_pri(new Integer(999));
		bpVO.setBp_del("¶l±H");
		bpVO.setBp_text("¥þ·s¥¼©î ¨S¦³Å²½à´Á");
		bpVO.setBp_dot(java.sql.Date.valueOf("2020-08-22"));
		bpVO.setMem_no("M099");
		byte[] pic = getPictureByteArray("img/1.jpg");
		bpVO.setBp_pic1(pic);
		byte[] pic1 = getPictureByteArray("img/2.jpg");
		bpVO.setBp_pic2(pic1);
		dao.insert(bpVO);
		
		
//		bpVO bpVO = new bpVO();
//		bpVO.setbp_head("§ó§ï´ú¸Õ");
//		bpVO.setbpcl_no("03");
//		bpVO.setbp_new("¤G¤â");
//		bpVO.setbp_loc("¤¤©M°Ï");
//		bpVO.setbp_pri(new Integer(800));
//		bpVO.setbp_del("¶]¨B°e");
//		bpVO.setbp_text("°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ°Õ");
//		bpVO.setbp_dot(java.sql.Date.valueOf("2020-10-28"));
//		bpVO.setbp_no("800021");
//		dao.update(bpVO);
		
//		dao.delete("800013");
		
//		List<bpVO> list = dao.getAll();
//		
//		for(bpVO bp : list) {
//			System.out.print(bp.getbp_no() + ",");
//			System.out.print(bp.getbp_head() + ",");
//			System.out.print(bp.getbpcl_no() + ",");
//			System.out.print(bp.getbp_new() + ",");
//			System.out.print(bp.getbp_loc() + ",");
//			System.out.print(bp.getbp_pri() + ",");
//			System.out.print(bp.getbp_del() + ",");
//			System.out.print(bp.getbp_upt() + ",");
//			System.out.print(bp.getbp_dot() + ",");
//			System.out.print(bp.getbp_text() + ",");
//			System.out.print(bp.getMem_no() + ",");
//			System.out.println();	
//		}
		
//		bpVO bpVO = dao.findByPrimaryKey("800024");
//		
//		System.out.print(bpVO.getbp_no() + ",");
//		System.out.print(bpVO.getbp_head() + ",");
//		System.out.print(bpVO.getbpcl_no() + ",");
//		System.out.print(bpVO.getbp_new() + ",");
//		System.out.print(bpVO.getbp_loc() + ",");
//		System.out.print(bpVO.getbp_pri() + ",");
//		System.out.print(bpVO.getbp_del() + ",");
//		System.out.print(bpVO.getbp_upt() + ",");
//		System.out.print(bpVO.getbp_dot() + ",");
//		System.out.print(bpVO.getbp_text() + ",");
//		System.out.print(bpVO.getMem_no() + ",");
//		System.out.println();
		
		
		
	}

	@Override
	public void update_status(BpVO bpVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void upload(String bp_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BpVO> findBymen_no(String men_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BpVO> findByhead(String men_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BpVO> getAllcanbuy() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update_buymem(BpVO bpVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BpVO> findBymensile(String men_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BpVO> findBymenbuy(String men_no) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
