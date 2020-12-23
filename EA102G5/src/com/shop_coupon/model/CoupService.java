package com.shop_coupon.model;

import java.util.List;
import java.util.UUID;


public class CoupService {
	
	private CoupDAO_interface dao;
	
	public CoupService() {
		dao = new CoupDAO();
	}
	
	public void addCoup(Double coup_discount, Integer amount) {
		
		for(int i = 0; i < amount; i++) {
			
			UUID uuid  =  UUID.randomUUID();
			String coup_no = uuid.toString().substring(0,11);
			coup_no = coup_no.replace("-", "");
			
			String coup_status = "·s¼WÀu´f¨é";
			CoupVO coupVO = new CoupVO();
			coupVO.setCoupNo(coup_no);
			coupVO.setCoupDiscount(coup_discount);
			coupVO.setCoupStatus(coup_status);
			dao.insert(coupVO);
		}
		
	}
	
	
	public CoupVO updateCoup(CoupVO coupVO) {
		dao.update(coupVO);
		return coupVO;
	}
	
	public void deleteCoup(String coup_no) {
		dao.delete(coup_no);
	}
	
	public CoupVO getOneCoup(String coup_no) {
		return dao.findByPrimaryKey(coup_no);
	}
	
	public List<CoupVO> getAll() {
		return dao.getAll();
	}
	
	public List<CoupVO> getMemCoup(String mem_no){
		return dao.getMemCoup(mem_no);
	}
	
	public List<CoupVO> getCoupStatus(String coup_status){
		return dao.getCoupStatus(coup_status);
	}
	
	public void updateStatus(String coup_no, String coup_status) {
		dao.updateStatus(coup_no, coup_status);
	}
	
	public List<CoupVO> getCanUse(String mem_no, String coup_status){
		return dao.getCanUse(mem_no, coup_status);
	}
}
