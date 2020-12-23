package com.Bid_record.model;
import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_record.model.Bid_recordVO;
import com.Bid_record.model.Bid_recordVO;

import java.sql.Timestamp;
import java.util.List;
public class Bid_recordService {

		private IBid_record dao;

		public Bid_recordService() {
			dao = new Bid_recordJDBC();
		}
		public List<Bid_recordVO> getAll() {
			return dao.getAll();
		}
		public Bid_recordVO getOnebc_no(String bp_no) {
			return dao.findByPrimaryKey(bp_no);
		}

		public Bid_recordVO addBid_record(String bp_no, String mem_no,Integer b_price) {

			Bid_recordVO bid_recordVO = new Bid_recordVO();

			bid_recordVO.setBp_no(bp_no);
			bid_recordVO.setMem_no(mem_no);
			bid_recordVO.setB_price(b_price);


			dao.insert(bid_recordVO);
//				bid_recordVO.setB_TIMES(b_TIMES);之後拉其他資料(次數)
			return bid_recordVO;

		}
		public Bid_recordVO updateBid(String bo_statusno, String br_no) {

			Bid_recordVO bid_recordVO = new Bid_recordVO();

			bid_recordVO.setBr_no(br_no);
			bid_recordVO.setBo_statusno(bo_statusno);

			
			dao.update(bid_recordVO);
			return bid_recordVO;
		}
		public Bid_recordVO updateBid1(String bo_statusno, String bp_no) {

			Bid_recordVO bid_recordVO = new Bid_recordVO();

			bid_recordVO.setBp_no(bp_no);
			bid_recordVO.setBo_statusno(bo_statusno);

			
			dao.update(bid_recordVO);
			return bid_recordVO;
		}

}
