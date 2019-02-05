package com.yi.persistence;

import java.util.List;

import com.yi.domain.TestVO;

public interface TestDao {

	public List<TestVO> selectByAll();
	public TestVO selectByNo(TestVO testVO);
	public void insertTest(TestVO testVO);
	public void deleteTest(TestVO testVO);
	public void updateTest(TestVO testVO);
}
