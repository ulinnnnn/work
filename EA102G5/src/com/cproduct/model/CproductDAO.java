package com.cproduct.model;

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



public class CproductDAO implements CproductDAO_interface{
	
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
	private static final String INSERT_STMT = "INSERT INTO Cproduct (cp_No,cpClass_No,cpState,mem_No,emp_NO,cpname,cptext,cpontime,cpofftime,cpPicture_No1,cpPicture_No2,cpPicture_No3,cpmeetup) VALUES (CPRODUCT_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM Cproduct";
	private static final String GET_MEM_STMT = "SELECT * FROM Cproduct where mem_No= ?";
	private static final String GET_ONE_STMT = "SELECT CP_NO,cpClass_No,cpState,mem_No,emp_NO,cpname,cptext,cpontime,cpofftime,cpPicture_No1,cpPicture_No2,cpPicture_No3,Cpmeetup FROM Cproduct where cp_No= ?";
	private static final String GET_PICTURE1 ="SELECT cpPicture_No1 FROM Cproduct where cp_No= ?";
	private static final String GET_PICTURE2 ="SELECT cpPicture_No2 FROM Cproduct where cp_No= ?";
	private static final String GET_PICTURE3 ="SELECT cpPicture_No3 FROM Cproduct where cp_No= ?";
	private static final String DELETE= "DELETE FROM Cproduct where cp_No= ?";	
	private static final String UPDATE = "UPDATE Cproduct set cpClass_No=?,cpState=?,mem_No=?,emp_NO=?,cpname=?,cptext=?,cpontime=?,cpofftime=?,cpPicture_No1=?,cpPicture_No2=?,cpPicture_No3=?,Cpmeetup=? where cp_No= ?";
	private static final String UPDATEMAIN = "UPDATE Cproduct set cpClass_No=?,emp_NO=?,cpname=?,cptext=?,Cpmeetup=? where cp_No= ?";
	private static final String UPDATEPIC = "UPDATE Cproduct set cpPicture_No1=?,cpPicture_No2=?,cpPicture_No3=?where cp_No= ?";
	private static final String check_change = "UPDATE Cproduct set cpState=? where cp_No= ?";
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


