package com.serv.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.emp.model.EmpVO;


public class ServDAO implements ServDAO_I {

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
	public void insert(ServVO servVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"insert into cust_serv (serv_no, ord_no ,cust_cont ,cust_cont_time)"
					  + "values(('serv' || lpad(seq_serv_no.nextval, 5 ,'0')),? ,? ,? )"
					  );

			pstmt.setString(1, servVO.getOrdNo());
			pstmt.setString(2, servVO.getCustCont());
			pstmt.setTimestamp(3, servVO.getCustContTime());
								
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
	public ServVO getOne(String servNo) {
		ServVO servVO = new ServVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
					"select serv_no ,ord_no, cust_cont, cust_cont_time ,emp_no, res_cont, res_cont_time from cust_serv where serv_no=?"
					);

			pstmt.setString(1, servNo);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {			
				servVO.setServNo(rs.getString("serv_no"));
				servVO.setOrdNo(rs.getString("ord_no"));
				servVO.setCustCont(rs.getString("cust_cont"));
				servVO.setCustContTime(rs.getTimestamp("cust_cont_time"));
				servVO.setEmpNo(rs.getString("emp_no"));
				servVO.setResCont(rs.getString("res_cont"));
				servVO.setResContTime(rs.getTimestamp("res_cont_time"));				
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
		return servVO;
	}

	
	@Override
	public void reply(ServVO servVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"update cust_serv set emp_no=?, res_cont=?, res_cont_time=? where serv_no =?"
					  );
			pstmt.setString(1, servVO.getEmpNo());
			pstmt.setString(2, servVO.getResCont());
			pstmt.setTimestamp(3, servVO.getResContTime());
						
			pstmt.setString(4,servVO.getServNo());
			
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
	
//	@Override
//	public void delete(String servNo) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url , userid , userpsd);
//			pstmt = conn.prepareStatement(
//						"delete from cust_serv where serv_no=?"
//					  );
//			pstmt.setString(1, servNo);
//			
//			pstmt.executeUpdate();
//			
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("無法載入資料庫驅動 "
//					+ e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("資料庫發生錯誤 "
//					+ se.getMessage());	
//		}finally {
//			if(pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			if(conn != null) {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}		
//	}
	
	
	@Override
	public List<ServVO> getAll() {
		List<ServVO> list = new ArrayList<ServVO>();
		ServVO servVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(
						"select * from cust_serv"
					  );
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				servVO = new ServVO();
				servVO.setServNo(rs.getString("serv_no"));
				servVO.setOrdNo(rs.getString("ord_no"));
				servVO.setCustCont(rs.getString("cust_cont"));
				servVO.setCustContTime(rs.getTimestamp("cust_cont_time"));
				servVO.setEmpNo(rs.getString("emp_no"));			
				servVO.setResCont(rs.getString("res_cont"));
				servVO.setResContTime(rs.getTimestamp("res_cont_time"));
				list.add(servVO);				
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
//		ServDAO dao = new ServDAO();
		
		//新增測試
//		ServVO servVO1 = new ServVO();
//		servVO1.setEmpNo("e005");
//		servVO1.setOrdNo("ord00011");
//		servVO1.setServCont("晚安 先睡了~");
//		dao.insert(servVO1);
		
		//刪除測試
//		dao.delete("serv00012");
		
		//修改測試
//		ServVO servVO2 = new ServVO();
//		servVO2.setServNo("serv00010");
//		servVO2.setEmpNo("e005");
//		servVO2.setOrdNo("ord010");
//		servVO2.setServCont("先晚安了");
//		dao.update(servVO2);
		
		//查詢單筆
//		ServVO servVO3 = dao.getOne("serv00010");
//		System.out.println(servVO3.getServNo());
//		System.out.println(servVO3.getEmpNo());
//		System.out.println(servVO3.getOrdNo());
//		System.out.println(servVO3.getServCont());
//		
//		Long time = servVO3.getServContTime().getTime();
//		DateFormat df = new SimpleDateFormat("yyyy MM dd HH:mm:ss");
//		String contTime = df.format(new Date(time));
//		System.out.println(contTime);
		
		//查全部
//		List<ServVO> list = dao.getAll();
//		for(ServVO servVO : list) {
//			System.out.println(servVO.getServNo());
//			System.out.println(servVO.getEmpNo());
//			System.out.println(servVO.getOrdNo());
//			System.out.println(servVO.getServCont());
//			System.out.println(servVO.getServContTime());
//		}
		
//	}
	
}
