package com.yi.persistence;

import java.util.List;

import com.yi.domain.CustomerVO;

public interface CustomerDao {
	
	public List<CustomerVO> selectByAll();
	public CustomerVO selectByNo(CustomerVO customervo);
	public void insertCustomer(CustomerVO customervo);
	public void deleteCustomer(CustomerVO customervo);
	public void updateCustomer(CustomerVO customervo);
}
