package com.yi.questionBank;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.BoardVO;
import com.yi.domain.CustomerVO;
import com.yi.domain.ReplyVO;
import com.yi.service.BoardService;
import com.yi.service.CustomerService;
import com.yi.service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ReplyDaoTest {
	
	@Autowired
	ReplyService service;
	@Autowired
	BoardService boardService;
	@Autowired
	CustomerService customerService;
	
	@Test
	public void test01create() {
		ReplyVO vo = new ReplyVO();
		BoardVO board = new BoardVO();
		board.setBoardCode(2);
		board = boardService.selectByNo(board);
		System.err.println(board);
		vo.setBoardCode(board);
		
		CustomerVO customer = new CustomerVO();
		customer.setCustomerCode("C001");
		customer = customerService.selectByNo(customer);
		System.err.println(customer);
		
		vo.setReplyer(customer);
		vo.setReplyText("´ñ±Û½áÁ®¶ó ¾å!");

		service.create(vo);
	}
	
	@Test
	public void test02list() {
		service.list(2049);
	}
	
	@Test
	public void test03update() {
		ReplyVO vo = new ReplyVO();
		vo.setReplyCode(1);
		vo.setReplyText("´ñ±Û¼öÁ¤ÇÒ²¨¾ä È÷È÷È÷È÷");
		service.update(vo);
	}
	
	//@Test
	public void test04delete() {
		service.delete(6);
	}
	
}

















