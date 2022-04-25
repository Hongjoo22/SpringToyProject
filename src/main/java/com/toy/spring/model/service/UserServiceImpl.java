package com.toy.spring.model.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.toy.spring.model.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Override
	public int idCheck(String userid) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void register(UserDto user) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public UserDto login(UserDto user) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void userupdate(UserDto user) throws SQLException {
		// TODO Auto-generated method stub

	}

}
