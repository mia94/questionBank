package com.yi.questionBank;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.ResultTestVO;
import com.yi.service.ResultTestService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ResultTestDaoTest {

	@Autowired
	private ResultTestService service;
	
	@Test
	public void test01insert() {
		ResultTestVO vo = new ResultTestVO();
		vo.setResultTestCode("");
	}
	
	@Test
	public void test02selectByAll() {
		service.selectByAll();
	}
}
