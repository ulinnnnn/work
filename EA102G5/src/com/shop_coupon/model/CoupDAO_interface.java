package com.shop_coupon.model;

import java.util.List;


public interface CoupDAO_interface {
	
	public void insert(CoupVO coupVO);
    public void update(CoupVO coupVO);
    public void delete(String coup_no);
    public CoupVO findByPrimaryKey(String coup_no);
    public List<CoupVO> getAll();
    
    public List<CoupVO> getMemCoup(String mem_no);
    public List<CoupVO> getCoupStatus(String coup_status);
    public void updateStatus(String coup_no, String coup_stauts);
    public List<CoupVO> getCanUse(String mem_no, String coup_status);

}