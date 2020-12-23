package com.Bid_commodity_track.model;

import java.sql.Timestamp;
import java.util.List;

import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_commodity_track.model.Bid_commodity_trackVO;


public class Bid_commodity_trackService {


	private IBid_commodity_track dao;

	public Bid_commodity_trackService() {
		dao = new Bid_commodity_trackJDBC();
	}
	public Bid_commodity_trackVO addBid_track(String bp_no, String mem_no) {

		Bid_commodity_trackVO bid_commodity_trackVO = new Bid_commodity_trackVO();

		bid_commodity_trackVO.setBp_no(bp_no);
		bid_commodity_trackVO.setMem_no(mem_no);
		dao.insert(bid_commodity_trackVO);
		return bid_commodity_trackVO;

	}
	public Bid_commodity_trackVO updatestat(String bp_no, String mem_no) {

		Bid_commodity_trackVO bid_commodity_trackVO = new Bid_commodity_trackVO();

		bid_commodity_trackVO.setBp_no(bp_no);
		bid_commodity_trackVO.setMem_no(mem_no);
		dao.updatestat(bid_commodity_trackVO);
		return bid_commodity_trackVO;

	}
	public Bid_commodity_trackVO get_one(String bp_no,String mem_no) {
		return dao.get_one(bp_no,mem_no);
	}


	public List<Bid_commodity_trackVO> getAll() {
		return dao.getAll();
	}
	public void deletetrack(String bp_no,String mem_no) {
		dao.delete(bp_no,mem_no);
	
}

}