	public static byte[] getPicture(String Cp_No,String No) {
		// TODO Auto-generated method stub
		CproductVO CproductVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.sql.Blob img ;
		byte[] imgDate=null;
		

			try {
				con = ds.getConnection();
				System.out.print(No);
				switch(No){
			     case "1":
			    	 No="cpPicture_No1";
			    	 pstmt = con.prepareStatement(GET_PICTURE1);
			    	 break;
			     case "2":
			    	 No="cpPicture_No2";
			    	 pstmt = con.prepareStatement(GET_PICTURE2);
			    	 break;
			     case "3":
			    	 No="cpPicture_No3";
			    	 pstmt = con.prepareStatement(GET_PICTURE3);
			    	 break;
				}
			
			
			pstmt.setString(1,Cp_No);

			rs = pstmt.executeQuery();

			while (rs.next ())
		    {   
		      img = rs.getBlob(1);
		      imgDate= img.getBytes(1,(int)img.length());
		    }  
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    try {
				rs.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		   
		    return imgDate ;

		  
	
	
		}
	
	
	private String String(String string) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void update(CproductVO CproductVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			   pstmt.setString(1,CproductVO.getCpClass_No());
	           pstmt.setString(2,CproductVO.getCpState());
	           pstmt.setString(3,CproductVO.getMem_No());
	           pstmt.setString(4,CproductVO.getemp_NO());
	           pstmt.setString(5,CproductVO.getCpname());
	           pstmt.setString(6,CproductVO.getCptext());
	           pstmt.setTimestamp(7,CproductVO.getCpontime());
	           pstmt.setTimestamp(8,CproductVO.getCpofftime());
	           
	           java.sql.Blob blob = con.createBlob();
	           java.sql.Blob blob2 = con.createBlob();
	           java.sql.Blob blob3 = con.createBlob();
				byte[] pic1 =CproductVO.getCpPicture_No1();
				
				byte[] pic2 =CproductVO.getCpPicture_No2();
				
				byte[] pic3 = CproductVO.getCpPicture_No3();
				blob.setBytes(1, pic1);
				blob2.setBytes(1, pic2);
				blob3.setBytes(1, pic3);
				pstmt.setBlob(9, blob);
				pstmt.setBlob(10, blob2);
				pstmt.setBlob(11, blob3);
				pstmt.setString(12,CproductVO.getCpmeetup());
				pstmt.setString(13,CproductVO.getCp_No());
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
	public void updatepic(CproductVO CproductVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEPIC);

			   
	           
	           java.sql.Blob blob = con.createBlob();
	           java.sql.Blob blob2 = con.createBlob();
	           java.sql.Blob blob3 = con.createBlob();
				byte[] pic1 =CproductVO.getCpPicture_No1();
				
				byte[] pic2 =CproductVO.getCpPicture_No2();
				
				byte[] pic3 = CproductVO.getCpPicture_No3();
				blob.setBytes(1, pic1);
				blob2.setBytes(1, pic2);
				blob3.setBytes(1, pic3);
				pstmt.setBlob(1, blob);
				pstmt.setBlob(2, blob2);
				pstmt.setBlob(3, blob3);
				
				pstmt.setString(4,CproductVO.getCp_No());
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
	public void updatemain(CproductVO CproductVO) {
		// TODO Auto-generated method stub
		java.sql.Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEMAIN);

			   pstmt.setString(1,CproductVO.getCpClass_No());
	          
	           pstmt.setString(2,CproductVO.getemp_NO());
	           pstmt.setString(3,CproductVO.getCpname());
	           pstmt.setString(4,CproductVO.getCptext());        
				pstmt.setString(5,CproductVO.getCpmeetup());
				pstmt.setString(6,CproductVO.getCp_No());
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
	
	@Override
	public void changestate(String Cpstate,String Cp_No) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(check_change);
			pstmt.setString(1,Cpstate);
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

	public CproductVO findByPrimaryKey(String Cp_No) {
		// TODO Auto-generated method stub
		CproductVO CproductVO = null;
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
				   CproductVO = new CproductVO();
				   CproductVO.setCp_No(rs.getString("CP_NO"));
				   CproductVO.setCpClass_No(rs.getString("CPCLASS_NO"));
				   CproductVO.setCpState(rs.getString("CPSTATE"));
				   CproductVO.setMem_No(rs.getString("MEM_NO"));
				   CproductVO.setEMP_NO(rs.getString("EMP_NO"));
				   CproductVO.setCpname(rs.getString("CPNAME"));
				   CproductVO.setCptext(rs.getString("CPTEXT"));
				   CproductVO.setCpontime(rs.getTimestamp("CPONTIME"));
				   CproductVO.setCpofftime(rs.getTimestamp("CPOFFTIME"));
				   CproductVO.setCpmeetup(rs.getString("CPMEETUP"));
				   
				   CproductVO.setCpPicture_No1(rs.getBytes("CpPicture_No1"));
				   CproductVO.setCpPicture_No1(rs.getBytes("CpPicture_No2"));
				   CproductVO.setCpPicture_No1(rs.getBytes("CpPicture_No3"));
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
		return CproductVO;
	}

	@Override
	public List<CproductVO> getAll() {
		// TODO Auto-generated method stub
		List<CproductVO> list = new ArrayList<CproductVO>();
		CproductVO CproductVO = null;
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
				   CproductVO = new CproductVO();
				   CproductVO.setCp_No(rs.getString("CP_NO"));
				   CproductVO.setCpClass_No(rs.getString("CPCLASS_NO"));
				   CproductVO.setCpState(rs.getString("CPSTATE"));
				   CproductVO.setMem_No(rs.getString("MEM_NO"));
				   CproductVO.setEMP_NO(rs.getString("EMP_NO"));
				   CproductVO.setCpname(rs.getString("CPNAME"));
				   CproductVO.setCptext(rs.getString("CPTEXT"));
				   CproductVO.setCpontime(rs.getTimestamp("CPONTIME"));
				   CproductVO.setCpofftime(rs.getTimestamp("CPOFFTIME"));
				   
				   
				   
				  
				   CproductVO.setCpPicture_No1(rs.getBytes("CpPicture_No1"));
				   CproductVO.setCpPicture_No1(rs.getBytes("CpPicture_No2"));
				   CproductVO.setCpPicture_No1(rs.getBytes("CpPicture_No3"));
				   CproductVO.setCpmeetup(rs.getString("CPMEETUP"));	   
						
		           list.add(CproductVO);
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
	
	public List<CproductVO> getmemAll(String mem_No) {
		// TODO Auto-generated method stub
		List<CproductVO> list = new ArrayList<CproductVO>();
		CproductVO CproductVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_MEM_STMT);
			pstmt.setString(1,mem_No);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVo 也稱為 Domain objects
				   CproductVO = new CproductVO();
				   CproductVO.setCp_No(rs.getString("CP_NO"));
				   CproductVO.setCpClass_No(rs.getString("CPCLASS_NO"));
				   CproductVO.setCpState(rs.getString("CPSTATE"));
				   CproductVO.setMem_No(rs.getString("MEM_NO"));
				   CproductVO.setEMP_NO(rs.getString("EMP_NO"));
				   CproductVO.setCpname(rs.getString("CPNAME"));
				   CproductVO.setCptext(rs.getString("CPTEXT"));
				   CproductVO.setCpontime(rs.getTimestamp("CPONTIME"));
				   CproductVO.setCpofftime(rs.getTimestamp("CPOFFTIME"));
				   
//				   if(rs.getBytes("CpPicture_No1").length()>1) {
//				   
//				   byte[] pic1=new byte[(int)rs.getBlob("CpPicture_No1").length()];
//				   rs.getBlob("cpPicture_No1").getBinaryStream().read(pic1);
				   CproductVO.setCpPicture_No1(rs.getBytes("CPPICTURE_NO1"));
				   CproductVO.setCpPicture_No2(rs.getBytes("CpPicture_No2"));
				   CproductVO.setCpPicture_No3(rs.getBytes("CpPicture_No3"));
//				   }
//				   if(rs.getBlob("CpPicture_No2").length()>1) {
//				   byte[] pic2=new byte[(int)rs.getBlob("CpPicture_No2").length()];
//				   rs.getBlob("CpPicture_No2").getBinaryStream().read(pic2);
//				   CproductVO.setCpPicture_No1(pic2);
//				   }
//				   if(rs.getBlob("CpPicture_No3").length()>1) {
//				   byte[] pic3=new byte[(int)rs.getBlob("CpPicture_No3").length()];
//				   rs.getBlob("CpPicture_No3").getBinaryStream().read(pic3);
//				   CproductVO.setCpPicture_No1(pic3);
//				   
//				   }
				   CproductVO.setCpmeetup(rs.getString("CPMEETUP"));	   
						
		           list.add(CproductVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
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
	public CproductVO insert(CproductVO CproductVO) {
		java.sql.Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
           if(ds!=null) 
			con = ds.getConnection();
           
           pstmt = con.prepareStatement(INSERT_STMT,pstmt.RETURN_GENERATED_KEYS);
           pstmt.setString(1,CproductVO.getCpClass_No());
           pstmt.setString(2,CproductVO.getCpState());
           pstmt.setString(3,CproductVO.getMem_No());
           pstmt.setString(4,CproductVO.getemp_NO());
           pstmt.setString(5,CproductVO.getCpname());
           pstmt.setString(6,CproductVO.getCptext());
           pstmt.setTimestamp(7,CproductVO.getCpontime());
           pstmt.setTimestamp(8,CproductVO.getCpofftime());
           
           java.sql.Blob blob = con.createBlob();
           java.sql.Blob blob2 = con.createBlob();
           java.sql.Blob blob3 = con.createBlob();
			byte[] pic1 =CproductVO.getCpPicture_No1();
			
			byte[] pic2 =CproductVO.getCpPicture_No2();
			
			byte[] pic3 = CproductVO.getCpPicture_No3();
			blob.setBytes(1, pic1);
			blob2.setBytes(1, pic2);
			blob3.setBytes(1, pic3);
			pstmt.setBlob(9, blob);
			pstmt.setBlob(10, blob2);
			pstmt.setBlob(11, blob3);
			pstmt.setString(12,CproductVO.getCpmeetup());
           

			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement("SELECT CPRODUCT_SEQ.CURRVAL FROM dual");
			rs= pstmt.executeQuery();
			if (rs.next()) {
				CproductVO.setCp_No(String.valueOf(rs.getInt(1)));
		    }
		        return CproductVO;

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
