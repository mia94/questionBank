package com.yi.persistence;

import java.util.List;

import com.yi.domain.ReqUpdateVO;

public interface RequpdateDao {
	public List<ReqUpdateVO> selectByQuestionCode(String questionCode);
	public void insert(ReqUpdateVO vo);
	public void update(ReqUpdateVO vo);
	public void delete(int ReqUpdateCode);
	
	public ReqUpdateVO selectByCode(int ReqUpdateCode);
}
