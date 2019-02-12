package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.TestVO;
import com.yi.service.TestService;


@Controller
@RequestMapping("/test/*")
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private TestService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody TestVO vo){
		ResponseEntity<String> entity = null;
		logger.info("testVO create------------"+vo);
		
		try {
			service.insertTest(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400에러
		}
		
		return entity;
	}
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ResponseEntity<List<TestVO>>  list(){
		ResponseEntity<List<TestVO>> entity = null;
		
		try {
			List<TestVO> list = service.selectByAll();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//List<TestVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}
		
		return entity;
	}
	
	@RequestMapping(value="{testCode}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("testCode") String testCode,@RequestBody TestVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setTestCode(testCode);
			service.updateTest(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="{testCode}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("testCode") String testCode){
		ResponseEntity<String> entity = null;
		
		try {
			TestVO vo = new TestVO();
			vo.setTestCode(testCode);
			service.deleteTest(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}




















