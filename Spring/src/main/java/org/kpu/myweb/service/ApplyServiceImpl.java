package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.persistence.ApplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ApplyServiceImpl implements ApplyService{
	@Autowired
	private ApplyDAO ApplyDAO;
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public ApplyVO readApply(int id) throws Exception {
		return ApplyDAO.read(id);
	}
	
	public List<ApplyVO> readApplyList() throws Exception{
		return ApplyDAO.readList();
	}
	
	public void addApply(ApplyVO vo) throws Exception {
		ApplyDAO.add(vo);
	}
	
	public void deleteApply(int id) throws Exception {
		ApplyDAO.delete(id);
	}
	
	public void updateApply(ApplyVO vo) throws Exception {
		ApplyDAO.update(vo);
	}

}