package com.yi.controller;

import java.util.List;

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

import com.yi.domain.ReqUpdateVO;
import com.yi.service.ReqUpdateService;

@Controller
@RequestMapping("/reqUpdate/*")
public class ReqUpdateController {

	private static final Logger logger = LoggerFactory.getLogger(ReqUpdateController.class);
	
	@Autowired
	private ReqUpdateService service;
	
	//전체 리스트보기(단독메뉴용)
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void list(Model model) {
		logger.info("list================== controller");
		List<ReqUpdateVO> list = service.selectByAll();
		model.addAttribute("list", list);
		logger.info("list================== controller list :"+list);
	}
	
	//랜덤문제메뉴 아래에 보이는 리스트
	@ResponseBody
	@RequestMapping(value="/{question}", method=RequestMethod.GET)
	public ResponseEntity<List<ReqUpdateVO>> listByQuestion(@PathVariable("question") String question){
		logger.info("list==================수정요청 controller");
		ResponseEntity<List<ReqUpdateVO>> entity = null;
		
		try {
			List<ReqUpdateVO> list = service.selectByQuestionCode(question);
			logger.info("list==================수정요청 controller :::"+list);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//List<ReqUpdateVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}
		return entity;
	}
	
	//랜덤문제 아래에 추가하는 메소드
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReqUpdateVO vo){
		logger.info("list==================수정요청등록 controller"+vo);
		ResponseEntity<String> entity = null;
		
		try {
			service.insert(vo);
			logger.info("list==================수정요청등록 controller :::");
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//List<ReqUpdateVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}
		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

