package com.CPREPORT.model;

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



public class CpreportDAO implements CpreportDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			
				ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
	}
	private static final String INSERT_STMT = "INSERT INTO Cpreport (cprp_No,cp_No,cprp_State,mem_No,emp_NO,cprp_time) VALUES (Cpreport_SEQ.NEXTVAL,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Cpreport";
	private static final String GET_ONE_STMT = "SELECT CP_NO,cprp_No,cprp_State,mem_No,emp_NO,cprp_time FROM Cpreport where cp_No= ?";
	private static final String DELETE= "DELETE FROM Cpreport where cp_No= ?";	
	
	private static final String UPDATE = "UPDATE Cpreport set cprp_No=?,cprp_State=?,mem_No=?,emp_NO=?,cprp_time=? where cp_No= ?";

	


	
	


	@Override
	public void update(CpreportVO CpreportVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			   pstmt.setString(1,CpreportVO.getCprp_No());
	           pstmt.setString(2,CpreportVO.getCprp_State());
	           pstmt.setString(3,CpreportVO.getMem_No());
	           pstmt.setString(4,CpreportVO.getEmp_NO());
	           
	           
	           pstmt.setTimestamp(5,CpreportVO.getCprp_time());
	           
	           
				pstmt.setString(6,CpreportVO.getCp_No());
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
	public void delete(String Cp_No) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,Cp_No);

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

	public CpreportVO findByPrimaryKey(String Cp_No) {
		// TODO Auto-generated method stub
		CpreportVO CpreportVO = null;
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
				   CpreportVO = new CpreportVO();
				   CpreportVO.setCp_No(rs.getString("CP_NO"));
				   CpreportVO.setCprp_No(rs.getString("cprp_No"));
				   CpreportVO.setCprp_State(rs.getString("cprp_State"));
				   CpreportVO.setMem_No(rs.getString("MEM_NO"));
				   CpreportVO.setEmp_NO(rs.getString("EMP_NO"));
				   
				   CpreportVO.setCprp_time(rs.getTimestamp("cprp_time"));
				   
				  
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
		return CpreportVO;
	}

	@Override
	public List<CpreportVO> getAll() {
		// TODO Auto-generated method stub
		List<CpreportVO> list = new ArrayList<CpreportVO>();
		CpreportVO CpreportVO = null;
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
				   CpreportVO = new CpreportVO();
				   CpreportVO.setCp_No(rs.getString("CP_NO"));
				   CpreportVO.setCprp_No(rs.getString("cprp_No"));
				   CpreportVO.setCprp_State(rs.getString("cprp_State"));
				   CpreportVO.setMem_No(rs.getString("MEM_NO"));
				   CpreportVO.setEmp_NO(rs.getString("EMP_NO"));
				   
				   CpreportVO.setCprp_time(rs.getTimestamp("cprp_time"));
				   
				   
				   
				  
					   
						
		           list.add(CpreportVO);
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
	public void insert(CpreportVO CpreportVO) {
		java.sql.Connection con=null;
		PreparedStatement pstmt = null;
		
		try {
			
           if(ds!=null) 
			con = ds.getConnection();
           
           pstmt = con.prepareStatement(INSERT_STMT);
           pstmt.setString(1,CpreportVO.getCp_No());
           pstmt.setString(2,CpreportVO.getCprp_State());
           pstmt.setString(3,CpreportVO.getMem_No());
           pstmt.setString(4,CpreportVO.getEmp_NO());
           
           pstmt.setTimestamp(5,CpreportVO.getCprp_time());
           
           
			
           

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
