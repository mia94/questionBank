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
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet(){
		logger.info("loginGet ------------");
	}
	
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public void signupGet(){
		logger.info("signupGet ------------");
	}
	
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CustomerVO vo){
		ResponseEntity<String> entity = null;
		logger.info("CustomerVO create------------"+vo);
		//고객코드 마지막 + 1하여 자동부여
		//관리자 자동 false설정
		
		try {
			service.insertCustomer(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);//400에러
		}
		
		return entity; 
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
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//List<MemberVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}
		return entity;
	}

	
	@RequestMapping(value="{customerCode}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("customerCode") String customerCode,@RequestBody CustomerVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setCustomerCode(customerCode);
			service.updateCustomer(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
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
























