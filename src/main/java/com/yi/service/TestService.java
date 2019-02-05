package com.yi.service;

import java.util.List;

import com.yi.domain.TestVO;

public interface TestService {
	
	public List<TestVO> selectByAll();
	public TestVO selectByNo(TestVO testVO);
	public void insertTest(TestVO testVO);
	public void deleteTest(TestVO testVO);
	public void updateTest(TestVO testVO);
	
}
