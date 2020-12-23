package com.Bid_commodity_no.model;

import java.util.List;
import java.util.Set;
import com.Bid_commodity.model.Bid_commodityVO;
public interface IBid_commodity_no{
			public void insert(Bid_commodity_noVO bid_commodity_noVO);
			public void update(Bid_commodity_noVO bid_commodity_noVO);
			public Bid_commodity_noVO findByPrimaryKey(String bc_no);
			public List<Bid_commodity_noVO> getAll();
			public void delete(String bc_no);		
}


