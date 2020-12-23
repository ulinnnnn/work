package com.shop_category.model;

import java.util.List;


public interface CategoryDAO_interface {
	
	public void insert(CategoryVO categoryVO);
    public void update(CategoryVO categoryVO);
    public void delete(String category_no);
    public CategoryVO findByPrimaryKey(String category_no);
    public List<CategoryVO> getAll();

}
