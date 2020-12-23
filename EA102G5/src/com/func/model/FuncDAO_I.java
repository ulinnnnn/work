package com.func.model;

import java.util.List;

public interface FuncDAO_I {
	public void insert(FuncVO funcVO);
    public void update(FuncVO funcVO);
    public void delete(String funcNo);
    public FuncVO getOne(String funcNo);
    public List<FuncVO> getAll();
}
