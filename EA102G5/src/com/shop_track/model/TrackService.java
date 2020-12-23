package com.shop_track.model;

import java.util.List;


public class TrackService {
	
	private TrackDAO_interface dao;
	
	public TrackService() {
		dao = new TrackDAO();
	}
	
	public void addTrack(TrackVO trackVO) {
		dao.insert(trackVO);
	}
	
	
	public TrackVO updateTrack(String mem_no, String prod_no) {

		TrackVO trackVO = new TrackVO();

		trackVO.setMemNo("mem_no");
		trackVO.setProdNo("prod_no");
		dao.update(trackVO);

		return trackVO;
	}
	
	public TrackVO getOneTrack(String mem_no, String prod_no) {
		return dao.findByPrimaryKey(mem_no,prod_no);
	}
	
	public List<TrackVO> getAll() {
		return dao.getAll();
	}
	
	public List<TrackVO> getMemTrack(String mem_no) {
		return dao.getMemTrack(mem_no);
	}
	public void deleteTrack(TrackVO trackVO) {
		 dao.deleteTrack(trackVO);
	}
}

