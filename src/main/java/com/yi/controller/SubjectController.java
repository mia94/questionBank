package com.yi.controller;

import java.util.Map;

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
	
	@RequestMapping(value="", method=RequestMethod.POST)//
	public ResponseEntity<String> register(@RequestBody Map<String, String> map){
		ResponseEntity<String> entity = null;
		logger.info("subjectCode create------------"+map.get("subjectCode"));
		logger.info("v create------------"+map.get("subjectName"));
		logger.info("testCode create------------"+map.get("testCode"));
		logger.info("questionCode create------------"+map.get("questionCode"));
		
		try {
			SubjectVO vo = new SubjectVO();
			vo.setSubjectCode(map.get("subjectCode"));
			vo.setSubjectName(map.get("subjectName"));
			
			service.insertSubject(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400¿¡·¯
		}
		
		return entity; 
	}


}
