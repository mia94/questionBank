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

import com.yi.domain.CustomerVO;
import com.yi.service.CustomerService;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public void signupGet(){
		logger.info("signupGet ------------");
	}
	
	//가입
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String register(CustomerVO vo){
		logger.info("CustomerVO create------------"+vo);
		//고객코드 마지막 + 1하여 자동부여
		String maxCode = service.selectMaxCustomerCode();
		String newCode = String.format("C%03d",Integer.parseInt(maxCode.substring(1))+1);
		System.out.println("====새코드====="+newCode);
		vo.setCustomerCode(newCode);
		//관리자 자동 false설정
		vo.setEmployee(false);
		service.insertCustomer(vo);
		return "redirect:/user/login";
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value="checkId", method=RequestMethod.GET)
	public String checkId() {
		return "";
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void list(Model model){
		List<CustomerVO> list = service.selectByAll();
		model.addAttribute("list", list);
	}
	
	@ResponseBody
	@RequestMapping(value="listJson", method=RequestMethod.GET)
	public ResponseEntity<List<CustomerVO>> listJson(){
		ResponseEntity<List<CustomerVO>> entity = null;
		
		try {
			List<CustomerVO> list = service.selectByAll();
			logger.info("listJson------------"+list);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//List<MemberVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}
		return entity;
	}

	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public void updateGet(String customerCode, Model model){
		logger.info("update GET------------");
		CustomerVO vo = new CustomerVO();
		vo.setCustomerCode(customerCode);
		vo = service.selectByNo(vo);
		logger.info("update GET------------"+vo);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String updatePost(CustomerVO vo){
		logger.info("update Post------------"+vo);
		service.updateCustomer(vo);
		
		return "redirect:/customer/list";
	}
	
	@ResponseBody
	@RequestMapping(value="{customerCode}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("customerCode") String customerCode){
		ResponseEntity<String> entity = null;
		
		try {
			CustomerVO vo = new CustomerVO();
			vo.setCustomerCode(customerCode);
			service.deleteCustomer(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
























