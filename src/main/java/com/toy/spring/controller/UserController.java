package com.toy.spring.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.toy.spring.model.BoardDto;
import com.toy.spring.model.UserDto;
import com.toy.spring.model.service.BoardService;
import com.toy.spring.model.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	@GetMapping(value = "/login")
	public String login(UserDto user, Model model, HttpSession session) throws SQLException {
		logger.debug("UserController login");
		UserDto login = userService.login(user);
		if(login!=null) {
			session.setAttribute("login", login);
			return "index";
		}else {
			session.invalidate();
			return "index";
		}
	}
	@GetMapping(value = "/logout")
	public String logout(UserDto user, Model model, HttpSession session) throws SQLException {
		logger.debug("UserController logout");
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping(value = "/mvsignUp")
	public String mvsignUp( Model model) throws SQLException {
		logger.debug("UserController mvsignUp");
		return "user/signUp";
	}
	
	@PostMapping(value = "/signUp")
	public String signUp(UserDto user, Model model) throws SQLException {
		logger.debug("UserController signUp");
		userService.signUp(user);
		return "redirect:../";
	}
	@GetMapping(value = "/idcheck")
	@ResponseBody
	public String idcheck(String userid) throws SQLException {
		logger.debug("UserController idcheck");
		return userService.idCheck(userid)+"";
	}
	
}
