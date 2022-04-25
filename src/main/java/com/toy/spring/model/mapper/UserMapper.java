package com.toy.spring.model.mapper;

import java.sql.SQLException;

import com.toy.spring.model.UserDto;

public interface UserMapper {
	int idCheck(String userid) throws SQLException;
	void register(UserDto user) throws SQLException;
	UserDto login(UserDto user) throws SQLException;
	void userupdate(UserDto user) throws SQLException;
}
