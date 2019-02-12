package com.yi.service;

import java.util.List;

import com.yi.domain.UnitTestVO;

public interface UnitTestService {
	public List<UnitTestVO> selectByAll();
	public UnitTestVO selectByNo(UnitTestVO unitTestvo);
	public void insert(UnitTestVO unitTestvo);
	public void update(UnitTestVO unitTestvo);
	public void delete(UnitTestVO unitTestvo);
}
