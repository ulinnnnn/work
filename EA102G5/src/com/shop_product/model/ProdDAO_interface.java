package com.shop_product.model;

import java.util.*;


public interface ProdDAO_interface {
		public void insert(ProdVO prodVO);
        public void update(ProdVO prodVO);
        public void delete(String prod_no);
        public ProdVO findByPrimaryKey(String prod_no);
        public List<ProdVO> getAll();
        public List<ProdVO> getCategoryProd(String category_no);
        public void updateStatus(String prod_no, String prod_status);
        
        public void insertPchome(ProdVO prodVO);
        //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//      public List<EmpVO> getAll(Map<String, String[]> map); 

}

