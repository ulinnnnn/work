package com.fmclass.model;

import java.util.List;

public interface fmclassDAO_I {
	public void insert(fmclassVO fmclassVO);
    public void update(fmclassVO fmclassVO);
    public void delete(String fmcl_no);
    public fmclassVO getOne(String fmcl_no);
    public List<fmclassVO> getAll();
}
