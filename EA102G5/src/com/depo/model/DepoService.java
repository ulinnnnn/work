package com.depo.model;

import java.sql.*;
import java.util.*;
import com.mem.model.MemVO;

public class DepoService {
	DepoDAO_interface dao;
	public DepoService() {
		dao=new DepoDAO();
	}
	public DepoVO newTransAdd(String mem_no,Integer depo_amount,Integer depo_point,
							String depo_trans_type,String depo_tok_status) {
		
//		MemVO memVO=new MemVO();
		DepoVO depoVO=new DepoVO();
		
		depoVO.setMem_no(mem_no);
		depoVO.setDepo_amount(depo_amount);
		depoVO.setDepo_point(depo_point);
		depoVO.setDepo_trans_type(depo_trans_type);
		depoVO.setDepo_tok_status(depo_tok_status);
		dao.newTransAdd(depoVO);
		return depoVO; 
	}
	
	public DepoVO memNowDepo(String mem_no) {
		return dao.memNowDepo(mem_no);
	}
	
	public List<DepoVO> depoSelectByMem(String mem_no) {
		return dao.depoSelectByMem(mem_no);
	}
	public List<DepoVO> depoSelectAllByEmp(){
		return dao.depoSelectAllByEmp();
	}
	
	public void upDateDepoTokStatus(String depo_no) {
		dao.upDateDepoTokStatus(depo_no);
	}
	
}
