package com.depo.model;

import java.util.List;
import com.mem.model.MemVO;

public interface DepoDAO_interface {
	public void newTransAdd(DepoVO depoVO);
	public List<DepoVO> depoSelectByMem(String mem_no);
	public List<DepoVO> depoSelectAllByEmp();
	public DepoVO memNowDepo(String mem_no);
	public void upDateDepoTokStatus(String depo_no);
}
