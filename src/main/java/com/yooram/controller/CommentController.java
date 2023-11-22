package com.yooram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@PostMapping("/post")
	public String post() {
		return "redirect:/post/detail?board_id=";
	}
}
