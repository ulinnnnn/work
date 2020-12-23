package com.cpclass.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cproduct.model.CproductDAO_interface;
import com.cproduct.model.CproductVO;

public class CpclassDAO implements CpclassDAO_interface{
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
	private static final String INSERT_STMT = "INSERT INTO Cpclass (cpClass_No,cpClass) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Cpclass";
	private static final String GET_ONE_STMT = "SELECT cpClass_No,Cpclass FROM Cpclass where cpClass_No= ?";
	private static final String DELETE= "DELETE FROM Cpclass where cpClass_No= ?";	
	
	private static final String UPDATE = "UPDATE cpClass set cpClass_No=?,cpClass=?where cpClass_No=?";


	@Override
	public void insert(CpclassVO CpclassVO) {
		java.sql.Connection con=null;
		PreparedStatement pstmt = null;
		
		
			
        if(ds!=null) {
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);
		        pstmt.setString(1,CpclassVO.getCpClass_No());
		        pstmt.setString(2,CpclassVO.getCpClass());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
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

	@Override
	public void update(CpclassVO CpclassVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			   pstmt.setString(1,CpclassVO.getCpClass_No());
	           pstmt.setString(2,CpclassVO.getCpClass());
	           
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
	public void delete(String Cpclass_NO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,Cpclass_NO);

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

	@Override
	public List<CpclassVO> getAll() {
		// TODO Auto-generated method stub
		List<CpclassVO> list = new ArrayList<CpclassVO>();
		CpclassVO CpclassVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				CpclassVO = new CpclassVO();
				CpclassVO.setCpClass_No(rs.getString("CPCLASS_NO"));
				CpclassVO.setCpClass(rs.getString("CPCLASS"));
				   
				   
				  
					   
						
		           list.add(CpclassVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}   finally {
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
	public CpclassVO findByPrimaryKey(String CpClass_No) {
		CpclassVO CpclassVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,CpClass_No);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				CpclassVO= new CpclassVO();
				CpclassVO.setCpClass_No(rs.getString("CPCLASS_NO"));
				CpclassVO.setCpClass(rs.getString("CPCLASS"));
				   
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
		return CpclassVO;
	}

}
