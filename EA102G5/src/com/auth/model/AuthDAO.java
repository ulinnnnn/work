package com.auth.model;

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

import com.auth.model.AuthVO;


public class AuthDAO implements AuthDAO_I {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/EA102G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void insert(AuthVO authVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"insert into authority (emp_no ,emp_name ,func_no, func_name) values (? ,? ,? ,?)");
			
			pstmt.setString(1, authVO.getEmpNo());
			pstmt.setString(2, authVO.getEmpName());
			pstmt.setString(3, authVO.getFuncNo());
			pstmt.setString(4, authVO.getFuncName());
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public void update(AuthVO authVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"insert into authority (emp_no ,emp_name ,func_no, func_name) values (? ,? ,? ,?)" );
			
			pstmt.setString(1, authVO.getEmpNo());
			pstmt.setString(2, authVO.getEmpName());
			pstmt.setString(3, authVO.getFuncNo());
			pstmt.setString(4, authVO.getFuncName());
					
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}
	
	@Override
	public void deleteEmp(String empNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"delete from authority where emp_no=?"
					  );
			pstmt.setString(1, empNo);
			
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
	
	@Override
	public void deleteEmpFunc(String empNo , String funcNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"delete from authority where emp_no=? and func_no=?"
					  );
			pstmt.setString(1, empNo);
			pstmt.setString(2, funcNo);
			
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
	
	@Override
	public List<AuthVO> getOneEmp(String empNo) {
		
		List<AuthVO> list = new ArrayList<AuthVO>();
		
		AuthVO authVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select emp_no, func_no, func_name from authority where emp_no=? order by func_no"
					);

			pstmt.setString(1, empNo);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				authVO = new AuthVO();
				authVO.setEmpNo(rs.getString("emp_no"));
				authVO.setFuncNo(rs.getString("func_no"));
				authVO.setFuncName(rs.getString("func_name"));
				list.add(authVO);
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
	public AuthVO getOneEmpNo(String empNo) {
		AuthVO authVO = new AuthVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select emp_no from authority where emp_no=?"
					);

			pstmt.setString(1, empNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				authVO.setEmpNo(rs.getString("emp_no"));
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
		return authVO;
		
	}
	
	@Override
	public List<String> getOneEmpFuncs(String empNo) {
		
		List<String> list = new ArrayList<String>();
		
		AuthVO authVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select func_no from authority where emp_no=?"
					);

			pstmt.setString(1, empNo);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				String str = rs.getString("func_no");
//				authVO = new AuthVO();
//				authVO.setFuncNo(rs.getString("func_no"));
				list.add(str);
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
	public List<AuthVO> getOneFunc(String funcNo) {
		List<AuthVO> list = new ArrayList<AuthVO>();
		AuthVO authVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select func_no from authority where func_no=?"
					);

			pstmt.setString(1, funcNo);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				authVO = new AuthVO();
//				authVO.setEmpNo(rs.getString("emp_no"));
				authVO.setFuncNo(rs.getString("func_no"));	
				list.add(authVO);
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
	public List<AuthVO> getAll() {
		List<AuthVO> list = new ArrayList<AuthVO>();
		AuthVO authVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"select * from authority order by emp_no"
					  );
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				authVO = new AuthVO();
								
				authVO.setEmpNo(rs.getString("emp_no"));
				authVO.setFuncNo(rs.getString("func_no"));
				
				list.add(authVO);				
			}

		} catch (SQLException se) {
			throw new RuntimeException("資料庫發生錯誤 "
					+ se.getMessage());	
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	
//	public static void main(String[] args) {
//		
//		AuthDAO dao = new AuthDAO();
		
		//新增
//		AuthVO authVO1 = new AuthVO();
//		
//		authVO1.setEmpNo("e005");
//		authVO1.setFuncNo("f003");
//		dao.insert(authVO1);
		
		//刪除emp
//		dao.deleteEmp("e003");
		
		//刪除func
//		dao.deleteEmpFunc("e005", "f003");
		
		//修改
//		AuthVO authVO2 = new AuthVO();		
//		authVO2.setEmpNo("e005");
//		authVO2.setFuncNo("f004");
//		dao.update(authVO2);
		
		//查詢單筆emp
//		List<AuthVO> list1 = dao.getOneEmp("e001");
//		for(AuthVO authVO3:list1) {
//			System.out.println(authVO3.getEmpNo());
//			System.out.println(authVO3.getFuncNo());			
//		}
		
		//查詢單筆func
//		List<AuthVO> list2 = dao.getOneFunc("f002");
//		for(AuthVO authVO4 : list2) {
//			System.out.println(authVO4.getEmpNo());
//			System.out.println(authVO4.getFuncNo());
//		}
		
		//查全部
//		List<AuthVO> list3 = dao.getAll();
//		for(AuthVO authVO5 : list3) {
//			System.out.println(authVO5.getEmpNo());
//			System.out.println(authVO5.getFuncNo());
//		}
		
//	}
	
	
}
