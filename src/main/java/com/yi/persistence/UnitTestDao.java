package com.yi.persistence;

import java.util.List;

import com.yi.domain.UnitTestVO;

public interface UnitTestDao {
	public List<UnitTestVO> selectByAll();
	public UnitTestVO selectByNo(UnitTestVO unitTestvo);
	public void insert(UnitTestVO unitTestvo);
	public void update(UnitTestVO unitTestvo);
	public void delete(UnitTestVO unitTestvo);
}
