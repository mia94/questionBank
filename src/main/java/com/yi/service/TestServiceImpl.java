package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.TestVO;
import com.yi.persistence.TestDao;

@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao testDao;
	
	@Override
	public List<TestVO> selectByAll() {
		return testDao.selectByAll();
	}

	@Override
	public TestVO selectByNo(TestVO testVO) {
		return testDao.selectByNo(testVO);
	}

	@Override
	public void insertTest(TestVO testVO) {
		testDao.insertTest(testVO);
	}

	@Override
	public void deleteTest(TestVO testVO) {
		testDao.deleteTest(testVO);
	}

	@Override
	public void updateTest(TestVO testVO) {
		testDao.updateTest(testVO);
	}

}
