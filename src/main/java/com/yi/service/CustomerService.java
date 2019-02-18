package com.yi.service;

import java.util.List;

import com.yi.domain.CustomerVO;

public interface CustomerService {

	public List<CustomerVO> selectByAll();
	public CustomerVO selectByNo(CustomerVO customervo);
	public void insertCustomer(CustomerVO customervo);
	public void deleteCustomer(CustomerVO customervo);
	public void updateCustomer(CustomerVO customervo);
	
	public CustomerVO read(String id, String password);
}
