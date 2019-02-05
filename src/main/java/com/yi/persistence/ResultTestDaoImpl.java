package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.CustomerVO;
import com.yi.domain.ResultTestVO;

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteResultTest(ResultTestVO resultTestVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateResultTest(ResultTestVO resultTestVo) {
		// TODO Auto-generated method stub
		
	}

	

}
