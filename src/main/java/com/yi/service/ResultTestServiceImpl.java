package com.yi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.CustomerVO;
import com.yi.domain.ResultTestVO;
import com.yi.domain.TestScroeDTO;
import com.yi.persistence.ResultTestDao;

@Service
public class ResultTestServiceImpl implements ResultTestService {
	
	@Autowired
	private ResultTestDao dao;

	@Override
	public List<ResultTestVO> selectByAll() {
		return dao.selectByAll();
	}

	@Override
	public ResultTestVO selectByNo(ResultTestVO resultTestVo) {
		return dao.selectByNo(resultTestVo);
	}

	@Override
	public List<ResultTestVO> selectByCustomerCode(CustomerVO customerVo) {
		return dao.selectByCustomerCode(customerVo);
	}

	@Override
	public void insertResultTest(ResultTestVO resultTestVo) {
		dao.insertResultTest(resultTestVo);
	}

	@Override
	public void deleteResultTest(ResultTestVO resultTestVo) {
		dao.deleteResultTest(resultTestVo);
	}

	@Override
	public void updateResultTest(ResultTestVO resultTestVo) {
		dao.updateResultTest(resultTestVo);
	}

	@Override
	public TestScroeDTO selectScore(String customerCode, int year, int round) {
		// TODO Auto-generated method stub
		return dao.selectScore(customerCode, year, round);
	}

	@Override
	public int selectMaxCode() {
		// TODO Auto-generated method stub
		return dao.selectMaxCode();
	}

	@Override
	public void updateByCustomerAndQuestion(ResultTestVO resultTestVo) {
		// TODO Auto-generated method stub
		dao.updateByCustomerAndQuestion(resultTestVo);
	}

	@Override
	public List<ResultTestVO> selectIncorrectQuestionByCustomer(String customerCode) {
		// TODO Auto-generated method stub
		return dao.selectIncorrectQuestionByCustomer(customerCode);
	}

	@Override
	public void insertBatchResultTest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		dao.insertBatchResultTest(map);
	}

}
