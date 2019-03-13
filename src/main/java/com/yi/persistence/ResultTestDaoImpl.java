package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.CustomerVO;
import com.yi.domain.RateDTO;
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
	public int selectMaxCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectMaxCode");
	}

	@Override
	public void updateByCustomerAndQuestion(ResultTestVO resultTestVo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateByCustomerAndQuestion", resultTestVo);
	}

	@Override
	public List<ResultTestVO> selectIncorrectQuestionByCustomer(String customerCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectIncorrectQuestionByCustomer", customerCode);
	}

	@Override
	public void insertBatchResultTest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertBatchResultTest", map);
	}

	@Override
	public List<String> selectIncorrectQuestionBySubject(String customerCode, String subject) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("customerCode", customerCode);
		map.put("subject",subject);
		return sqlSession.selectList(namespace+".selectIncorrectQuestionBySubject", map);
	}

	@Override
	public List<String> selectIncorrectTopRank(String subject) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectIncorrectTopRank", subject);
	}

	@Override
	public RateDTO selectCorrectRateBySubject(String customerCode, String subject) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("customerCode", customerCode);
		map.put("subject",subject);
		return sqlSession.selectOne(namespace+".selectCorrectRateBySubject", map);
	}

	

}
