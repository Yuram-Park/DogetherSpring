package com.yooram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yooram.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
//	@Autowired
//	private PostService postSvc;
	
	@GetMapping("/list")
	public String list() {
		return "/post/post_list";
	}
}
