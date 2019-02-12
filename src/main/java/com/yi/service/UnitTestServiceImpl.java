package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.UnitTestVO;
import com.yi.persistence.UnitTestDao;

@Service
public class UnitTestServiceImpl implements UnitTestService {
	
	@Autowired
	private UnitTestDao dao;

	@Override
	public List<UnitTestVO> selectByAll() {
		// TODO Auto-generated method stub
		return dao.selectByAll();
	}

	@Override
	public UnitTestVO selectByNo(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		return dao.selectByNo(unitTestvo);
	}

	@Override
	public void insert(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		dao.insert(unitTestvo);
	}

	@Override
	public void update(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		dao.update(unitTestvo);
	}

	@Override
	public void delete(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		dao.delete(unitTestvo);
	}

}
