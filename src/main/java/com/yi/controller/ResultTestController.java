package com.yi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.CustomerVO;
import com.yi.domain.QuestionVO;
import com.yi.domain.ResultTestVO;
import com.yi.service.CustomerService;
import com.yi.service.QuestionService;
import com.yi.service.ResultTestService;

@Controller
@RequestMapping("/question/*")
public class ResultTestController {
	private static final Logger logger = LoggerFactory.getLogger(ResultTestController.class);
	
	@Autowired
	private ResultTestService service;
	@Autowired
	private QuestionService qService;
	@Autowired
	private CustomerService cService;
	
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
	
	//오답다시풀기 문제 리스트
	@RequestMapping(value="/incorrect", method=RequestMethod.GET)
	public void selectIncorrect(String customerCode, Model model){
		logger.info("selectIncorrect ------------"+customerCode);
		List<ResultTestVO> resultList = service.selectIncorrectQuestionByCustomer(customerCode);
		System.out.println(resultList);
		List<QuestionVO> list = new ArrayList<>();
		
		for(int i=0;i<resultList.size();i++) {
			QuestionVO qvo = qService.selectByNO(resultList.get(i).getQuestion());
			list.add(qvo);
		}
		
		System.out.println(list);
		model.addAttribute("list", list);
	}
	
	//모의고사
	@ResponseBody
	@RequestMapping(value="resultMokeTest", method=RequestMethod.POST)
	public void insertResultMokeTest(@RequestParam(value="aArray[]") List<String> aArray, @RequestParam(value="qArray[]")List<String> qArray,@RequestParam(value="customerCode") String customerCode) {
		logger.info("insertResultMokeTest ------------aArray: "+aArray.size());
		logger.info("insertResultMokeTest ------------qArray: "+qArray.size());
		logger.info("insertResultMokeTest ------------customerCode "+customerCode);
		
		//고객찾기
		CustomerVO cvo = new CustomerVO();
		cvo.setCustomerCode(customerCode);
		CustomerVO newCvo = cService.selectByNo(cvo);
		//문제찾기
		QuestionVO qvo = new QuestionVO();
		
		List<ResultTestVO> list = new ArrayList<>();//batch에 사용할 배열
		for(int i=0;i<100;i++) {
			ResultTestVO vo = new ResultTestVO();
			//해당문제정보찾기
			qvo.setQuestionCode(qArray.get(i));
			QuestionVO newQvo = qService.selectByNO(qvo);
			
			//값 입력
			vo.setCustomer(newCvo);
			vo.setQuestion(newQvo);
			vo.setAnswer(Integer.parseInt(aArray.get(i)));
			vo.setSpendTime(0);//아직해결X
			
			vo.setCorrect(newQvo.getCorrect());
			boolean pass = false;
			if(vo.getAnswer()==vo.getCorrect()) {
				pass=true;
			}
			vo.setPass(pass);
			logger.info("insertResultMokeTest ------------vo "+vo);
			list.add(vo);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		logger.info("insertResultMokeTest ------------list "+list);
		service.insertBatchResultTest(map);
	}
}




















