package com.Bid_commodity.model;


import java.util.*;


public interface Bid_commodityDAO_interface{
			public void Bidinsert(Bid_commodityVO bid_commodityVO);
			public void update(Bid_commodityVO bid_commodityVO);
			public void updateprice(Bid_commodityVO bid_commodityVO);
			public void updatetimes(Bid_commodityVO bid_commodityVO);
			public Bid_commodityVO findByPrimaryKey(String bp_no);
			public List<Bid_commodityVO>getbc_no(String bc_no);
			public List<Bid_commodityVO> getAll();
			public void delete(String bp_no);
			public Set<Bid_commodityVO> getBidsByBAP_STATUS(Integer bAP_STATUS);
		
}


