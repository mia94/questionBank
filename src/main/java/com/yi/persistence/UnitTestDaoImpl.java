package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.UnitTestVO;

@Repository
public class UnitTestDaoImpl implements UnitTestDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.unitTestMapper.";

	@Override
	public List<UnitTestVO> selectByAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"selectByAll");
	}

	@Override
	public UnitTestVO selectByNo(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"selectByNo", unitTestvo);
	}

	@Override
	public void insert(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+"insert", unitTestvo);
	}

	@Override
	public void update(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+"update", unitTestvo);
	}

	@Override
	public void delete(UnitTestVO unitTestvo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+"delete", unitTestvo);
	}

}
