package com.yi.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.service.ResultTestService;

@Controller
@RequestMapping("/question/*")
public class ResultTestController {
	private static final Logger logger = LoggerFactory.getLogger(ResultTestController.class);
	
	@Autowired
	private ResultTestService service;
	
	@RequestMapping(value="result", method=RequestMethod.POST)
	public String addAnswer(String answer, String correct) {
		logger.info("registerResultTest create------------POST");
		logger.info("registerResultTest create------------answer" + answer);
		logger.info("registerResultTest create------------correct" + correct);
		/*List<Integer> answerList = new ArrayList<>();
		int answerInt = Integer.parseInt(answer);
		answerList.add(answerInt);*/
		
		return "redirect:/resultTest/list"; 
	}

}
