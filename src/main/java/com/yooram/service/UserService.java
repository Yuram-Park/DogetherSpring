package com.yooram.service;

import com.yooram.domain.UserDto;

public interface UserService {
	public String loginCheck(UserDto userDto) throws Exception;
	public String getNickname(String user_id) throws Exception;
	public void signUpProc(UserDto userDto) throws Exception;
	public boolean idCheck(String user_id) throws Exception;
	public String emailCheck(String user_email) throws Exception;
}
