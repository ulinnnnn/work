package com.shop_category.model;

import java.util.List;


public class CategoryService {
	
	private CategoryDAO_interface dao;
	
	public CategoryService() {
		dao = new CategoryDAO();
	}
	
	public CategoryVO addCategory(String category_no, String category_name) {

		CategoryVO categoryVO = new CategoryVO();

		categoryVO.setCategoryNo("category_no");
		categoryVO.setCategoryName("category_name");
		dao.update(categoryVO);

		return categoryVO;
	}
	
	
	public CategoryVO updateCategory(String category_no, String category_name) {

		CategoryVO categoryVO = new CategoryVO();

		categoryVO.setCategoryNo("category_no");
		categoryVO.setCategoryName("category_name");
		dao.update(categoryVO);

		return categoryVO;
	}
	
	public void deleteCategory(String category_no) {
		dao.delete(category_no);
	}
	
	public CategoryVO getOneCategory(String category_no) {
		return dao.findByPrimaryKey(category_no);
	}
	
	public List<CategoryVO> getAll() {
		return dao.getAll();
	}
}
