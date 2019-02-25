package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.ReqUpdateVO;
import com.yi.persistence.RequpdateDao;

@Service
public class ReqUpdateServiceImpl implements ReqUpdateService {
	
	@Autowired
	private RequpdateDao dao;

	@Override
	public List<ReqUpdateVO> selectByQuestionCode(String questionCode) {
		// TODO Auto-generated method stub
		return dao.selectByQuestionCode(questionCode);
	}

	@Override
	public void insert(ReqUpdateVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void update(ReqUpdateVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int ReqUpdateCode) {
		// TODO Auto-generated method stub
		dao.delete(ReqUpdateCode);
	}

	@Override
	public ReqUpdateVO selectByCode(int ReqUpdateCode) {
		// TODO Auto-generated method stub
		return dao.selectByCode(ReqUpdateCode);
	}

}
