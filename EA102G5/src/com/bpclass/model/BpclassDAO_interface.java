package com.bpclass.model;

import java.util.*;

public interface BpclassDAO_interface {
	
        public void insert(BpclassVO bpclassVO);
        public void update(BpclassVO bpclassVO);
        public void delete(String bpcl_no);
        public BpclassVO findByPrimaryKey(String bpcl_no);
        public List<BpclassVO> getAll();
        
}
