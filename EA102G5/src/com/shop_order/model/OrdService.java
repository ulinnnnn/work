package com.shop_order.model;

import java.util.List;

import com.shop_item.model.*;


public class OrdService {
	
	private OrdDAO_interface dao;
	
	public OrdService() {
		dao = new OrdDAO();
	}
	
	public String addOrd(OrdVO ordVO, List<ItemVO> list) {

		String ord_no = dao.insertWithItem(ordVO, list);
		

		return ord_no;
	
	}
	
	
	public OrdVO updateStatus(String ord_no, String ord_status) {

		OrdVO ordVO = new OrdVO();
		ordVO.setOrdNo(ord_no);
		ordVO.setOrdStatus(ord_status);

		 dao.updateStatus(ordVO);

		return ordVO;
	}
	
	public void deleteOrd(String ord_no) {
		dao.delete(ord_no);
	}
	
	public OrdVO getOneOrd(String ord_no) {
		return dao.findByPrimaryKey(ord_no);
	}
	
	public List<OrdVO> getAll() {
		return dao.getAll();
	}
	
	public OrdVO getOrdNo(String mem_no) {
		return dao.findOrdNo(mem_no);
	}
	
	public List<OrdVO> getMemOrd(String mem_no) {
		return dao.getMemOrd(mem_no);
	}
	
	public List<OrdVO> getOrdStatus(String ord_status) {
		return dao.getOrdStatus(ord_status);
	}
}
