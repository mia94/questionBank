package com.yi.persistence;

import java.util.List;

import com.yi.domain.ResultTestVO;

public interface ResultTestDao {
	
	public List<ResultTestVO> selectByAll();
	public ResultTestVO selectByNo();
	public ResultTestVO selectByCustomerCode();
	public void insertResultTest();
	public void deleteResultTest();
	public void updateResultTest();
}
