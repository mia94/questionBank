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

import com.yi.domain.BoardVO;
import com.yi.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void list(){
		logger.info("BoardVO list------------");
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BoardVO vo){
		ResponseEntity<String> entity = null;
		logger.info("BoardVO create------------"+vo);
		
		try {
			service.insertBoard(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400¿¡·¯
		}
		
		return entity; 
	}

}
