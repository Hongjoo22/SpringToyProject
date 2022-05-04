package com.toy.spring.model.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.spring.model.UserDto;
import com.toy.spring.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int idCheck(String userid) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void signUp(UserDto user) throws SQLException {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		userMapper.signUp(user);
	}

	@Override
	public UserDto login(UserDto user) throws SQLException {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.login(user);
	}

	@Override
	public void userupdate(UserDto user) throws SQLException {
		// TODO Auto-generated method stub

	}

}
