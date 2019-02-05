package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.CustomerVO;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.CustomerMapper";

	@Override
	public List<CustomerVO> selectByAll() {
		return sqlSession.selectList(namespace+".selectByAll");
	}

	@Override
	public CustomerVO selectByNo(CustomerVO customervo) {
		return sqlSession.selectOne(namespace+".selectByNo", customervo);
	}

	@Override
	public void insertCustomer(CustomerVO customervo) {
		sqlSession.insert(namespace+".insertCustomer", customervo);
	}

	@Override
	public void deleteCustomer(CustomerVO customervo) {
		sqlSession.delete(namespace+".deleteCustomer", customervo);
	}

	@Override
	public void updateCustomer(CustomerVO customervo) {
		sqlSession.update(namespace+".updateCustomer", customervo);
	}

}
