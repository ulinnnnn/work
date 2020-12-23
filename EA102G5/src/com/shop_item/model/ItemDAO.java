package com.shop_item.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ItemDAO implements ItemDAO_interface {
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
	
	private static final String INSERT_STMT = 
		"INSERT INTO shop_item (item_no,prod_no,item_quantity,prod_price,ord_no)"
		+ " VALUES  ('i' || LPAD (SEQ_ITEM_NO.NEXTVAL,3,'0'),?,?,?,?)";

	private static final String get_hello = "select item_no,ord_no,prod_no"
			+ ",item_quantity,prod_price from shop_item where ord_no = ?";
	
	

	@Override
	public void insert(ItemVO itemVO, Connection con) {
		//這裡的連線在ordDAO發生
		
		PreparedStatement pstmt = null;
		
		try {

				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1, itemVO.getProdNo());
				pstmt.setInt(2, itemVO.getItemQuantity());
				pstmt.setDouble(3, itemVO.getProdPrice());
				pstmt.setString(4, itemVO.getOrdNo());
				
				pstmt.executeUpdate();
				


			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3.設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-itemDAO");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
		}

	}
	

	
	@Override
	public List<ItemVO> getItem(String ord_no) {
		
		List<ItemVO> list = new ArrayList<ItemVO>();
		ItemVO itemVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(get_hello);
			pstmt.setString(1, ord_no);
			
			
			rs = pstmt.executeQuery();

		
			while (rs.next()) {
				// itemVO 也稱為 Domain objects
				itemVO = new ItemVO();
				itemVO.setItemNo(rs.getString("item_no"));
				itemVO.setItemQuantity(rs.getInt("item_quantity"));
				itemVO.setProdPrice(rs.getDouble("prod_price"));
				itemVO.setOrdNo(rs.getString("ord_no"));
				itemVO.setProdNo(rs.getString("prod_no"));
				list.add(itemVO);
				
			}

			// Handle any driver errors
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


}
