package com.fmarticle.model;

import java.sql.Date;
import java.util.List;




public class fmarticleService {
	private fmarticleDAO_I daoI;
	
	public fmarticleService() {
		daoI = new fmarticleDAO();
	}
	
	public fmarticleVO addfm(String fm_head,
		  	String fm_text, String mem_no,
		  	String fmcl_no,	byte[] fm_pic1,
		  	byte[] fm_pic2) {
	
	//Date bp_upt,Date bp_dot,
		fmarticleVO  fmarticleVO = new fmarticleVO();
		
		fmarticleVO.setFm_head(fm_head);
		fmarticleVO.setFm_text(fm_text);
		fmarticleVO.setMem_no(mem_no);
		fmarticleVO.setFmcl_no(fmcl_no);
		fmarticleVO.setFm_pic1(fm_pic1);
		fmarticleVO.setFm_pic2(fm_pic2);
//		fmarticleVO.setFm_pic3(fm_pic3);
		
		
		daoI.insert(fmarticleVO);
		//String bp,String mem_no,String bpnew
		//, String bploc, Integer bppri,String bpdel
		//,Date bpupt,String bptext,String bphead
		return fmarticleVO;
	}

	public fmarticleVO updatefm(String fm_no, String fm_head,
		  	String fm_text, String mem_no,
		  	String fmcl_no,	byte[] fm_pic1,
		  	byte[] fm_pic2){
		
		fmarticleVO  fmarticleVO = new fmarticleVO();
		System.out.println("2");
		fmarticleVO.setFm_no(fm_no);
		fmarticleVO.setFm_head(fm_head);
		fmarticleVO.setFm_text(fm_text);
//		fmarticleVO.setMem_no(mem_no);
		fmarticleVO.setFmcl_no(fmcl_no);
		fmarticleVO.setFm_pic1(fm_pic1);
		fmarticleVO.setFm_pic2(fm_pic2);
		System.out.println("3");
//		fmarticleVO.setFm_pic3(fm_pic3);
		
		daoI.update(fmarticleVO);
		
	
		System.out.println("4");
		return fmarticleVO;
	}
	

	public void delete(String fm_no) {
		daoI.delete(fm_no);
	}

	public fmarticleVO getOne(String fm_no) {
		return daoI.getOne(fm_no);
	}
	
	public List<fmarticleVO> getBack(){
		return daoI.getAll();
		
	}

	public List<fmarticleVO> getAll() {
		return daoI.getAll();
	}

	public List<fmarticleVO> getfmclAll(String fmcl_no) {
		return daoI.getfmclAll(fmcl_no);
	}

	public List<fmarticleVO> getmemAll(String mem_no) {
		return daoI.getmemAll(mem_no);
	}

	public List<fmarticleVO> search(String head) {
		return daoI.search(head);
	}
	
	

}
