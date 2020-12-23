package com.CPRECORD.model;

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

import com.cproduct.model.CproductVO;
import com.mysql.jdbc.Blob;



public class CprecordDAO implements CprecordDAO_interface{
	
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
	private static final String INSERT_STMT = "INSERT INTO Cprecord (cp_No1,cpr_No,cp_No2,mem_No1,mem_No2,cpc_Time,cprstate) VALUES (?,Cprecord_SEQ.NEXTVAL,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Cprecord";
	private static final String GET_ONE_STMT1 = "SELECT CP_NO1,cpr_No,cp_No2,mem_No1,mem_No2,cpc_Time,cprstate FROM Cprecord  where mem_No1= ? order by cpc_Time desc";
	private static final String GET_ONE_STMT2 = "SELECT CP_NO1,cpr_No,cp_No2,mem_No1,mem_No2,cpc_Time,cprstate FROM Cprecord  where mem_No2= ? order by cpc_Time desc";
	private static final String GET_ONE_STMT3 = "SELECT CP_NO1,cpr_No,cp_No2,mem_No1,mem_No2,cpc_Time,cprstate FROM Cprecord  where cpr_No= ?";
//	private static final String GET_ONE_STMT = "SELECT CP_NO1,cpr_No,cp_No2,mem_No1,mem_No2,cpc_Time,Cproduct.cpname,cptext FROM Cprecord  FULL  JOIN Cproduct ON Cprecord.CP_NO1=Cproduct.CP_NO  where mem_No2= ? order by cpc_Time";	
	private static final String DELETE= "DELETE FROM Cprecord where cp_No= ?";		
	private static final String UPDATE = "UPDATE Cprecord set cpr_No=?,cp_No2=?,mem_No=?,mem_No2=?,cpc_Time=? where cp_No= ?";
	private static final String changestate = "UPDATE Cprecord set cprState=? where cpr_No= ?";
	private static final String UPDATEALL = "UPDATE Cprecord set cprState=? where cp_No2= ?";
	
	@Override
	public void updateall(String Cprstate,String Cp_No) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEALL);
			pstmt.setString(1,Cprstate);
			pstmt.setString(2,Cp_No);

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
	public void changestate(String Cprstate,String Cpr_No) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(changestate);
			pstmt.setString(1,Cprstate);
			pstmt.setString(2,Cpr_No);

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
	public void update(CprecordVO CprecordVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			   pstmt.setString(1,CprecordVO.getCpr_No());
	           pstmt.setString(2,CprecordVO.getCp_No2());
	           pstmt.setString(3,CprecordVO.getMem_No1());
	           pstmt.setString(4,CprecordVO.getMem_No2());
	           
	           
	           pstmt.setTimestamp(5,CprecordVO.getCpc_time());
	           
	           
				pstmt.setString(6,CprecordVO.getCp_No1());
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

	public List<CprecordVO> findCprecordByMEM2(String mem_No2) {
		// TODO Auto-generated method stub
		CprecordVO CprecordVO = null;
		CproductVO CproductVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CprecordVO> list = new ArrayList<CprecordVO>();
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT2);

			pstmt.setString(1,mem_No2);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]붙О Domain objects
				   CprecordVO = new CprecordVO();
				   CprecordVO.setCp_No1(rs.getString("CP_NO1"));
				   CprecordVO.setCpr_No(rs.getString("cpr_No"));
				   CprecordVO.setCp_No2(rs.getString("cp_No2"));
				   CprecordVO.setMem_No1(rs.getString("MEM_NO1"));
				   CprecordVO.setMem_No2(rs.getString("mem_No2"));
				   CprecordVO.setCprstate(rs.getString("Cprstate"));
				   CprecordVO.setCpc_time(rs.getTimestamp("cpc_Time"));
				   list.add(CprecordVO);
				  
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
	public List<CprecordVO> findCprecordByMEM1(String mem_No1) {
		// TODO Auto-generated method stub
		CprecordVO CprecordVO = null;
		CproductVO CproductVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CprecordVO> list = new ArrayList<CprecordVO>();
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT1);

			pstmt.setString(1,mem_No1);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]붙О Domain objects
				   CprecordVO = new CprecordVO();
				   CprecordVO.setCp_No1(rs.getString("CP_NO1"));
				   CprecordVO.setCpr_No(rs.getString("cpr_No"));
				   CprecordVO.setCp_No2(rs.getString("cp_No2"));
				   CprecordVO.setMem_No1(rs.getString("MEM_NO1"));
				   CprecordVO.setMem_No2(rs.getString("mem_No2"));
				   CprecordVO.setCprstate(rs.getString("Cprstate"));
				   CprecordVO.setCpc_time(rs.getTimestamp("cpc_Time"));
				   list.add(CprecordVO);
				  
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
	
	public CprecordVO findCprecordBycpr_no(String cpr_no) {
		// TODO Auto-generated method stub
		CprecordVO CprecordVO = null;
		CproductVO CproductVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CprecordVO> list = new ArrayList<CprecordVO>();
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT3);

			pstmt.setString(1,cpr_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]붙О Domain objects
				   CprecordVO = new CprecordVO();
				   CprecordVO.setCp_No1(rs.getString("CP_NO1"));
				   CprecordVO.setCpr_No(rs.getString("cpr_No"));
				   CprecordVO.setCp_No2(rs.getString("cp_No2"));
				   CprecordVO.setMem_No1(rs.getString("MEM_NO1"));
				   CprecordVO.setMem_No2(rs.getString("mem_No2"));
				   CprecordVO.setCprstate(rs.getString("Cprstate"));
				   CprecordVO.setCpc_time(rs.getTimestamp("cpc_Time"));
				   
				  
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
		return CprecordVO;
	}
	
	@Override
	public List<CprecordVO> getAll() {
		// TODO Auto-generated method stub
		List<CprecordVO> list = new ArrayList<CprecordVO>();
		CprecordVO CprecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			java.sql.Blob blob = con.createBlob();
			while (rs.next()) {
				// empVo �]붙О Domain objects
				   CprecordVO = new CprecordVO();
				   CprecordVO.setCp_No1(rs.getString("CP_NO1"));
				   CprecordVO.setCpr_No(rs.getString("cpr_No"));
				   CprecordVO.setCp_No2(rs.getString("cp_No2"));
				   CprecordVO.setMem_No1(rs.getString("MEM_NO1"));
				   CprecordVO.setMem_No2(rs.getString("mem_No2"));
				   CprecordVO.setCprstate(rs.getString("Cprstate"));
				   CprecordVO.setCpc_time(rs.getTimestamp("cpc_Time"));
				   
				 
				   
				  
					   
						
		           list.add(CprecordVO);
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
	public void insert(CprecordVO CprecordVO) {
		java.sql.Connection con=null;
		PreparedStatement pstmt = null;
		
		try {
			
           if(ds!=null) 
			con = ds.getConnection();
           
           pstmt = con.prepareStatement(INSERT_STMT);
           pstmt.setString(1,CprecordVO.getCp_No1());
           pstmt.setString(2,CprecordVO.getCp_No2());
           pstmt.setString(3,CprecordVO.getMem_No1());
           pstmt.setString(4,CprecordVO.getMem_No2());
           
           pstmt.setTimestamp(5,CprecordVO.getCpc_time());
           pstmt.setString(6,CprecordVO.getCprstate());
           
           
			
           

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
