package com.yi.questionBank;

import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.TestVO;
import com.yi.service.TestService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestDaoTest {
	
	@Autowired
	private TestService testService;

	
	@Test
	public void test01insertTest() {
		TestVO vo = new TestVO();
		vo.setTestCode("T001");
		vo.setTestTime(150);
		vo.setRound(1);
		vo.setYear(2017);
		testService.insertTest(vo);
	}
	
	@Test
	public void test02selectByAll() {
		List<TestVO> list = testService.selectByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}
	
	@Test
	public void test03selectByNO() {
		TestVO vo = new TestVO();
		vo.setTestCode("T001");
		TestVO newVO = testService.selectByNo(vo);
		Assert.assertNotNull(newVO);
		System.out.println(newVO);
	}
	
	@Test
	public void test04update() {
		TestVO vo = new TestVO();
		vo.setTestCode("T001");
		vo.setYear(2018);
		testService.updateTest(vo);
	}
	
	@Test
	public void test05delete() {
		TestVO vo = new TestVO();
		vo.setTestCode("T001");
		testService.deleteTest(vo);
	}
	
	
}























