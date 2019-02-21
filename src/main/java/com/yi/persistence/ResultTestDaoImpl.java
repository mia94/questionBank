package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.CustomerVO;
import com.yi.domain.ResultTestVO;
import com.yi.domain.TestScroeDTO;

@Repository
public class ResultTestDaoImpl implements ResultTestDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.ResultTestMapper";

	@Override
	public List<ResultTestVO> selectByAll() {
		return sqlSession.selectList(namespace+".selectByAll");
	}

	@Override
	public ResultTestVO selectByNo(ResultTestVO resultTestVo) {
		return sqlSession.selectOne(namespace+".selectByNo", resultTestVo);
	}

	@Override
	public List<ResultTestVO> selectByCustomerCode(CustomerVO customerVo) {
		return sqlSession.selectList(namespace+".selectByCustomerCode", customerVo);
	}

	@Override
	public void insertResultTest(ResultTestVO resultTestVo) {
		sqlSession.insert(namespace+".insertResultTest", resultTestVo);
		
	}

	@Override
	public void deleteResultTest(ResultTestVO resultTestVo) {
		sqlSession.delete(namespace+".deleteResultTest", resultTestVo);
	}

	@Override
	public void updateResultTest(ResultTestVO resultTestVo) {
		sqlSession.update(namespace+".updateResultTest", resultTestVo);
	}

	@Override
	public TestScroeDTO selectScore(String customerCode, int year, int round) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("customerCode", customerCode);
		map.put("round",round);
		map.put("year", year);
		return sqlSession.selectOne(namespace+".selectScore",map);
	}

	@Override
	public int selectMaxCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectMaxCode");
	}

	@Override
	public void updateByCustomerAndQuestion(ResultTestVO resultTestVo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateByCustomerAndQuestion", resultTestVo);
	}

	

}
