package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
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

	@Override
	public List<QuestionVO> selectByYearAndRound(int year, int round, Criteria cri) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("round", round);
		map.put("cri", cri);
		return sqlSession.selectList(namespace+".selectByYearAndRound", map);
	}

	@Override
	public List<QuestionVO> listCriteria(int year, int round, Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("round", round);
		map.put("cri", cri);
		return sqlSession.selectList(namespace+".listCriteria", map);
	}

	@Override
	public int totalCount(int year, int round) {
		Map<String, Integer> map = new HashMap<>();
		map.put("year", year);
		map.put("round", round);
		return sqlSession.selectOne(namespace+".totalCount", map);
	}

	@Override
	public List<QuestionVO> selectByRandom(int year, int round) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<>();
		map.put("year", year);
		map.put("round", round);
		return sqlSession.selectList(namespace+".selectByRandom", map);
	}

}
