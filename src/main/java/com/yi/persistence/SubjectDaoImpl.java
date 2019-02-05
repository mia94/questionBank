package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.SubjectVO;

@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.SubjectMapper";
	
	@Override
	public List<SubjectVO> selectByAll() {
		return sqlSession.selectList(namespace+".selectByAll");
	}

	@Override
	public SubjectVO selectByNo(SubjectVO subjectVo) {
		return sqlSession.selectOne(namespace+".selectByNo", subjectVo);
	}

	@Override
	public void insertSubject(SubjectVO subjectVo) {
		sqlSession.insert(namespace+".insertSubject", subjectVo);
	}

	@Override
	public void updateSubject(SubjectVO subjectVo) {
		sqlSession.update(namespace+".updateSubject", subjectVo);
		
	}

	@Override
	public void deleteSubject(SubjectVO subjectVo) {
		sqlSession.delete(namespace+".deleteSubject", subjectVo);
	}

}
