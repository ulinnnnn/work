package com.cptrack.model;

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

public class CptrackDAO implements CptrackDAO_interface{
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
	private static final String INSERT_STMT = "INSERT INTO cp_track (MEM_No,cp_No) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Cpclass";
	private static final String GET_ONE_STMT = "SELECT MEM_No,cp_No FROM cp_track where MEM_No= ?";
	private static final String DELETE= "DELETE FROM cp_track where cp_No= ? AND MEM_No= ?";	
	private static final String GETONE= "SELECT MEM_No,cp_No FROM cp_track where cp_No= ? AND MEM_No= ?";	
	private static final String UPDATE = "UPDATE cpClass set cpClass_No=?,cpClass=?where cpClass_No=?";


	@Override
	public void insert(CptrackVO CpclassVO) {
		java.sql.Connection con=null;
		PreparedStatement pstmt = null;
		
		
			
        if(ds!=null) {
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);		       
		        pstmt.setString(1,CpclassVO.getMEM_No());
		        pstmt.setString(2,CpclassVO.getCp_No());
		        pstmt.executeUpdate();
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
	public void update(CptrackVO CptrackVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			   pstmt.setString(1,CptrackVO.getCp_No());
	           pstmt.setString(2,CptrackVO.getMEM_No());
	           
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
	public void delete(String Cp_NO,String Mem_NO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,Cp_NO);
			pstmt.setString(2,Mem_NO);
			

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
	public CptrackVO getone(String Cp_NO,String Mem_NO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		CptrackVO CptrackVO = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETONE);

			pstmt.setString(1,Cp_NO);
			pstmt.setString(2,Mem_NO);
			

			rs=pstmt.executeQuery();
			System.out.println("-----------------有查詢");
			CptrackVO = null;
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				System.out.println("-------------有得到");
				CptrackVO = new CptrackVO();
				CptrackVO.setMEM_No(rs.getString("MEM_No"));
				CptrackVO.setCp_No(rs.getString("CP_NO"));
				System.out.println(CptrackVO.getCp_No());
				System.out.println(CptrackVO.getMEM_No());
			}
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
		return CptrackVO;
	
		
	}
	
	
	
	@Override
	public List<CptrackVO> getAll() {
		// TODO Auto-generated method stub
		List<CptrackVO> list = new ArrayList<CptrackVO>();
		CptrackVO CptrackVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				CptrackVO = new CptrackVO();
				CptrackVO.setCp_No(rs.getString("CP_NO"));
				CptrackVO.setMEM_No(rs.getString("MEM_No"));
				   
				   
				  
					   
						
		           list.add(CptrackVO);
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
	public List<CptrackVO> findByPrimaryKey(String MEM_No) {
		CptrackVO CpclassVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
        List<CptrackVO> list=new ArrayList<CptrackVO>();
		try {
			System.out.println("正常3");
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,MEM_No);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				CpclassVO= new CptrackVO();
				CpclassVO.setCp_No(rs.getString("CP_NO"));
				CpclassVO.setMEM_No(rs.getString("MEM_No"));
				list.add(CpclassVO);
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
		return list;
	}

}
