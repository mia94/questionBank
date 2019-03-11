package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.CustomerVO;
import com.yi.persistence.CustomerDao;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public List<CustomerVO> selectByAll() {
		return customerDao.selectByAll();
	}

	@Override
	public CustomerVO selectByNo(CustomerVO customervo) {
		return customerDao.selectByNo(customervo);
	}

	@Override
	public void insertCustomer(CustomerVO customervo) {
		customerDao.insertCustomer(customervo);
	}

	@Override
	public void deleteCustomer(CustomerVO customervo) {
		customerDao.deleteCustomer(customervo);
	}

	@Override
	public void updateCustomer(CustomerVO customervo) {
		customerDao.updateCustomer(customervo);
	}

	@Override
	public CustomerVO read(String id, String password) {
		// TODO Auto-generated method stub
		return customerDao.read(id, password);
	}

	@Override
	public String selectMaxCustomerCode() {
		// TODO Auto-generated method stub
		return customerDao.selectMaxCustomerCode();
	}

	@Override
	public CustomerVO checkId(String id) {
		// TODO Auto-generated method stub
		return customerDao.checkId(id);
	}

}
