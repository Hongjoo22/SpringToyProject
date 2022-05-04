package com.toy.spring.model.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.toy.spring.model.UserDto;

@Mapper
public interface UserMapper {
	int idCheck(String userid) throws SQLException;
	void signUp(UserDto user) throws SQLException;
	UserDto login(UserDto user) throws SQLException;
	void userupdate(UserDto user) throws SQLException;
}
