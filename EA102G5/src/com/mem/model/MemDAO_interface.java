package com.mem.model;

import java.util.*;

public interface MemDAO_interface {
	public void memInsert(MemVO memVO);
	public void memUpdate(MemVO memVO);
	public void memBlock(String mem_account);
	public MemVO memSelectByAcc(String mem_account);
	public MemVO memSelectByPk(String mem_no);
	public List<MemVO> selectAllMem();
	public void memUpdatePWD(String mem_email,String mem_pwd);
	public void memUpdatePic(String mem_no,byte[] mem_pic);
	public void memUnlock(String mem_account);
	public void memVerification(String mem_email,String mem_verification_code);
	public void memOpen(String mem_email);
	public MemVO memSelectByEmail(String mem_email);
}
