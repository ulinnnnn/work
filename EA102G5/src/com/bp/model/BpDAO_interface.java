package com.bp.model;

import java.util.*;

	public interface BpDAO_interface {
        public void insert(BpVO bpVO);//客人新增
        public void update(BpVO bpVO);//客人修改
        public void delete(String bp_no);//後台下架
        public void upload(String bp_no);//後台上架
        public BpVO findByPrimaryKey(String bp_no);//查一個
        public List<BpVO> getAllcanbuy();//前台台查全部可買
        public List<BpVO> getAll();//查全部
        public List<BpVO> findBymen_no(String men_no);//查會員商品
        public List<BpVO> findBymensile(String men_no);//查會員已賣出商品
        public List<BpVO> findBymenbuy(String men_no);//查會員買的商品
        public void update_status(BpVO bpVO);//改狀態
        public void update_buymem(BpVO bpVO);//改狀態
        public List<BpVO> findByhead(String head);//查會員一個

        //萬用複合查詢(傳入參數型態Map)(回傳 List)
//      public List<EmpVO> getAll(Map<String, String[]> map); 
			
}

