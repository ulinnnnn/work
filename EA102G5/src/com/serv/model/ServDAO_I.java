package com.serv.model;

import java.util.List;

import com.emp.model.EmpVO;

public interface ServDAO_I {
	public void insert(ServVO servVO);
	public void reply(ServVO servVO);
//	public void delete(String servNo);
	public ServVO getOne(String servNo);
	public List<ServVO> getAll();

}
