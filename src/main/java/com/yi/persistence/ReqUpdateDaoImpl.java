package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.ReqUpdateVO;

@Repository
public class ReqUpdateDaoImpl implements RequpdateDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.ReqUpdate";

	@Override
	public List<ReqUpdateVO> selectByQuestionCode(String questionCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectByQuestionCode", questionCode);
	}

	@Override
	public void insert(ReqUpdateVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insert", vo);
	}

	@Override
	public void update(ReqUpdateVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update", vo);
	}

	@Override
	public void delete(int ReqUpdateCode) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete", ReqUpdateCode);
	}

	@Override
	public ReqUpdateVO selectByCode(int ReqUpdateCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectByCode", ReqUpdateCode);
	}

}
