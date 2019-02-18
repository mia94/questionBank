package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Criteria;
import com.yi.domain.QuestionVO;
import com.yi.persistence.QuestionDao;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDao dao;

	@Override
	public List<QuestionVO> selectByAll() {
		// TODO Auto-generated method stub
		return dao.selectByAll();
	}

	@Override
	public QuestionVO selectByNO(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		return dao.selectByNO(questionVo);
	}

	@Override
	public void insert(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		dao.insert(questionVo);
	}

	@Override
	public void delete(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		dao.delete(questionVo);
	}

	@Override
	public void update(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		dao.update(questionVo);
	}

	@Override
	public List<QuestionVO> selectByYearAndRound(int year, int round, Criteria cri) {
		// TODO Auto-generated method stub
		return dao.selectByYearAndRound(year, round, cri);
	}

	@Override
	public List<QuestionVO> listCriteria(int year, int round, Criteria cri) {
		// TODO Auto-generated method stub
		return dao.listCriteria(year, round, cri);
	}

	@Override
	public int totalCount(int year, int round) {
		// TODO Auto-generated method stub
		return dao.totalCount(year, round);
	}

	@Override
	public List<QuestionVO> selectByRandom(int year, int round) {
		// TODO Auto-generated method stub
		return dao.selectByRandom(year, round);
	}

}
