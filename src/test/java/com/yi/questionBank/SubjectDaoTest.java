package com.yi.questionBank;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.QuestionVO;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;
import com.yi.service.QuestionService;
import com.yi.service.SubjectService;
import com.yi.service.TestService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class SubjectDaoTest {
	
	@Autowired
	private SubjectService subjectService;
	
	@Test
	public void test01insert() {
		SubjectVO vo = new SubjectVO();
		vo.setSubjectCode("Z");
		vo.setSubjectName("통신");
		
		subjectService.insertSubject(vo);
	}
	
	@Test
	public void test02selectByAll() {
		List<SubjectVO> list = subjectService.selectByAll();
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test03selectByNo() {
		SubjectVO vo = new SubjectVO();
		vo.setSubjectCode("A");
		vo = subjectService.selectByNo(vo);
		System.out.println(vo);
	}
	
	@Test
	public void test04update() {
		SubjectVO vo = new SubjectVO();
		vo.setSubjectCode("Z");
		vo.setSubjectName("수정완료");

		subjectService.updateSubject(vo);
	}
	
	@Test
	public void test05delete() {
		SubjectVO vo = new SubjectVO();
		vo.setSubjectCode("Z");
		subjectService.deleteSubject(vo);
	}
}
























