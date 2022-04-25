package com.toy.spring.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toy.spring.model.BoardDto;
import com.toy.spring.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	SqlSession sqlSession;	
	
	@Override
	@Transactional(readOnly = true)
	public List<BoardDto> boardlist() {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		return boardMapper.boardlist();
	}

	@Override
	@Transactional
	public void boardWrite(BoardDto board) throws SQLException {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardWrite(board);
	}

	@Override
	@Transactional
	public void boardUpdate(BoardDto board) throws SQLException {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardUpdate(board);
	}

	@Override
	@Transactional
	public void boardDelete(int articleno) throws SQLException {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardDelete(articleno);
	}

	@Override
	@Transactional(readOnly = true)
	public BoardDto boardDetail(int articleno) throws SQLException {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		return boardMapper.boardDetail(articleno);
	}

}
