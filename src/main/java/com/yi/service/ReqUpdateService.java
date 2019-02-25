package com.yi.service;

import java.util.List;

import com.yi.domain.ReqUpdateVO;

public interface ReqUpdateService {
	public List<ReqUpdateVO> selectByQuestionCode(String questionCode);
	public void insert(ReqUpdateVO vo);
	public void update(ReqUpdateVO vo);
	public void delete(int ReqUpdateCode);
	
	public ReqUpdateVO selectByCode(int ReqUpdateCode);
}
