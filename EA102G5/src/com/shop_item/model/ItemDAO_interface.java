package com.shop_item.model;

import java.sql.Connection;
import java.util.List;


public interface ItemDAO_interface {
	
	
//	public ItemVO findByPrimaryKey(String item_no);
//    public void update(ItemVO itemVO);
//    public void delete(String item_no);
//    public List<ItemVO> getAll();
    
    public void insert(ItemVO itemVO, Connection con);
    public List<ItemVO> getItem(String ord_no);

}
