package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.SubjectVO;
import com.yi.persistence.SubjectDao;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDao subjectDao;
	
	@Override
	public List<SubjectVO> selectByAll() {
		return subjectDao.selectByAll();
	}

	@Override
	public SubjectVO selectByNo(SubjectVO subjectVo) {
		// TODO Auto-generated method stub
		return subjectDao.selectByNo(subjectVo);
	}

	@Override
	public void insertSubject(SubjectVO subjectVo) {
		// TODO Auto-generated method stub
		subjectDao.insertSubject(subjectVo);
	}

	@Override
	public void updateSubject(SubjectVO subjectVo) {
		// TODO Auto-generated method stub
		subjectDao.updateSubject(subjectVo);
	}

	@Override
	public void deleteSubject(SubjectVO subjectVo) {
		// TODO Auto-generated method stub
		subjectDao.deleteSubject(subjectVo);
	}

}
