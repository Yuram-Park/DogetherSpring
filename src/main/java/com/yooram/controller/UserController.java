package com.yooram.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	@PostMapping("/signUp")
	public String signUpProc(@ModelAttribute UserDto userDto) throws Exception {
		userSvc.signUpProc(userDto);
		return "/user/login";
	}
	
	@GetMapping("/idCheck")
	public void idCheck(String user_id, HttpServletResponse response) throws Exception {		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(user_id.trim().isEmpty()) {
			out.println("0");
		} else {
			if(userSvc.idCheck(user_id)) {
				out.println("0");
			} else {
				out.println("1");
			}
		}
		out.close();
	}
	
	@GetMapping("/emailCheck")
	public void emailCheck(String user_email, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(user_email);
		String mailCode = userSvc.emailCheck(user_email);
		out.println(mailCode);
	}
}
