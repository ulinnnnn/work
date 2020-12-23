package com.Bid_commodity.model;

import java.io.*;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

public class Bid_commodityService {
	private Bid_commodityDAO_interface dao;

	public Bid_commodityService() {
		dao = new Bid_commodityJDBC();
	}
	public Bid_commodityVO addBid_commodity(String mem_no,Integer bs_price, String b_intro, Timestamp b_startime, Timestamp b_endtime,
			Integer bplus_price, String bc_no, String b_name, byte[] b_picture, byte[] b_picture2) {

		Bid_commodityVO bid_commodityVO = new Bid_commodityVO();
		
		
		bid_commodityVO.setMem_no(mem_no);
		bid_commodityVO.setBs_price(bs_price);
		bid_commodityVO.setB_intro(b_intro);
		bid_commodityVO.setBplus_price(bplus_price);
		bid_commodityVO.setB_startime(b_startime);
		bid_commodityVO.setB_endtime(b_endtime);
		bid_commodityVO.setBc_no(bc_no);
		bid_commodityVO.setB_name(b_name);
		bid_commodityVO.setB_picture(b_picture);
		bid_commodityVO.setB_picture2(b_picture2);

		dao.Bidinsert(bid_commodityVO);
//			bid_commodityVO.setB_TIMES(b_TIMES);之後拉其他資料(次數)
		return bid_commodityVO;
	}
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();
		return baos.toByteArray();
	}
	public Bid_commodityVO updateBid(Integer bs_price, String b_intro, Timestamp b_startime, Timestamp b_endtime,
			Integer bplus_price, String bc_no, String b_name, byte[] b_picture,byte[] b_picture2, String bp_no) {

		Bid_commodityVO bid_commodityVO = new Bid_commodityVO();

		bid_commodityVO.setBs_price(bs_price);
		bid_commodityVO.setB_intro(b_intro);
		bid_commodityVO.setBplus_price(bplus_price);
		bid_commodityVO.setB_startime(b_startime);
		bid_commodityVO.setB_endtime(b_endtime);
		bid_commodityVO.setBc_no(bc_no);
		bid_commodityVO.setB_name(b_name);
		bid_commodityVO.setB_picture(b_picture);
		bid_commodityVO.setB_picture2(b_picture2);
		bid_commodityVO.setBp_no(bp_no);
		dao.update(bid_commodityVO);

		return bid_commodityVO;
	}
	public Bid_commodityVO updateprice(Integer bn_price,String bp_no) {

		Bid_commodityVO bid_commodityVO = new Bid_commodityVO();
		bid_commodityVO.setBn_price(bn_price);
		bid_commodityVO.setBp_no(bp_no);
		dao.updateprice(bid_commodityVO);
		return bid_commodityVO;
	}
	
	public Bid_commodityVO updatetime(Integer b_times,String bp_no) {

		Bid_commodityVO bid_commodityVO = new Bid_commodityVO();
		bid_commodityVO.setB_times(b_times);
		bid_commodityVO.setBp_no(bp_no);
		dao.updatetimes(bid_commodityVO);
		return bid_commodityVO;
	}
	
	public List<Bid_commodityVO> getAll() {
		return dao.getAll();
	}
	public Bid_commodityVO getOneBid(String bp_no) {
		return dao.findByPrimaryKey(bp_no);
	}
	public List<Bid_commodityVO> getOnebc_no(String bc_no) {
		return dao.getbc_no(bc_no);
	}
	public void deleteBid(String bp_no) {
		dao.delete(bp_no);
	}
	public Set<Bid_commodityVO> getBidsByBAP_STATUS(Integer bc_no) {
		return dao.getBidsByBAP_STATUS(bc_no);
	}
}
