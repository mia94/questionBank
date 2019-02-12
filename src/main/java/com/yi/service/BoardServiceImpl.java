package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.BoardVO;
import com.yi.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardVO> selectByAll() {
		// TODO Auto-generated method stub
		return dao.selectByAll(); 
	}

	@Override
	public BoardVO selectByNo(BoardVO boardVo) {
		// TODO Auto-generated method stub
		return dao.selectByNo(boardVo);
	}

	@Override
	public void insertBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		dao.insertBoard(boardVo);
	}

	@Override
	public void updateBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		dao.updateBoard(boardVo);
	}

	@Override
	public void deleteBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		dao.deleteBoard(boardVo);
	}

}
