package com.yi.service;

import java.util.List;

import com.yi.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> selectByAll();
	public BoardVO selectByNo(BoardVO boardVo);
	public void insertBoard(BoardVO boardVo);
	public void updateBoard(BoardVO boardVo);
	public void deleteBoard(BoardVO boardVo);
}
