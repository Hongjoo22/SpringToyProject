package com.toy.spring.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toy.spring.model.BoardDto;
import com.toy.spring.model.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "/boardlist")
	public String boardlist(Model model) {
		logger.debug("BoardController boardlist");
		//model.addAttribute("boardlist", boardService.boardlist());
		return "board/boardlist";
	}
	
	@GetMapping(value = "/showboardlist")
	@ResponseBody
	public List<BoardDto> showboardlist(Model model) {
		logger.debug("BoardController showboardlist");
		return boardService.boardlist();
	}
	
	@GetMapping(value = "/boarddetail")
	public String boarddetail(int articleno, Model model) throws SQLException {
		logger.debug("BoardController boarddetail");
		model.addAttribute("board", boardService.boardDetail(articleno));
		return "/board/boarddetail";
	}
	
	@PostMapping(value = "/boardmodify")
	public String boardmodify(BoardDto board, Model model) throws SQLException {
		logger.debug("BoardController boardmodify");
		boardService.boardUpdate(board);
		return "redirect:/board/boarddetail";
	}
//	@GetMapping(value = "/boarddetail/{articleno}")
//	@ResponseBody
//	public String boarddetail(@PathVariable("articleno") int articleno, Model model) throws SQLException {
//		logger.debug("BoardController boarddetail");
//		model.addAttribute("board", boardService.boardDetail(articleno));
//		return "/board/boarddetail";
//	}
	
	@GetMapping(value = "/mvboardwrite")
	public String mvboardwrite(Model model) {
		logger.debug("BoardController mvboardwrite");
		return "board/boardwrite";
	}
	
	@PostMapping(value = "/boardwrite")
	public String boardwrite(BoardDto board, Model model) throws SQLException {
		logger.debug("BoardController boardwrite");
		boardService.boardWrite(board);
		return "redirect:/board/boardlist";
	}
	
}
