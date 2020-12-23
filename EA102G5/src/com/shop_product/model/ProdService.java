package com.shop_product.model;


import java.util.*;


public class ProdService {
	
	private ProdDAO_interface dao;
	
	public ProdService() {
		dao = new ProdDAO();
	}
	
	public ProdVO addProd(String prod_name, Double prod_price, String prod_brand,
		 String prod_intro, String category_no, String prod_status, byte[] prod_photo) {

		ProdVO prodVO = new ProdVO();

		prodVO.setProdName(prod_name);
		prodVO.setProdPrice(prod_price);
		prodVO.setProdBrand(prod_brand);
		prodVO.setProdIntro(prod_intro);
		prodVO.setCategoryNo(category_no);
		prodVO.setProdStatus(prod_status);
		prodVO.setProdPhoto(prod_photo);
		
		dao.insert(prodVO);

		return prodVO;
	}
	
	
	public ProdVO updateProd(String prod_no, String prod_name, Double prod_price
			, String prod_brand, String prod_intro
			, String category_no, String prod_status, byte[] prod_photo) {

		ProdVO prodVO = new ProdVO();

		prodVO.setProdNo(prod_no);
		prodVO.setProdName(prod_name);
		prodVO.setProdPrice(prod_price);
		prodVO.setProdBrand(prod_brand);
		prodVO.setProdIntro(prod_intro);
		prodVO.setCategoryNo(category_no);
		prodVO.setProdStatus(prod_status);
		prodVO.setProdPhoto(prod_photo);
		dao.update(prodVO);

		return prodVO;
	}
	
	public void deleteProd(String prod_no) {
		dao.delete(prod_no);
		
	}
	
	public ProdVO getOneProd(String prod_no) {
		return dao.findByPrimaryKey(prod_no);
	}
	
	public List<ProdVO> getAll() {
		return dao.getAll();
	}
	
	public List<ProdVO> getCategoryProd(String category_no){
		return dao.getCategoryProd(category_no);
	}
	
	
	public List<ProdVO> getRecommandProd(String prod_no){
		
		List<ProdVO> allProdVO = dao.getAll();
		ProdVO prodVO = dao.findByPrimaryKey(prod_no);
		List<ProdVO> list = new ArrayList<ProdVO>();
		Double price = prodVO.getProdPrice();
		Double maxPrice = (price * 1.15);
		Double minPrice = price * 0.85;
		int maxPriceInt = maxPrice.intValue();
		int minPriceInt = minPrice.intValue();

		for(int i = 0; i < allProdVO.size(); i++) {
			ProdVO oneProdVO = allProdVO.get(i);
			Double onePrice = oneProdVO.getProdPrice();
			int onePriceInt = onePrice.intValue();
			if(oneProdVO.getProdNo() != prod_no) {
				if(onePriceInt <= maxPriceInt && onePriceInt >= minPriceInt) {
					list.add(oneProdVO);
				}
			}
		}
		
		int[] arr = new int[4];
		for(int i = 0; i < 4; i++) {
			arr[i] = (int)(Math.random()*(list.size()));
			for(int j = 0; j < i; j++) {
				if(arr[i] == arr[j]) {
					i--;
					break;
				}
			}
		}
		
		List<ProdVO> recommandList = new ArrayList<ProdVO>();
		for(int i = 0; i < 4; i++) {
			int index = arr[i];
			recommandList.add(list.get(index));
		}
		return recommandList;
	}
	
	public void updateStatus(String prod_no, String prod_status) {
		dao.updateStatus(prod_no, prod_status);
	}
	
	public ProdVO addProdPchome(String prod_name, Double prod_price, String prod_brand,
			 String prod_intro, String category_no, String prod_status) {

			ProdVO prodVO = new ProdVO();

			prodVO.setProdName(prod_name);
			prodVO.setProdPrice(prod_price);
			prodVO.setProdBrand(prod_brand);
			prodVO.setProdIntro(prod_intro);
			prodVO.setCategoryNo(category_no);
			prodVO.setProdStatus(prod_status);
			
			dao.insertPchome(prodVO);

			return prodVO;
	}
	
	

}

