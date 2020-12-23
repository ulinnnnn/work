package com.fmmessage.model;

import java.util.List;

import com.fmmessage.model.fmmeVO;

public class fmmeService {
	private fmmeDAO_interface dao ;
	
	public fmmeService() {
		dao = new fmmeDAO();
		
	}
	public fmmeVO addfmme(String fm_no,String mem_no,String qmem_no,String qfmme_text){
		
		//Date fm_upt,Date fm_dot,
		fmmeVO  fmmeVO = new fmmeVO();
		
		fmmeVO.setFm_no(fm_no);
		fmmeVO.setMem_no(mem_no);
		fmmeVO.setQmem_no(qmem_no);
		fmmeVO.setQfmme_text(qfmme_text);
		
		dao.insert_q(fmmeVO);

		return fmmeVO;
	}	
		public fmmeVO updatefmme(String fmme_text, String fmme_no) {

			fmmeVO fmmeVO = new fmmeVO();

			fmmeVO.setFmme_text(fmme_text);
			fmmeVO.setFmme_no(fmme_no);

			dao.update_a(fmmeVO);
			
			return fmmeVO;
			
		}
		
		public List<fmmeVO> findByfm_no(String fm_no) {
			return dao.findByfm_no(fm_no);
		}
		
		public List<fmmeVO> findByqmem_no(String qmem_no) {
			return dao.findByqmem_no(qmem_no);
		}

		public List<fmmeVO> getAll(){
			return dao.getAll();
		}
	
	

}
