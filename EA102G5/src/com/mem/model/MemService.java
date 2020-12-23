package com.mem.model;

import java.io.*;
import java.sql.*;
import java.util.List;

public class MemService  {
	private MemDAO_interface dao;
	public MemService() {
		dao=new MemDAO();
	}
	public MemVO memInsert(String mem_name,String mem_account,String mem_pwd,String mem_phone,
			String mem_email,Date mem_born,String mem_sex,String mem_addr,String mem_bank,
			byte[] mem_pic ) {
		
		MemVO memVO=new MemVO();
		
		memVO.setMem_name(mem_name);
		memVO.setMem_account( mem_account);
		memVO.setMem_pwd(mem_pwd);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_email(mem_email);
		memVO.setMem_born(mem_born);
		memVO.setMem_sex( mem_sex);
		memVO.setMem_addr(mem_addr);
		memVO.setMem_bank(mem_bank);
		memVO.setMem_pic(mem_pic);
		
		dao.memInsert(memVO);
		
		return memVO;
	}
	
	public MemVO memUpdate(String mem_account,String mem_name,String mem_phone,
			String mem_email,Date mem_born,String mem_addr,String mem_bank
			 ) {
		
		MemVO memVO=new MemVO();
		memVO.setMem_account(mem_account);
		memVO.setMem_name(mem_name);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_email(mem_email);
		memVO.setMem_born(mem_born);
		memVO.setMem_addr(mem_addr);
		memVO.setMem_bank(mem_bank);
		
		dao.memUpdate(memVO);
		memVO=dao.memSelectByAcc(mem_account);
		return memVO;
	}
	public MemVO memUpdate2(MemVO memVO) {
		dao.memUpdate(memVO);
		String mem_account=memVO.getMem_account();
		memVO=dao.memSelectByAcc(mem_account);
		return memVO;
	}
	public void memBlock(String mem_account) {
		dao.memBlock(mem_account);
	}
	public void memUnlock(String mem_account) {
		dao.memUnlock(mem_account);
	}

	public MemVO memSelect(String mem_account) {
		
		return	dao.memSelectByAcc(mem_account);
	}
	public MemVO memSelectByPk(String mem_no) {
		
		return	dao.memSelectByPk(mem_no);
	}
	
	public MemVO memSelectByEmail(String mem_email) {
		
		return	dao.memSelectByEmail(mem_email);
	}
	
	
	public List<MemVO> selectAllMem(){
		return dao.selectAllMem();
	}
	
	public void memUpdatePic(String mem_no,byte[] mem_pic) {
		dao.memUpdatePic(mem_no, mem_pic);
	}
	public void memUpdatePWD(String mem_email,String mem_pwd) {
		dao.memUpdatePWD(mem_email, mem_pwd);
	}
	public void memVerification(String mem_email,String mem_verification_code) {
		dao.memVerification(mem_email,mem_verification_code);
	}
	public void memOpen(String mem_account) {
		dao.memOpen(mem_account);
	}
}
