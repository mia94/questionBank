package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.BoardVO;
import com.yi.domain.CustomerVO;
import com.yi.service.BoardService;
import com.yi.service.CustomerService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	@Autowired
	private CustomerService cService;
	
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
	public String register(BoardVO vo, CustomerVO writer){
		logger.info("BoardVO create POST------------"+vo);
		
		writer = cService.selectByNo(writer);
		logger.info("BoardVO create POST------------"+writer);
		vo.setWriter(writer);
		service.insertBoard(vo);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public void readBoard(int boardCode, Model model) {
		logger.info("readBoard GET------------"+boardCode);
		BoardVO vo = new BoardVO();
		vo.setBoardCode(boardCode);
		vo = service.selectByNo(vo);
		model.addAttribute("vo", vo);
	}

}















