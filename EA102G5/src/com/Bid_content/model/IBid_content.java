package com.Bid_content.model;

import java.util.List;
import java.util.Set;

import com.Bid_commodity.model.Bid_commodityVO;


public interface IBid_content{
			public void insert(Bid_contentVO bid_contentVO);
			public void update(Bid_contentVO bid_contentVO);
			public Bid_contentVO findByPrimaryKey(String bm_no);
			public void delete(String bm_no);
			public List<Bid_contentVO> getcontentAll(String bp_no);
			public List<Bid_contentVO> getAll();
}


