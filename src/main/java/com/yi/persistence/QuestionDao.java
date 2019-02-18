package com.yi.persistence;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.QuestionVO;

public interface QuestionDao {
	public List<QuestionVO> selectByAll();
	public QuestionVO selectByNO(QuestionVO questionVo);
	public void insert(QuestionVO questionVo);
	public void delete(QuestionVO questionVo);
	public void update(QuestionVO questionVo);
	
	//∆‰¿Ã¬°
	public List<QuestionVO> selectByYearAndRound(int year, int round, Criteria cri);
	public List<QuestionVO> listCriteria(int year, int round, Criteria cri);
	public int totalCount(int year, int round);
	
}
