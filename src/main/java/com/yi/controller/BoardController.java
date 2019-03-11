package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void list(Model model){
		logger.info("BoardVO list------------");
		List<BoardVO> list = service.selectByAll();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public void register() {
		logger.info("BoardVO register------------GET");
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(@RequestBody BoardVO vo){
		logger.info("BoardVO create------------"+vo);
		
		service.insertBoard(vo);
		
		return "redirect:/board/list";
	}

}
