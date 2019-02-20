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
import org.springframework.web.multipart.MultipartFile;

import com.yi.domain.Criteria;
import com.yi.domain.PageMaker;
import com.yi.domain.QuestionVO;
import com.yi.service.QuestionService;
import com.yi.util.MediaUtils;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	
private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService service;
	//기본형은 주입받으려면 servlet-context에 등록된 이름으로 주입
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public void registerGet(){
		logger.info("QuestionVO create------------GET");
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPost(QuestionVO vo, String number,MultipartFile pictureFile){
		logger.info("QuestionVO create------------POST");
		
		//사진파일 경로 저장
		String picture = pictureFile.getOriginalFilename();
		if(picture.equals("")==false) {
			System.out.println("=============pictureFile.getOriginalFilename()"+picture);
			vo.setPicture(uploadPath+"/"+picture);
			logger.info("QuestionVO create------------"+vo);
		}
		//연도/회차/번호를 이용하여 Code입력하기		
		String threeNum = String.format("%03d",Integer.parseInt(number));
		System.out.println("Q"+vo.getSubject()+vo.getYear()+vo.getRound()+threeNum);
		vo.setQuestionCode("Q"+vo.getSubject()+vo.getYear()+vo.getRound()+threeNum);
		//insert수행
		service.insert(vo);
		System.out.println(vo);
		
		return "redirect:/question/register";
		
	}
	//jsp로 가는 메소드
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void list(Criteria cri,Model model){
		System.out.println("cri===========:"+cri);
		List<QuestionVO> list = service.selectByYearAndRound(2018, 3, cri);///////연도와 회차 외부에서 받기!!!!
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount(2018,3));
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}
	
	//랜덤으로 한문제씩
	@RequestMapping(value="singletest", method=RequestMethod.GET)
	public void singleTest(Criteria cri,Model model){
			System.out.println("cri===========:"+cri);
			cri.setPerPageNum(1);
			List<QuestionVO> list = service.selectByRandom();
			model.addAttribute("list", list);
			model.addAttribute("cri", cri);
	}
	
	//과목별 문제
	@RequestMapping(value="subjecttest", method=RequestMethod.GET)
	public void subjecttest(Criteria cri,Model model){
		logger.info("subjecttest get------------");
		List<QuestionVO> list = service.selectBySubject("D");//외부에서 값 받기!
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount(2018,3));
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}
		
	//json을 보내는 메소드 - list.jsp에서 사용
	@ResponseBody
	@RequestMapping(value="listJson/{year}/{round}", method=RequestMethod.GET)
	public ResponseEntity<List<QuestionVO>> listJson(Criteria cri,@PathVariable("year") int year, @PathVariable("round") int round){
		ResponseEntity<List<QuestionVO>> entity = null;
		
		try {
			List<QuestionVO> list = service.selectByYearAndRound(year, round, cri);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//List<QuestionVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}
		
		return entity;
	}
	
	//json으로 과목별 문제select 보내는 메소드 - subjecttest.jsp에서 사용
	@ResponseBody
	@RequestMapping(value="subjecttest/{subject}", method=RequestMethod.GET)
	public ResponseEntity<List<QuestionVO>> listBySubjectJson(@PathVariable("subject") String subject){
			ResponseEntity<List<QuestionVO>> entity = null;
			
			try {
				List<QuestionVO> list = service.selectBySubject(subject);
				entity = new ResponseEntity<>(list, HttpStatus.OK);
			} catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
	}
	
	@RequestMapping(value="{questionCode}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("questionCode") String questionCode,@RequestBody QuestionVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setQuestionCode(questionCode);
			service.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="{questionCode}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("questionCode") String questionCode){
		ResponseEntity<String> entity = null;
		
		try {
			QuestionVO vo = new QuestionVO();
			vo.setQuestionCode(questionCode);
			service.delete(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
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


















