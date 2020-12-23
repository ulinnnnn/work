package com.cpmessage.model;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.mysql.jdbc.Blob;



public class CpmessageDAO implements CpmessageDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
	}
	private static final String INSERT_STMT = "INSERT INTO Cpmessage (cpme_No,cp_No,cpreme_No,mem_No,cpme) VALUES (Cpmessage_SEQ.NEXTVAL,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Cpmessage";
	private static final String GET_ONE_STMT = "SELECT CP_NO,cpme_No,cpreme_No,mem_No,cpme FROM Cpmessage where cp_No= ?";
	private static final String DELETE= "DELETE FROM Cpmessage where cpme_No= ?";	
	
	private static final String UPDATE = "UPDATE Cpmessage set cp_No=?,cpreme_No=?,mem_No=?,cpme=? where cpme_No=?";

	


	
	


	@Override
	public void update(CpmessageVO CpmessageVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			   pstmt.setString(1,CpmessageVO.getCp_No());
	           pstmt.setString(2,CpmessageVO.getCpreme_No());
	           pstmt.setString(3,CpmessageVO.getMem_No());
	           pstmt.setString(4,CpmessageVO.getCpme());
			   pstmt.setString(5,CpmessageVO.getCpme_No());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}  finally {
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
	public void delete(String Cpme_No) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,Cpme_No);

			pstmt.executeUpdate();

			// Handle any driver errors
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

	public CpmessageVO findByPrimaryKey(String Cp_No) {
		// TODO Auto-generated method stub
		CpmessageVO CpmessageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,Cp_No);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				   CpmessageVO = new CpmessageVO();
				   CpmessageVO.setCp_No(rs.getString("CP_NO"));
				   CpmessageVO.setCpme_No(rs.getString("cpme_No"));
				   CpmessageVO.setCpreme_No(rs.getString("cpreme_No"));
				   CpmessageVO.setMem_No(rs.getString("MEM_NO"));
				   CpmessageVO.setCpme(rs.getString("cpme"));
				   
				  
				   
				  
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} 
		    finally {
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
		return CpmessageVO;
	}

	@Override
	public List<CpmessageVO> getAll() {
		// TODO Auto-generated method stub
		List<CpmessageVO> list = new ArrayList<CpmessageVO>();
		CpmessageVO CpmessageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			java.sql.Blob blob = con.createBlob();
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				   CpmessageVO = new CpmessageVO();
				   CpmessageVO.setCp_No(rs.getString("CP_NO"));
				   CpmessageVO.setCpme_No(rs.getString("cpme_No"));
				   CpmessageVO.setCpreme_No(rs.getString("cpreme_No"));
				   CpmessageVO.setMem_No(rs.getString("MEM_NO"));
				   CpmessageVO.setCpme(rs.getString("cpme"));

		           list.add(CpmessageVO);
			}

			// Handle any driver errors
		 }catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}    finally {
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
	public void insert(CpmessageVO CpmessageVO) {
		java.sql.Connection con=null;
		PreparedStatement pstmt = null;
		
		try {
			
           if(ds!=null) 
			con = ds.getConnection();
           
           pstmt = con.prepareStatement(INSERT_STMT);
           pstmt.setString(1,CpmessageVO.getCp_No());
           pstmt.setString(2,CpmessageVO.getCpreme_No());
           pstmt.setString(3,CpmessageVO.getMem_No());
           pstmt.setString(4,CpmessageVO.getCpme());
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


}
