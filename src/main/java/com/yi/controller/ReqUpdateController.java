package com.yi.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.CustomerVO;
import com.yi.domain.QuestionVO;
import com.yi.domain.ReqUpdateVO;
import com.yi.service.CustomerService;
import com.yi.service.QuestionService;
import com.yi.service.ReqUpdateService;
import com.yi.util.MediaUtils;

@Controller
@RequestMapping("/reqUpdate/*")
public class ReqUpdateController {

	private static final Logger logger = LoggerFactory.getLogger(ReqUpdateController.class);
	
	@Autowired
	private ReqUpdateService service;
	@Autowired
	private QuestionService qService;
	@Autowired
	private CustomerService cService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
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
		CustomerVO cvo = cService.selectByNo(vo.getWriter());
		vo.setWriter(cvo);
		System.out.println(vo);
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
	
	//문의글 클릭시 해당문제 확인, 수정가능한 페이지로 이동하기
	@RequestMapping(value="check", method=RequestMethod.GET)
	public void check(String question, Model model) {
		logger.info("check================== controller"+question);
		QuestionVO vo = new QuestionVO();
		vo.setQuestionCode(question);
		vo = qService.selectByNO(vo);

		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String filename, Model model){
		 ResponseEntity<byte[]> entity = null;
		 logger.info("displayFile : "+ filename);
		 try {
			 try {
				 String format = filename.substring(filename.lastIndexOf(".")+1);
					String picture = filename.substring(filename.lastIndexOf("/"));
					MediaType mType = MediaUtils.getMediaType(format);
					
					HttpHeaders headers = new HttpHeaders();
					InputStream in = null;
					in = new FileInputStream(uploadPath+"/"+picture);
					headers.setContentType(mType);
					
					entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
					in.close();
			} catch (StringIndexOutOfBoundsException e) {
				return null;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		 return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

