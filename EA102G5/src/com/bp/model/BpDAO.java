package com.bp.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BpDAO implements BpDAO_interface {
	
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	
	private static final String INSERT_STMT =//�e�x�s�W	
	"INSERT INTO bproduct (bp_no,bp_head,bpcl_no,bp_new,bp_loc,bp_pri,bp_del,bp_text,bp_dot,MEM_NO,bp_pic1,bp_pic2,lat,lng) VALUES (bproduct_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE =//�e�x���
	"UPDATE bproduct set bp_head=?,bpcl_no=?,bp_new=?,bp_loc=?,bp_pri=?,bp_del=?,bp_text=?,bp_dot=?,bp_pic1=?,bp_pic2=?,lat=?,lng=? where bp_no = ? ";
	private static final String DELETE_DISPLAY =//��x�U�[
	"UPDATE bproduct set bpst_no = '�U�[' where bp_no = ?";
	private static final String UPLOAD_DISPLAY =//��x�W�[ 
	"UPDATE bproduct set bpst_no = '�W�[' where bp_no = ?";
	private static final String GET_ALL_CAN_BYE =//�e�x�ݥ����i�R	
	"SELECT * FROM bproduct where bpst_no ='�W�[' order by bp_no";
	private static final String GET_ALL_STMT =//��x�ݥ����ӫ~
	"SELECT * FROM bproduct order by bp_no desc";
	

	private static final String GET_ALL_MY_STMT =//�ڪ��ӫ~
	"SELECT * FROM bproduct where mem_no= ? order by bp_no DESC";
//	"SELECT * FROM(SELECT * FROM bproduct where mem_no= ? order by bp_no DESC) WHERE (BPST_NO LIKE'�W�['OR BPST_NO LIKE'�U�[' OR BPST_NO LIKE'�f�֤�')";
	
	private static final String GET_ALL_MY_SILE =//�ڪ��ӫ~�w�g��X
	"SELECT * FROM bproduct where mem_no= ? order by bp_no DESC";
//	"SELECT * FROM(SELECT * FROM bproduct where mem_no= ? order by bp_no DESC) WHERE (BPST_NO LIKE'�w�I��'OR BPST_NO LIKE'�w�X�f' OR BPST_NO LIKE'�w����')";
	
	private static final String GET_ALL_MY_BUY =//�ڪ��ӫ~�w�g��X
	"SELECT * FROM bproduct where buymem_no = ?";
	
	
	private static final String GET_ONE =//�d�@��
	"SELECT * FROM bproduct where bp_no=?";
	private static final String UPDATE_STATUS =//�窱�A
	"UPDATE bproduct set bpst_no = ? where bp_no = ?";
	private static final String UPDATE_Buymem =//�窱�A
	"UPDATE bproduct set buymem_no = ? where bp_no = ?";
	private static final String SELECT_NAME =//�ҽk�d��
	"SELECT * FROM bproduct WHERE  bpst_no ='�W�[' AND upper(bp_head) LIKE upper(?)"; 
	
	@Override
	public void insert(BpVO bpVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
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
			pstmt.setString(12, bpVO.getLat());
			pstmt.setString(13, bpVO.getLng());
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
	public void update(BpVO bpVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, bpVO.getBp_head());
			pstmt.setString(2, bpVO.getBpcl_no());
			pstmt.setString(3, bpVO.getBp_new());
			pstmt.setString(4, bpVO.getBp_loc());
			pstmt.setInt(5, bpVO.getBp_pri());
			pstmt.setString(6, bpVO.getBp_del());
			pstmt.setString(7, bpVO.getBp_text());
			pstmt.setDate(8, bpVO.getBp_dot());
			pstmt.setBytes(9, bpVO.getBp_pic1());
			pstmt.setBytes(10, bpVO.getBp_pic2());
			pstmt.setString(11, bpVO.getLat());
			pstmt.setString(12, bpVO.getLng());
			pstmt.setString(13, bpVO.getBp_no());

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
	public void delete(String bp_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_DISPLAY);
			
			
			pstmt.setString(1, bp_no);

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
	public void upload(String bp_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPLOAD_DISPLAY);
			
			pstmt.setString(1, bp_no);

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
	public List<BpVO> getAll() {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			con = ds.getConnection();
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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				
				list.add(bpVO);
				
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
	public List<BpVO> getAllcanbuy() {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_CAN_BYE);
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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				bpVO.setLat(rs.getString("lat"));
				bpVO.setLng(rs.getString("lng"));
				
				list.add(bpVO);
				
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
	public BpVO findByPrimaryKey(String bp_no) {
		
		BpVO bpVO = null ; 
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				bpVO.setBp_pic1(rs.getBytes("bp_pic1"));
				bpVO.setBp_pic2(rs.getBytes("bp_pic2"));
				bpVO.setLat(rs.getString("lat"));
				bpVO.setLng(rs.getString("lng"));
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

		return bpVO;
	}
	
	
	@Override
	public void update_status(BpVO bpVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);
			
			pstmt.setString(1, bpVO.getBpst_no());
			pstmt.setString(2, bpVO.getBp_no());
			
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
	public void update_buymem(BpVO bpVO) {
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_Buymem);
			
			pstmt.setString(1, bpVO.getBuymem_no());
			pstmt.setString(2, bpVO.getBp_no());
			
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


	public List<BpVO> findBymen_no(String mem_no) {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MY_STMT);
			
			pstmt.setString(1, mem_no);
			
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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				bpVO.setBuymem_no(rs.getString("buymem_no"));
				bpVO.setLat(rs.getString("lat"));
				bpVO.setLng(rs.getString("lng"));
				
				
				list.add(bpVO);
				
			
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

		return list.stream()
				.filter(p -> !p.getBpst_no().equals("�w�X�f"))
				.filter(p -> !p.getBpst_no().equals("�w����"))
				.filter(p -> !p.getBpst_no().equals("�w�I��"))
				 .collect(Collectors.toList());
	}
	public List<BpVO> findBymensile(String mem_no) {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MY_SILE);
			
			pstmt.setString(1, mem_no);
			
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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				bpVO.setBuymem_no(rs.getString("buymem_no"));
				bpVO.setLat(rs.getString("lat"));
				bpVO.setLng(rs.getString("lng"));
				
				list.add(bpVO);
				
				
				
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

		return list.stream()
				.filter(p -> !p.getBpst_no().equals("�W�["))
				.filter(p -> !p.getBpst_no().equals("�U�["))
				.filter(p -> !p.getBpst_no().equals("�f�֤�"))
				 .collect(Collectors.toList());
	}
	public List<BpVO> findBymenbuy(String mem_no) {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MY_BUY);
			
			pstmt.setString(1, mem_no);
			
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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				bpVO.setBuymem_no(rs.getString("buymem_no"));
				bpVO.setLat(rs.getString("lat"));
				bpVO.setLng(rs.getString("lng"));
				
				list.add(bpVO);
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
	
	public List<BpVO> findByhead(String head) {
		List<BpVO> list = new ArrayList<BpVO>();
		BpVO bpVO = null ; 
		
		Connection con = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_NAME);

			pstmt.setString(1, head);

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
				bpVO.setBpst_no(rs.getString("bpst_no"));
				bpVO.setLat(rs.getString("lat"));
				bpVO.setLng(rs.getString("lng"));
				
				
				list.add(bpVO);
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
//		BpDAO dao =new BpDAO();
//		BpVO bpVO = new BpVO();
//		
//		
//		bpVO.setBp_head("�ڬO��6666666666666666");
//		bpVO.setBpcl_no("02");
//		bpVO.setBp_new("���s");
//		bpVO.setBp_loc("�x�_��");
//		bpVO.setBp_pri(new Integer(8000));
//		bpVO.setBp_del("�l�H");
//		bpVO.setBp_text("���s���� �S��Ų���");
//		bpVO.setBp_dot(java.sql.Date.valueOf("2020-08-22"));
//		bpVO.setMem_no("M099");
//		byte[] pic = getPictureByteArray("img/1.jpg");
//		bpVO.setBp_pic1(pic);
//		byte[] pic1 = getPictureByteArray("img/2.jpg");
//		bpVO.setBp_pic2(pic1);
//		dao.insert(bpVO);
//			
//		bpVO.setBp_head("������");
//		bpVO.setBpcl_no("03");
//		bpVO.setBp_new("�G��");
//		bpVO.setBp_loc("���M��");
//		bpVO.setBp_pri(new Integer(800));
//		bpVO.setBp_del("�]�B�e");
//		bpVO.setBp_text("�հհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհհ�");
//		bpVO.setBp_dot(java.sql.Date.valueOf("2020-10-28"));
//		bpVO.setBp_no("800021");
//		dao.update(bpVO);		
//		dao.delete("800013");	
		
//		List<BpVO> list = dao.getAll();
//		for(BpVO bp : list) {
//			System.out.print(bp.getBp_no() + ",");
//			System.out.print(bp.getBp_head() + ",");
//			System.out.print(bp.getBpcl_no() + ",");
//			System.out.print(bp.getBp_new() + ",");
//			System.out.print(bp.getBp_loc() + ",");
//			System.out.print(bp.getBp_pri() + ",");
//			System.out.print(bp.getBp_del() + ",");
//			System.out.print(bp.getBp_upt() + ",");
//			System.out.print(bp.getBp_dot() + ",");
//			System.out.print(bp.getBp_text() + ",");
//			System.out.print(bp.getMem_no() + ",");
//			System.out.println();	
//		}
//		
//		List<BpVO> list = dao.findBymen_no("M0001");
//		for(BpVO bp : list) {
//		System.out.print(bp.getBp_no() + ",");
//		System.out.print(bp.getBp_head() + ",");
//		System.out.print(bp.getBpcl_no() + ",");
//		System.out.print(bp.getBp_new() + ",");
//		System.out.print(bp.getBp_loc() + ",");
//		System.out.print(bp.getBp_pri() + ",");
//		System.out.print(bp.getBp_del() + ",");
//		System.out.print(bp.getBp_upt() + ",");
//		System.out.print(bp.getBp_dot() + ",");
//		System.out.print(bp.getBp_text() + ",");
//		System.out.print(bp.getMem_no() + ",");
//		System.out.println();	
//	}
//		
//		bpVO = dao.findByPrimaryKey("800001");
//		
//		System.out.print(bpVO.getBp_no() + ",");
//		System.out.print(bpVO.getBp_head() + ",");
//		System.out.print(bpVO.getBpcl_no() + ",");
//		System.out.print(bpVO.getBp_new() + ",");
//		System.out.print(bpVO.getBp_loc() + ",");
//		System.out.print(bpVO.getBp_pri() + ",");
//		System.out.print(bpVO.getBp_del() + ",");
//		System.out.print(bpVO.getBp_upt() + ",");
//		System.out.print(bpVO.getBp_dot() + ",");
//		System.out.print(bpVO.getBp_text() + ",");
//		System.out.print(bpVO.getMem_no() + ",");
//		System.out.println();
//		
//		List<BpVO> list = dao.findByhead("%aK%");
//		for(BpVO bp : list) {
//		System.out.print(bp.getBp_no() + ",");
//		System.out.print(bp.getBp_head() + ",");
//		System.out.print(bp.getBpcl_no() + ",");
//		System.out.print(bp.getBp_new() + ",");
//		System.out.print(bp.getBp_loc() + ",");
//		System.out.print(bp.getBp_pri() + ",");
//		System.out.print(bp.getBp_del() + ",");
//		System.out.print(bp.getBp_upt() + ",");
//		System.out.print(bp.getBp_dot() + ",");
//		System.out.print(bp.getBp_text() + ",");
//		System.out.print(bp.getMem_no() + ",");
//		System.out.println();	
//	}
//		
//		
//		
//		
//	}

	
}
