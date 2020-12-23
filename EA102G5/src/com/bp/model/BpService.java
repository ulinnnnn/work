package com.bp.model;

import java.io.InputStream;
import java.sql.Date;
import java.util.List;

import com.bpclass.model.BpclassVO;



public class BpService {
	private BpDAO_interface dao ;
	
	public BpService() {
		dao = new BpDAO();
		
	}
	public BpVO addbp(String bp_head,
				  	String bpcl_no, String bp_new,
				  	String bp_loc,Integer bp_pri,
				  	String bp_del,String bp_text,
				  	Date bp_dot ,
				  	String mem_no , byte[] bp_pic1 , byte[] bp_pic2 ,String lat , String lng) {
		
		//Date bp_upt,Date bp_dot,
		BpVO  bpVO = new BpVO();
		
		bpVO.setBp_head(bp_head);
		bpVO.setBpcl_no(bpcl_no);
		bpVO.setBp_new(bp_new);
		bpVO.setBp_loc(bp_loc);
		bpVO.setBp_pri(bp_pri);
		bpVO.setBp_del(bp_del);
		bpVO.setBp_text(bp_text);
		bpVO.setBp_dot(bp_dot);
		bpVO.setMem_no(mem_no);
		bpVO.setBp_pic1(bp_pic1);
		bpVO.setBp_pic2(bp_pic2);
		bpVO.setLat(lat);
		bpVO.setLng(lng);
		
		dao.insert(bpVO);

		
		return bpVO;
	}
	
	public BpVO updatebp(String bp_no, String bp_head,
		  	String bpcl_no, String bp_new,
		  	String bp_loc,Integer bp_pri,
		  	String bp_del,String bp_text,
		  	Date bp_dot ,
		  	String mem_no , byte[] bp_pic1 , byte[] bp_pic2 ,String lat , String lng){
		
		BpVO  bpVO = new BpVO();
		
		bpVO.setBp_no(bp_no);
		bpVO.setBp_head(bp_head);
		bpVO.setBpcl_no(bpcl_no);
		bpVO.setBp_new(bp_new);
		bpVO.setBp_loc(bp_loc);
		bpVO.setBp_pri(bp_pri);
		bpVO.setBp_del(bp_del);
		bpVO.setBp_text(bp_text);
		bpVO.setBp_dot(bp_dot);
		bpVO.setBp_pic1(bp_pic1);
		bpVO.setBp_pic2(bp_pic2);
		bpVO.setLat(lat);
		bpVO.setLng(lng);
		
		dao.update(bpVO);
		
		return bpVO;
	}
	
	public BpVO update_status(String bpst_no, String bp_no){
		
		BpVO  bpVO = new BpVO();
		
		bpVO.setBpst_no(bpst_no);
		bpVO.setBp_no(bp_no);
		
		dao.update_status(bpVO);

		return bpVO;
	}
	public BpVO update_buymem(String buymem_no, String bp_no){
		
		BpVO  bpVO = new BpVO();
		
		bpVO.setBuymem_no(buymem_no);
		bpVO.setBp_no(bp_no);
		
		dao.update_buymem(bpVO);

		return bpVO;
	}
	
	public void delete(String bp_no) {
		dao.delete(bp_no);
	
	}
	
	public void upload(String bp_no) {
		dao.upload(bp_no);
	
	}
	
	public List<BpVO> getAll(){
		return dao.getAllcanbuy();
		
	}
	public List<BpVO> getBack(){
		return dao.getAll();
		
	}
	
	public BpVO getOnebp(String bp_no) {
		return dao.findByPrimaryKey(bp_no);
	}

	public List<BpVO> gethead(String head) {
		return dao.findByhead(head);
	}
	
	
	
	public List<BpVO> getmem(String mem_no) {
		return dao.findBymen_no(mem_no);
	}
	public List<BpVO> getmemsile(String mem_no) {
		return dao.findBymensile(mem_no);
	}
	public List<BpVO> getmembuy(String mem_no) {
		return dao.findBymenbuy(mem_no);
	}
	
	
}
