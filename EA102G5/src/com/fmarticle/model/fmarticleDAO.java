package com.fmarticle.model;

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

import com.fmarticle.model.fmarticleVO;


public class fmarticleDAO implements fmarticleDAO_I {
	

//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String userid = "EA102G5";
//	String userpsd = "123456";
	
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	
	private static final String INSERT_STMT=	//新增文章
			"INSERT INTO fmarticle(fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_pic1,fm_pic2) VALUES (fmarticle_seq.NEXTVAL,?,?,?,?,?,?) ";
//	"INSERT INTO fmarticle(fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_pic1,fm_pic2,fm_pic3) VALUES ('f' || lpad(fmarticle_seq.NEXTVAL,3,'0'),?,?,?,?,?,?,?) ";
			private static final String UPDATE=		//修改文章
					"UPDATE fmarticle set fm_head=? , fm_text=? , fmcl_no=? , fm_pic1=? , fm_pic2=? where fm_no = ? ";
//			"UPDATE fmarticle set fm_head=? , fm_text=? , fmcl_no=? , fm_pic1=? , fm_pic2=? , fm_pic3=? where fm_no = ? ";
			private static final String DELETE=		//刪除文章
					"delete from fmarticle where fm_no = ?";
			private static final String GET_ALL_MY_STMT =	//我的文章
			"SELECT fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_ti,fm_pic1,fm_pic2 FROM fmarticle where mem_no=?";
//			"SELECT fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_ti,fm_pic1,fm_pic2,fm_pic3 FROM fmarticle where mem_no=?";
			private static final String GET_ALL_BY_FMCLASS =	//前台看該類別全部文章
					"SELECT fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_ti,fm_pic1,fm_pic2 FROM fmarticle where fmcl_no =? order by fm_no";
//			"SELECT fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_ti,fm_pic1,fm_pic2,fm_pic3 FROM fmarticle where fmcl_no =? order by fm_no";
			private static final String GET_ONE =	//查一個
			"SELECT * FROM fmarticle where fm_no=?";
			private static final String SELECT_NAME =	//模糊查詢
			"SELECT * FROM fmarticle WHERE upper(fm_head) LIKE upper(?)"; 
	
//	@Override
//	public void insert(fmarticleVO fmarticleVO) {
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpsd);
//			pstmt = conn.prepareStatement(
//					"insert into fmarticle (fm_no, fm_head, fm_text) "
//					+ "values (('f' || lpad(fmarticle_seq.NEXTVAL,3,'0')), ? ,?)"
//					);
//				
//			pstmt.setString(1, fmarticleVO.getfm_head());
//			pstmt.setString(2, fmarticleVO.getfm_text());
//			
//			pstmt.executeUpdate();
//
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("無法載入資料庫驅動 "
//					+ e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("資料庫發生錯誤 "
//					+ se.getMessage());		
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//
//	@Override
//	public void update(fmarticleVO fmarticleVO) {
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpsd);
//			pstmt = conn.prepareStatement(
//					"update fmarticle set fm_head=? , fm_text=? where fm_no=?"
//					);
//
//			pstmt.setString(1, fmarticleVO.getfm_head());
//			pstmt.setString(2, fmarticleVO.getfm_text());
//			
//			pstmt.setString(3, fmarticleVO.getfm_no());
//			
//			pstmt.executeUpdate();
//
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("無法載入資料庫驅動 "
//					+ e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("資料庫發生錯誤 "
//					+ se.getMessage());		
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//	
//	@Override
//	public void delete(String fmarticleVO) {
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpsd);
//			pstmt = conn.prepareStatement(
//					"delete from fmarticle where fm_no = ?"
//					);
//
//			pstmt.setString(1, fmarticleVO);
//			
//			pstmt.executeUpdate();
//
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("無法載入資料庫驅動 "
//					+ e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("資料庫發生錯誤 "
//					+ se.getMessage());		
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//	
//	@Override
//	public fmarticleVO getOne(String fm_no) {
//		fmarticleVO fmarticleVO = new fmarticleVO();;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpsd);
//			pstmt = conn.prepareStatement(
//					"select fm_no, fm_head, fm_text from fmarticle where fm_no=?"
//					);
//
//			pstmt.setString(1, fm_no);
//			
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//			
//				fmarticleVO.setfm_no(rs.getString("fm_no"));
//				fmarticleVO.setfm_head(rs.getString("fm_head"));
//				fmarticleVO.setfm_text(rs.getString("fm_text"));
//			}
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("無法載入資料庫驅動 "
//					+ e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("資料庫發生錯誤 "
//					+ se.getMessage());		
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return fmarticleVO;
//	}
//	
	@Override
	public List<fmarticleVO> getAll(){
		List<fmarticleVO> list = new ArrayList<fmarticleVO>();
		
//		FuncVO funcVO = new FuncVO();
		fmarticleVO fmarticleVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select * from fmarticle"
					);
	
			rs = pstmt.executeQuery();

			while(rs.next()) {
				fmarticleVO = new fmarticleVO();
				fmarticleVO.setFm_no(rs.getString("fm_no"));
				fmarticleVO.setFmcl_no(rs.getString("fmcl_no"));
				fmarticleVO.setFm_head(rs.getString("fm_head"));
				fmarticleVO.setFm_text(rs.getString("fm_text"));
				fmarticleVO.setMem_no(rs.getString("mem_no"));
				fmarticleVO.setFm_ti(rs.getDate("fm_ti"));
			    list.add(fmarticleVO);
			}
		
		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());		
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
		
	
	@Override
	public void insert(fmarticleVO fmarticleVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
//			INSERT INTO fmarticle
//			(fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_pic1,fm_pic2,fm_pic3) VALUES ('f' || lpad(fmarticle_seq.NEXTVAL,3,'0'),?,?,?,?,?,?,?) ";
			pstmt.setString(1, fmarticleVO.getFm_head());
			pstmt.setString(2, fmarticleVO.getFm_text());
			pstmt.setString(3, fmarticleVO.getMem_no());
			pstmt.setString(4, fmarticleVO.getFmcl_no());
			pstmt.setBytes(5, fmarticleVO.getFm_pic1());
			pstmt.setBytes(6, fmarticleVO.getFm_pic2());
//			pstmt.setBytes(7, fmarticleVO.getFm_pic3());
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
	public void update(fmarticleVO fmarticleVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
//			"UPDATE fmarticle set fm_head=? , fm_text=? , fmcl_no=? , fm_pic1=? , fm_pic2=? , fm_pic3=? where fm_no = ? ";
			pstmt.setString(1, fmarticleVO.getFm_head());
			pstmt.setString(2, fmarticleVO.getFm_text());
			pstmt.setString(3, fmarticleVO.getFmcl_no());
			pstmt.setBytes(4, fmarticleVO.getFm_pic1());
			pstmt.setBytes(5, fmarticleVO.getFm_pic2());
//			pstmt.setBytes(6, fmarticleVO.getFm_pic3());
			pstmt.setString(6, fmarticleVO.getFm_no());
//			pstmt.setString(7, fmarticleVO.getFm_no());

			
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
	public void delete(String fm_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		System.out.println("11111");
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			System.out.println("22222");
			
			pstmt.setString(1, fm_no);

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
	public fmarticleVO getOne(String fm_no) {
//		private static final String GET_ONE =	//查一個
//				"SELECT * FROM fmarticle where fm_no=?";
		fmarticleVO fmarticleVO = null ; 
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);
			
			pstmt.setString(1, fm_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				fmarticleVO = new fmarticleVO();
				
				fmarticleVO.setFm_no(rs.getString("fm_no"));
				fmarticleVO.setFm_head(rs.getString("fm_head"));
				fmarticleVO.setFm_text(rs.getString("fm_text"));
				fmarticleVO.setMem_no(rs.getString("mem_no"));
				fmarticleVO.setFmcl_no(rs.getString("fmcl_no"));
				fmarticleVO.setFm_ti(rs.getDate("fm_ti"));
				fmarticleVO.setFm_pic1(rs.getBytes("fm_pic1"));
				fmarticleVO.setFm_pic2(rs.getBytes("fm_pic2"));
//				fmarticleVO.setFm_pic3(rs.getBytes("fm_pic3"));
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

		return fmarticleVO;
	}



	@Override
	public List<fmarticleVO> getfmclAll(String fmcl_no) {
//		private static final String GET_ALL_BY_FMCLASS =	//前台看該類別全部文章
//		"SELECT fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_ti,fm_pic1,fm_pic2,fm_pic3 FROM fmarticle where fmcl_no =? order by fm_no";
		List<fmarticleVO> list = new ArrayList<fmarticleVO>();
		fmarticleVO fmarticleVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_FMCLASS);
			
			pstmt.setString(1, fmcl_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fmarticleVO = new fmarticleVO();
				
				fmarticleVO.setFm_no(rs.getString("fm_no"));
				fmarticleVO.setFm_head(rs.getString("fm_head"));
				fmarticleVO.setFm_text(rs.getString("fm_text"));
				fmarticleVO.setMem_no(rs.getString("mem_no"));
				fmarticleVO.setFmcl_no(rs.getString("fmcl_no"));
				fmarticleVO.setFm_ti(rs.getDate("fm_ti"));
				fmarticleVO.setFm_pic1(rs.getBytes("fm_pic1"));
				fmarticleVO.setFm_pic2(rs.getBytes("fm_pic2"));
//				fmarticleVO.setFm_pic3(rs.getBytes("fm_pic3"));
				
				
				list.add(fmarticleVO);
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
	public List<fmarticleVO> getmemAll(String mem_no) {
//		private static final String GET_ALL_MY_STMT =	//我的文章
//		"SELECT fm_no,fm_head,fm_text,mem_no,fmcl_no,fm_ti,fm_pic1,fm_pic2,fm_pic3 FROM fmarticle where mem_no=?";
		List<fmarticleVO> list = new ArrayList<fmarticleVO>();
		fmarticleVO fmarticleVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MY_STMT);
			
			pstmt.setString(1, mem_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fmarticleVO = new fmarticleVO();
				
				fmarticleVO.setFm_no(rs.getString("fm_no"));
				fmarticleVO.setFm_head(rs.getString("fm_head"));
				fmarticleVO.setFm_text(rs.getString("fm_text"));
				fmarticleVO.setMem_no(rs.getString("mem_no"));
				fmarticleVO.setFmcl_no(rs.getString("fmcl_no"));
				fmarticleVO.setFm_ti(rs.getDate("fm_ti"));
				fmarticleVO.setFm_pic1(rs.getBytes("fm_pic1"));
				fmarticleVO.setFm_pic2(rs.getBytes("fm_pic2"));
//				fmarticleVO.setFm_pic3(rs.getBytes("fm_pic3"));
				
				list.add(fmarticleVO);
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
	public List<fmarticleVO> search(String head) {
//		private static final String SELECT_NAME =	//模糊查詢
//				"SELECT * FROM fmarticle WHERE upper(fm_head) LIKE upper(?)"; 
		
		List<fmarticleVO> list = new ArrayList<fmarticleVO>();
		fmarticleVO fmarticleVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_NAME);

			pstmt.setString(1, head);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fmarticleVO = new fmarticleVO();
				
				fmarticleVO.setFm_no(rs.getString("fm_no"));
				fmarticleVO.setFm_head(rs.getString("fm_head"));
				fmarticleVO.setFm_text(rs.getString("fm_text"));
				fmarticleVO.setMem_no(rs.getString("mem_no"));
				fmarticleVO.setFmcl_no(rs.getString("fmcl_no"));
				fmarticleVO.setFm_ti(rs.getDate("fm_ti"));
				fmarticleVO.setFm_pic1(rs.getBytes("fm_pic1"));
				fmarticleVO.setFm_pic2(rs.getBytes("fm_pic2"));
//				fmarticleVO.setFm_pic3(rs.getBytes("fm_pic3"));
				
				
				
				list.add(fmarticleVO);
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
//		fmarticleDAO dao = new fmarticleDAO();
		
		//新增測試
//		fmarticleVO fmarticleVO1 = new fmarticleVO();
//		
//		fmarticleVO1.setfm_head("嘴砲奧義：嘴爆客戶");
//		fmarticleVO1.setfm_text("可以直接對客戶開噴，並開放使用三字經攻擊");
//		dao.insert(fmarticleVO1);
		
		//修改測試
//		fmarticleVO fmarticleVO2 = new fmarticleVO();
//		fmarticleVO2.setfm_no("f002");
//		fmarticleVO2.setfm_head("審核點數提款");
//		fmarticleVO2.setfm_text("管理員可發動內鬼技能，直接把會員點數轉到自己帳戶，而且不被發現");
//		dao.update(fmarticleVO2);
		
//		//刪除測試
//		dao.delete("f002");
				
//		//查詢單筆		
//		fmarticleVO fmarticleVO3 = dao.getOne("f003");
//		System.out.println(fmarticleVO3.getfm_head());
//		System.out.println(fmarticleVO3.getfm_text());
//		
//		//查詢全部
//		List<fmarticleVO> list1 = dao.getAll();
//		for(fmarticleVO funcV : list1) {
//			System.out.println(funcV.getfm_no());
//			System.out.println(funcV.getfm_head());
//			System.out.println(funcV.getfm_text());
//		}
				
//	}

}
