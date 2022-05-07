package com.toy.spring.model.service;

import java.sql.SQLException;

import com.toy.spring.model.UserDto;

public interface UserService {
	String idCheck(String userid) throws SQLException;
	void signUp(UserDto user) throws SQLException;
	UserDto login(UserDto user) throws SQLException;
	void userupdate(UserDto user) throws SQLException;
}
