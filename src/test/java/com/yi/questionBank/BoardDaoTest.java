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

import com.yi.domain.BoardVO;
import com.yi.domain.CustomerVO;
import com.yi.service.BoardService;
import com.yi.service.CustomerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BoardDaoTest {
	
	@Autowired
	private BoardService service;
	@Autowired
	private CustomerService cService;
	
	@Test
	public void test01insert() {
		BoardVO vo = new BoardVO();
		vo.setBoardTitle("테스트");
		vo.setContent("성공해라 얍");
		
		CustomerVO cVo = new CustomerVO();
		cVo.setCustomerCode("C001");
		cVo = cService.selectByNo(cVo);
		vo.setWriter(cVo);
		
		service.insertBoard(vo);
	}
	
	@Test
	public void test02selectByAll() {
		List<BoardVO> list = service.selectByAll();
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test03selectByNo() {
		BoardVO vo = new BoardVO();
		vo.setBoardCode(2);
		vo = service.selectByNo(vo);
		Assert.assertNotNull(vo);
	}
	
	@Test
	public void test04update() {
		BoardVO vo = new BoardVO();
		vo.setBoardCode(2);
		vo = service.selectByNo(vo);
		vo.setBoardTitle("수정");
		service.updateBoard(vo);
	}
	
	@Test
	public void test05delete() {
		BoardVO vo = new BoardVO();
		vo.setBoardCode(1);
		service.deleteBoard(vo);
	}
}























