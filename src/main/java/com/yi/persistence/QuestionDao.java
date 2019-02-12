package com.yi.persistence;

import java.util.List;

import com.yi.domain.QuestionVO;

public interface QuestionDao {
	public List<QuestionVO> selectByAll();
	public QuestionVO selectByNO(QuestionVO questionVo);
	public void insert(QuestionVO questionVo);
	public void delete(QuestionVO questionVo);
	public void update(QuestionVO questionVo);
}
