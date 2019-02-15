package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.ResultTestVO;
import com.yi.service.ResultTestService;

@Controller
@RequestMapping("/resultTest/*")
public class ResultTestController {
	private static final Logger logger = LoggerFactory.getLogger(ResultTestController.class);
	
	@Autowired
	private ResultTestService service;
	
	@RequestMapping(value="result", method=RequestMethod.POST)
	public String registerResultTest(ResultTestVO vo) {
		logger.info("registerResultTest create------------POST");
		ResponseEntity<String> entity = null;
		
		try {
			service.insertResultTest(vo);
			System.out.println(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400¿¡·¯
		}
		
		return "redirect:/resultTest/list"; 
	}

}
