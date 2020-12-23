package com.emp.model;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;


public interface EmpDAO_I {
	public void insert(EmpVO empVO);
	public void update(EmpVO empVO);
	public void delete(String empNo);
	public EmpVO getOne(String empNo);
	public List<EmpVO> getAll();
	public EmpVO showPic(String empNo);
	public EmpVO updateEmpPsd(EmpVO empVO);
}
