package com.fmarticle.model;

import java.util.List;

public interface fmarticleDAO_I {
	public void insert(fmarticleVO fmarticleVO);//�Τ�s�W�峹
    public void update(fmarticleVO fmarticleVO);//�Τ�ק�峹
    public void delete(String fm_no);//�R���峹
    public fmarticleVO getOne(String fm_no);//�d�@��
    public List<fmarticleVO> getAll();//�d�����峹
    public List<fmarticleVO> getfmclAll(String fmcl_no);//�d�����O�����峹
    public List<fmarticleVO> getmemAll(String mem_no);//�d�ݸӷ|�������峹
    public List<fmarticleVO> search(String head);//�ҽk�d��
    
    
}
