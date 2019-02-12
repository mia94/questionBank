package com.yi.questionBank;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.CustomerVO;
import com.yi.domain.QuestionVO;
import com.yi.domain.TestVO;
import com.yi.domain.UnitTestVO;
import com.yi.service.CustomerService;
import com.yi.service.QuestionService;
import com.yi.service.TestService;
import com.yi.service.UnitTestService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UnitTestDaoTest {
	
	@Autowired
	private UnitTestService service;
	@Autowired
	private CustomerService cService;
	@Autowired
	private TestService tService;
	@Autowired
	private QuestionService qService;
	
	@Test
	public void test01selectByAll() {
		List<UnitTestVO> list = service.selectByAll();
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test02selectByNo() {
		UnitTestVO vo = new UnitTestVO();
		vo.setUnitTestCode(4);
		vo = service.selectByNo(vo);
		Assert.assertNotNull(vo);
	}
	
	@Test
	public void test03insert() {
		UnitTestVO vo = new UnitTestVO();
		vo.setAnswer(1);
		vo.setCorrect(true);
		
		CustomerVO cVo = new CustomerVO();
		cVo.setCustomerCode("C001");
		cVo = cService.selectByNo(cVo);
		vo.setCustomer(cVo);
		
		TestVO tVo = new TestVO();
		tVo.setTestCode("T002");
		tVo = tService.selectByNo(tVo);
		vo.setTest(tVo);
		
		QuestionVO qVo = new QuestionVO();
		qVo.setQuestionCode("QA20183001");
		qVo = qService.selectByNO(qVo);
		vo.setQuestion(qVo);
		
		service.insert(vo);
	}
	
	@Test
	public void test04update() {
		UnitTestVO vo = new UnitTestVO();
		vo.setAnswer(2);
		vo.setCorrect(true);
		
		CustomerVO cVo = new CustomerVO();
		cVo.setCustomerCode("C001");
		cVo = cService.selectByNo(cVo);
		vo.setCustomer(cVo);
		
		TestVO tVo = new TestVO();
		tVo.setTestCode("T002");
		tVo = tService.selectByNo(tVo);
		vo.setTest(tVo);
		
		QuestionVO qVo = new QuestionVO();
		qVo.setQuestionCode("QA20183001");
		qVo = qService.selectByNO(qVo);
		vo.setQuestion(qVo);
		
		service.update(vo);
	}
	
	@Test
	public void test05delete() {
		UnitTestVO vo = new UnitTestVO();
		vo.setUnitTestCode(6);
		
		service.delete(vo);
	}

}
