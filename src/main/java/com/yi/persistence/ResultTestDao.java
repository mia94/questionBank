package com.yi.persistence;

import java.util.List;
import java.util.Map;

import com.yi.domain.CustomerVO;
import com.yi.domain.ResultTestVO;
import com.yi.domain.TestScroeDTO;

public interface ResultTestDao {
	
	public List<ResultTestVO> selectByAll();
	public ResultTestVO selectByNo(ResultTestVO resultTestVo);
	public List<ResultTestVO> selectByCustomerCode(CustomerVO customerVo);
	public void insertResultTest(ResultTestVO resultTestVo);
	public void deleteResultTest(ResultTestVO resultTestVo);
	public void updateResultTest(ResultTestVO resultTestVo);
	
	//maxNum구하기
	public int selectMaxCode();
	//고객번호와 문제번호를 이용하여 update
	public void updateByCustomerAndQuestion(ResultTestVO resultTestVo);
	//고객별 오답노트 리스트
	public List<ResultTestVO> selectIncorrectQuestionByCustomer(String customerCode);
	public List<String> selectIncorrectQuestionBySubject(String customerCode, String subject);
	//batch insert
	public void insertBatchResultTest(Map<String, Object> map);
	//많이 틀린 문제 select
	public List<String> selectIncorrectTopRank(String subject);
}
