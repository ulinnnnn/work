package com.fmarticle.model;

import java.util.List;

public interface fmarticleDAO_I {
	public void insert(fmarticleVO fmarticleVO);//用戶新增文章
    public void update(fmarticleVO fmarticleVO);//用戶修改文章
    public void delete(String fm_no);//刪除文章
    public fmarticleVO getOne(String fm_no);//查一個
    public List<fmarticleVO> getAll();//查全部文章
    public List<fmarticleVO> getfmclAll(String fmcl_no);//查該類別全部文章
    public List<fmarticleVO> getmemAll(String mem_no);//查看該會員全部文章
    public List<fmarticleVO> search(String head);//模糊查詢
    
    
}
