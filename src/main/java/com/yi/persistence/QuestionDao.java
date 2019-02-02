package com.yi.persistence;

import java.util.List;

import com.yi.domain.QuestionVO;

public interface QuestionDao {
	public List<QuestionVO> selectByAll();
	public QuestionVO selectByNO();
	public void insert();
	public void delete();
	public void update();
}
