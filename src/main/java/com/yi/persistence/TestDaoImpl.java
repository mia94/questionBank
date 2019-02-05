package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TestVO;

@Repository
public class TestDaoImpl implements TestDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.TestMapper";
	
	@Override
	public List<TestVO> selectByAll() {
		return sqlSession.selectList(namespace+".selectByAll");
	}

	@Override
	public TestVO selectByNo(TestVO testVO) {
		return sqlSession.selectOne(namespace+".selectByNo", testVO);
	}

	@Override
	public void insertTest(TestVO testVO) {
		sqlSession.insert(namespace+".insertTest", testVO);
	}

	@Override
	public void deleteTest(TestVO testVO) {
		sqlSession.delete(namespace+".deleteTest", testVO);
	}

	@Override
	public void updateTest(TestVO testVO) {
		sqlSession.update(namespace+".updateTest", testVO);
	}



}
