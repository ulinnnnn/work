package com.shop_order.model;

import java.util.List;

import com.shop_item.model.ItemVO;


public interface OrdDAO_interface {
	
	public void insert(OrdVO ordVO);
    public void updateStatus(OrdVO ordVO);
    public void delete(String ord_no);
    public OrdVO findByPrimaryKey(String ord_no);
    public List<OrdVO> getAll();
    
    public OrdVO findOrdNo(String mem_no);
    public List<OrdVO> getMemOrd(String mem_no);
    public String insertWithItem(OrdVO ordVO, List<ItemVO> list);
    public List<OrdVO> getOrdStatus(String ord_status);
	

}
