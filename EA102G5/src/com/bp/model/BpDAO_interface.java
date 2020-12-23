package com.bp.model;

import java.util.*;

	public interface BpDAO_interface {
        public void insert(BpVO bpVO);//�ȤH�s�W
        public void update(BpVO bpVO);//�ȤH�ק�
        public void delete(String bp_no);//��x�U�[
        public void upload(String bp_no);//��x�W�[
        public BpVO findByPrimaryKey(String bp_no);//�d�@��
        public List<BpVO> getAllcanbuy();//�e�x�x�d�����i�R
        public List<BpVO> getAll();//�d����
        public List<BpVO> findBymen_no(String men_no);//�d�|���ӫ~
        public List<BpVO> findBymensile(String men_no);//�d�|���w��X�ӫ~
        public List<BpVO> findBymenbuy(String men_no);//�d�|���R���ӫ~
        public void update_status(BpVO bpVO);//�窱�A
        public void update_buymem(BpVO bpVO);//�窱�A
        public List<BpVO> findByhead(String head);//�d�|���@��

        //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//      public List<EmpVO> getAll(Map<String, String[]> map); 
			
}

