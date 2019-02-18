package com.yi.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.CustomerVO;
import com.yi.domain.LoginDTO;
import com.yi.service.CustomerService;


@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet() {
		logger.info("login GET -------------- ");
	}
	
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void loginPost(String userid, String userpw, Model model) {
		logger.info("loginPost  -------------- ");
		CustomerVO vo = service.read(userid, userpw);
		logger.info("loginPost  -------------- " +vo);
		if(vo == null) {//회원이 없으면 로그인 화면으로 돌아가게
			logger.info("loginPost return -------------- ");
			return;
		}
		LoginDTO dto = new LoginDTO();
		dto.setCustomerName(vo.getCustomerName());
		dto.setId(vo.getId());
		dto.setEmployee(vo.isEmployee());
		model.addAttribute("memberVO", dto);
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logOutGET(HttpSession session) {
		logger.info("logout GET ------------");
		session.invalidate();//세션날리면 로그아웃 완료
		return "redirect:/sboard/list";
	}
}






















