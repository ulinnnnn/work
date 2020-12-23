package com.Bid_commodity_track.model;

import java.util.List;

import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_commodity_track.model.Bid_commodity_trackVO;

public interface IBid_commodity_track {	
		public void updatestat(Bid_commodity_trackVO bid_commodity_trackVO);
		public void insert(Bid_commodity_trackVO bid_commodity_trackVO);
		public void delete(String bc_no,String mem_no);		
		public Bid_commodity_trackVO get_one(String bp_no,String mem_no);
		public List<Bid_commodity_trackVO> getAll();
}
