package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.CustomerVO;
import com.yi.domain.QuestionVO;
import com.yi.domain.ResultTestVO;
import com.yi.service.ResultTestService;

@Controller
@RequestMapping("/question/*")
public class ResultTestController {
	private static final Logger logger = LoggerFactory.getLogger(ResultTestController.class);
	
	@Autowired
	private ResultTestService service;
	
	@RequestMapping(value="result", method=RequestMethod.POST)
	public String addAnswer(ResultTestVO vo) {
		logger.info("registerResultTest create------------POST");
		
		return "redirect:/resultTest/list"; 
	}
	
	//랜덤으로 한문제씩 post용, insert시키기
	@RequestMapping(value="singletest", method=RequestMethod.POST)
	public String singletestresult(ResultTestVO vo, CustomerVO customerCode, QuestionVO questionCode , Model model){
		logger.info("singletestresult===========:"+vo);
		vo.setCustomer(customerCode);
		vo.setQuestion(questionCode);
		service.insertResultTest(vo);
		return "redirect:/question/singletest";
	}	
	
	//ajax용 과목별 insert
	@ResponseBody
	@RequestMapping(value="subjecttest/{customer}/{question}", method=RequestMethod.POST)
	public ResponseEntity<String> subjecttestresult(@RequestBody ResultTestVO vo, @PathVariable("customer") String customer,@PathVariable("question") String question){
		logger.info("subjecttestresult 전 ------------"+vo);
		ResponseEntity<String> entity = null;
		
		CustomerVO cvo = new CustomerVO();
		cvo.setCustomerCode(customer);
		
		QuestionVO qvo = new QuestionVO();
		qvo.setQuestionCode(question);
		
		vo.setCustomer(cvo);
		vo.setQuestion(qvo);
		logger.info("subjecttestresult 후 ------------"+vo);
		try {
			service.insertResultTest(vo);
			int code = service.selectMaxCode();
			entity = new ResponseEntity<String>(code+"", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400에러
		}
		return entity;
	}
	
	//ajax용 과목별 update
	@ResponseBody
	@RequestMapping(value="subjecttest/{customer}/{question}", method=RequestMethod.PUT)
	public ResponseEntity<String> subjecttestupdate(@RequestBody ResultTestVO vo, @PathVariable("customer") String customer,@PathVariable("question") String question){
		logger.info("subjecttestupdate 전 ------------"+vo);
		ResponseEntity<String> entity = null;
		
		CustomerVO cvo = new CustomerVO();
		cvo.setCustomerCode(customer);
		
		QuestionVO qvo = new QuestionVO();
		qvo.setQuestionCode(question);
		
		vo.setCustomer(cvo);
		vo.setQuestion(qvo);
		
		logger.info("subjecttestupdate 후 ------------"+vo);
		try {
			service.updateByCustomerAndQuestion(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400에러
		}
		return entity;
	}

}




















