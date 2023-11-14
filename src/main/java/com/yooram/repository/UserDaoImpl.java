package com.yooram.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yooram.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.yooram.mybatis.userMapper";
	
	@Override
	public String loginCheck(UserDto userDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".loginCheck", userDto);
	}

	@Override
	public String getNickname(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNickname", user_id);
	}

	@Override
	public void signUpProc(UserDto userDto) throws Exception {
		sqlSession.insert(NAMESPACE + ".signUp", userDto);
	}

}
