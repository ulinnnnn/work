package com.bptrack.model;

import java.util.List;

import com.bp.model.BpVO;


public interface BptrDAO_interface {
	
	public void insert(BptrVO bptrVO);//�ȤH�s�W
	public void delete(String mem_no, String bp_no);//��x�U�[
	public List<BptrVO> findBymen_no(String mem_no);//�d�|��
	public BptrVO findonememtr(String mem_no, String bp_no);
}
