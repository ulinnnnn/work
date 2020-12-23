package com.func.model;

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


public class FuncDAO implements FuncDAO_I {
	
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
	public void insert(FuncVO funcVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"insert into func (func_no, func_name, func_desc) "
					+ "values (('f' || lpad(SEQ_FUNC_NO.NEXTVAL,3,'0')), ? ,?)"
					);
				
			pstmt.setString(1, funcVO.getFuncName());
			pstmt.setString(2, funcVO.getFuncDesc());
			
			pstmt.executeUpdate();

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
	}

	@Override
	public void update(FuncVO funcVO) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"update func set func_name=? , func_desc=? where func_no=?"
					);

			pstmt.setString(1, funcVO.getFuncName());
			pstmt.setString(2, funcVO.getFuncDesc());
			
			pstmt.setString(3, funcVO.getFuncNo());
			
			pstmt.executeUpdate();

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
	}
	
	@Override
	public void delete(String funcNo) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"delete from func where func_no = ?"
					);

			pstmt.setString(1, funcNo);
			
			pstmt.executeUpdate();

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
	}
	
	@Override
	public FuncVO getOne(String funcNo) {
		FuncVO funcVO = new FuncVO();;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select func_no, func_name, func_desc from func where func_no=?"
					);

			pstmt.setString(1, funcNo);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
			
				funcVO.setFuncNo(rs.getString("func_no"));
				funcVO.setFuncName(rs.getString("func_name"));
				funcVO.setFuncDesc(rs.getString("func_desc"));
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
		return funcVO;
	}
	
	@Override
	public List<FuncVO> getAll(){
		List<FuncVO> list = new ArrayList<FuncVO>();
		
//		FuncVO funcVO = new FuncVO();
		FuncVO funcVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select * from func order by func_no"
					);
	
			rs = pstmt.executeQuery();

			while(rs.next()) {
				funcVO = new FuncVO();
				funcVO.setFuncNo(rs.getString("func_no"));
				funcVO.setFuncName(rs.getString("func_name"));
				funcVO.setFuncDesc(rs.getString("func_desc"));
			    list.add(funcVO);
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
	
	
//	public static void main(String[] args) {
//		FuncDAO dao = new FuncDAO();
//		
//		//新增測試
//		FuncVO funcVO1 = new FuncVO();
//		
//		funcVO1.setFuncName("嘴砲奧義：嘴爆客戶");
//		funcVO1.setFuncDesc("可以直接對客戶開噴，並開放使用三字經攻擊");
//		dao.insert(funcVO1);
		
//		//修改測試
//		FuncVO funcVO2 = new FuncVO();
//		funcVO2.setFuncNo("f006");
//		funcVO2.setFuncName("審核點數提款");
//		funcVO2.setFuncDesc("管理員可發動內鬼技能，直接把會員點數轉到自己帳戶，而且不被發現");
//		dao.update(funcVO2);
		
//		//刪除測試
//		dao.delete("f012");
				
//		//查詢單筆		
//		FuncVO funcVO3 = dao.getOne("f002");
//		System.out.println(funcVO3.getFuncName());
//		System.out.println(funcVO3.getFuncDesc());
//		
//		//查詢全部
//		List<FuncVO> list1 = dao.getAll();
//		for(FuncVO funcV : list1) {
//			System.out.println(funcV.getFuncNo());
//			System.out.println(funcV.getFuncName());
//			System.out.println(funcV.getFuncDesc());
//		}
				
	
}
