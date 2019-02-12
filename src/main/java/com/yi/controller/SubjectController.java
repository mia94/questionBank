package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.SubjectVO;
import com.yi.service.SubjectService;

@Controller
@RequestMapping("/subject/*")
public class SubjectController {
	
private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);
	
	@Autowired
	private SubjectService service;
	
	//실패
	@RequestMapping(value="", method=RequestMethod.POST)//
	public ResponseEntity<String> register(@RequestBody SubjectVO vo){
		ResponseEntity<String> entity = null;
		logger.info("SubjectVO create------------"+vo);
		
		try {
			service.insertSubject(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400에러
		}
		
		return entity; 
	}

}
