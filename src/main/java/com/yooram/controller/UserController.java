package com.yooram.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yooram.domain.UserDto;
import com.yooram.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userSvc;
	
	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@PostMapping("/login")
	public String loginCheck(UserDto userDto, HttpServletRequest request) throws Exception {
		String user_pw = userSvc.loginCheck(userDto);
		if(user_pw.equals("noId") || user_pw.equals("wrongPW")) {
			return "/user/login";
		} else {
			request.getSession().invalidate();
			HttpSession session = request.getSession(true);
			session.setAttribute("user_id", userDto.getUser_id());
			session.setMaxInactiveInterval(1800);
			return "index";
		} 	
	}
	
	@GetMapping("/signUp")
	public String signUp() {
		return "/user/signUp";
	}

	// birthday가 안받아짐!!!
	@PostMapping("/signUp")
	public String signUpProc(String user_id, String user_pw, String user_email, String user_name, String user_nickname, String user_gender, int user_grade, Date user_birthday) throws Exception {
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(user_email);
		System.out.println(user_name);
		System.out.println(user_nickname);
		System.out.println(user_gender);
		System.out.println(user_grade);
		System.out.println(user_birthday);
		//UserDto userDto = new UserDto(user_id, user_pw, user_email, user_name, user_nickname,
		//	user_gender, user_grade, user_birthday);
		//userSvc.signUpProc(userDto);
		return "/user/login";
	}
}
