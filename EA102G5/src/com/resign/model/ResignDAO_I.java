package com.resign.model;

import java.util.List;

public interface ResignDAO_I {
	public void insert(ResignVO resignVO);
	public void insertPic(byte[] signPic);
	public List<ResignVO> getAll();
	public ResignVO showPic(String empNo);

}
