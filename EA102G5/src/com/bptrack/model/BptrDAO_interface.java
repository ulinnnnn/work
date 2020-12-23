package com.bptrack.model;

import java.util.List;

import com.bp.model.BpVO;


public interface BptrDAO_interface {
	
	public void insert(BptrVO bptrVO);//客人新增
	public void delete(String mem_no, String bp_no);//後台下架
	public List<BptrVO> findBymen_no(String mem_no);//查會員
	public BptrVO findonememtr(String mem_no, String bp_no);
}
