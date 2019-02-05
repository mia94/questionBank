package com.yi.service;

import java.util.List;

import com.yi.domain.SubjectVO;

public interface SubjectService {
	
	public List<SubjectVO> selectByAll();
	public SubjectVO selectByNo(SubjectVO subjectVo);
	public void insertSubject(SubjectVO subjectVo);
	public void updateSubject(SubjectVO subjectVo);
	public void deleteSubject(SubjectVO subjectVo);
}
