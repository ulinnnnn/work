package com.shop_item.model;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.shop_product.model.*;

public class ItemService {
	
	private ItemDAO_interface dao;
	
	public ItemService() {
		dao = new ItemDAO();
	}
	
//	public List<ItemVO> addItem(List<ItemVO> buylist,String ord_no) {
//		
//		for(int i = 0; i < buylist.size();i++) {
//			ItemVO itemVO = buylist.get(i);
//			itemVO.setOrdNo(ord_no);
//			dao.insert(itemVO);
//		} 
//		return buylist;
//	}
	
	public List<ItemVO> getItem(String ord_no) {
		return dao.getItem(ord_no);
	}
	
	

}
