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
import com.yi.service.CustomerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CustomerDaoTest {
	
	@Autowired
	private CustomerService service;
	
	//@Test
	public void test01insert() {
		CustomerVO vo = new CustomerVO();
		vo.setCustomerCode("C001");
		vo.setCustomerName("È«±æµ¿");
		vo.setEmail("hong@test.com");
		vo.setEmployee(false);
		vo.setId("hong3");
		vo.setPassword("11112222");
		service.insertCustomer(vo);
	}
	
	//@Test
	public void test02selectByAll() {
		List<CustomerVO> list = service.selectByAll();
		Assert.assertNotNull(list);
	}
	
	//@Test
	public void test03selectByNo() {
		CustomerVO vo = new CustomerVO();
		vo.setCustomerCode("C001");
		CustomerVO newVo = service.selectByNo(vo);
		Assert.assertNotNull(newVo);
	}
	
	//@Test
	public void test04update() {
		CustomerVO vo = new CustomerVO();
		vo.setCustomerName("¼öÁ¤È«");
		vo.setCustomerCode("C002");
		vo.setEmail("hong@test.com");
		vo.setEmployee(false);
		vo.setId("hong3");
		vo.setPassword("11112222");
		service.updateCustomer(vo);
	}
	
	//@Test
	public void test05delete() {
		CustomerVO vo = new CustomerVO();
		vo.setCustomerCode("C002");
		service.deleteCustomer(vo);
	}
	
	@Test
	public void test06checkId() {
		CustomerVO vo = service.checkId("E001");
		System.out.println(vo);
	}
	
}


























