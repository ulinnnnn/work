package com.Bid_record.model;

import java.util.List;
import java.util.Set;
import com.Bid_commodity.model.Bid_commodityVO;
public interface IBid_record{
			public void insert(Bid_recordVO bid_commodity_noVO);
			public void update(Bid_recordVO bid_commodity_noVO);
			public void update1(Bid_recordVO bid_commodity_noVO);
			public Bid_recordVO findByPrimaryKey(String bp_no);
			public List<Bid_recordVO> getAll();	
}


