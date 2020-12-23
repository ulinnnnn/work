package com.Bid_commodity_no.model;
import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_commodity_no.model.Bid_commodity_noVO;
import java.util.List;
import java.util.Set;
public class Bid_commodity_noService {

		private IBid_commodity_no dao;

		public Bid_commodity_noService() {
			dao = new Bid_commodity_noJDBC();
		}
		public List<Bid_commodity_noVO> getAll() {
			return dao.getAll();
		}
		public Bid_commodity_noVO getOnebc_no(String bc_no) {
			return dao.findByPrimaryKey(bc_no);
		}
		public void deletebc_no(String bc_no) {
			dao.delete(bc_no);
		
	}

}
