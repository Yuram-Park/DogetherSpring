package com.yooram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooram.domain.UserDto;
import com.yooram.repository.UserDao;
import com.yooram.util.EmailUtils;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private EmailUtils emailUtils;
	
	@Override
	public String loginCheck(UserDto userDto) throws Exception {
		String user_pw = userDao.loginCheck(userDto);
		if(user_pw == null || user_pw =="") {
			System.out.println("일치하는 아이디가 없습니다.");
			return "noId";
		} else {
			if(user_pw.equals(userDto.getUser_pw())) {
				return user_pw;
			} else {
				System.out.println("비밀번호가 틀립니다.");
				return "wrongPW";
			}
		}
	}

	@Override
	public String getNickname(String user_id) throws Exception {
		String user_nickname = userDao.getNickname(user_id);
		return user_nickname;
	}

	@Override
	public void signUpProc(UserDto userDto) throws Exception {
		userDao.signUpProc(userDto);
	}

	@Override
	public boolean idCheck(String user_id) throws Exception {
		return userDao.idCheck(user_id);
	}

	@Override
	public String emailCheck(String user_email) throws Exception {
		return emailUtils.joinEmail(user_email);
	}

}
