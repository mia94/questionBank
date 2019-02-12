package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.QuestionVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.QuestionMapper";


	@Override
	public List<QuestionVO> selectByAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectByAll");
	}

	@Override
	public QuestionVO selectByNO(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectByNO", questionVo);
	}

	@Override
	public void insert(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insert", questionVo);
	}

	@Override
	public void delete(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete", questionVo);
	}

	@Override
	public void update(QuestionVO questionVo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update", questionVo);
	}

}
