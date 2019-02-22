package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yi.mapper.BoardMapper";

	@Override
	public List<BoardVO> selectByAll() {
		return sqlSession.selectList(namespace+".selectByAll");
	}

	@Override
	public BoardVO selectByNo(BoardVO boardVo) {
		return sqlSession.selectOne(namespace+".selectByNo", boardVo);
	}

	@Override
	public void insertBoard(BoardVO boardVo) {
		sqlSession.insert(namespace+".insertBoard",boardVo);
	}

	@Override
	public void updateBoard(BoardVO boardVo) {
		sqlSession.update(namespace+".updateBoard", boardVo);
	}

	@Override
	public void deleteBoard(BoardVO boardVo) {
		sqlSession.delete(namespace+".deleteBoard", boardVo);
	}

	@Override
	public void viewCount(int bno) {
		sqlSession.update(namespace+".viewCount", bno);
		
	}

}
