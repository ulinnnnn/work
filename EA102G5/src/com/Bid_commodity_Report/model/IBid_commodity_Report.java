package com.Bid_commodity_Report.model;


import java.util.*;
import com.Bid_commodity_Report.model.Bid_commodity_ReportVO;

public interface IBid_commodity_Report{
			public void insert(Bid_commodity_ReportVO bidVO);
			public void update(Bid_commodity_ReportVO bidVO);
			public Bid_commodity_ReportVO findByPrimaryKey(String mem_no,Integer bap_status);
			public List<Bid_commodity_ReportVO> getAll();
			public List<Bid_commodity_ReportVO> findByKey(Integer bap_status);
}

