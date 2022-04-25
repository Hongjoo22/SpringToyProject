package com.toy.spring.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.toy.spring.model.BoardDto;

public interface BoardMapper {
	List<BoardDto> boardlist();
	void boardWrite(BoardDto board) throws SQLException;
	void boardUpdate(BoardDto board) throws SQLException;
	void boardDelete(int articleno) throws SQLException;
	BoardDto boardDetail(int articleno) throws SQLException;
}
