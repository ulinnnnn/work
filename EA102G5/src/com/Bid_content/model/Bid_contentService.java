package com.Bid_content.model;
import java.sql.*;
import java.util.*;
import com.Bid_content.model.IBid_content;
import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_content.model.Bid_contentJDBC;


	public class Bid_contentService {
		private IBid_content dao;

		public Bid_contentService() {
			dao = new Bid_contentJDBC();
		}

		public Bid_contentVO addBid_content(String bp_no,String mem_no, String br_content) {

			Bid_contentVO bid_contentVO = new Bid_contentVO();

			bid_contentVO.setBp_no(bp_no);
			bid_contentVO.setMem_no(mem_no);
			bid_contentVO.setBr_content(br_content);


			dao.insert(bid_contentVO);
//				bid_contentVO.setB_TIMES(b_TIMES);之後拉其他資料(次數)
			return bid_contentVO;

		}

		public Bid_contentVO update(String bp_no,String mem_no, String br_content) {

			Bid_contentVO bid_contentVO = new Bid_contentVO();

			bid_contentVO.setBp_no(bp_no);
			bid_contentVO.setMem_no(mem_no);
			bid_contentVO.setBr_content(br_content);
			dao.update(bid_contentVO);

			return bid_contentVO;
		}
		public Bid_contentVO getcontent(String bm_no) {
			return dao.findByPrimaryKey(bm_no);
		}
		public List<Bid_contentVO> getAll(String bp_no) {
			return dao.getcontentAll(bp_no);
		}
		public List<Bid_contentVO> getcontentAll() {
			return dao.getAll();
		}

		public void deletecontent(String bp_no) {
			dao.delete(bp_no);
		}


	}



