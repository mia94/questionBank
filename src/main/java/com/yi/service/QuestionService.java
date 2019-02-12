package com.yi.service;

import java.util.List;

import com.yi.domain.QuestionVO;

public interface QuestionService {
	public List<QuestionVO> selectByAll();
	public QuestionVO selectByNO(QuestionVO questionVo);
	public void insert(QuestionVO questionVo);
	public void delete(QuestionVO questionVo);
	public void update(QuestionVO questionVo);
}
