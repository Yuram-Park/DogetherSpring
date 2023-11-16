package com.yooram.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yooram.domain.PostDto;
import com.yooram.service.PostService;
import com.yooram.service.UserService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService postSvc;
	
	@Autowired
	private UserService userSvc;
	
	@GetMapping("/list")
	public String list(String board_id, Model model) throws Exception {
		List<PostDto> list = postSvc.getList(board_id);
		model.addAttribute("list", list);
		model.addAttribute("board_id", board_id);
		return "/post/post_list";
	}
	
	@GetMapping("/post")
	public String post(String board_id, Model model) {
		model.addAttribute("board_id", board_id);
		return "/post/post_post";
	}
	
	@PostMapping("/post")
	public String postProc(@ModelAttribute PostDto postDto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String user_nickname = userSvc.getNickname(user_id);
		postDto.setUser_id(user_id);
		postDto.setUser_nickname(user_nickname);
		
		postSvc.post(postDto);
		return "redirect:/post/list";
	}
	
	@GetMapping("/detail")
	public String detail(@ModelAttribute PostDto postDto, Model model) throws Exception {
		PostDto detail = postSvc.getDetail(postDto);
		model.addAttribute("detail", detail);
		return "/post/post_detail";
	}
	
	@GetMapping("/update")
	public String update(@ModelAttribute PostDto postDto, Model model) throws Exception {
		PostDto detail = postSvc.getDetail(postDto);
		model.addAttribute("detail", detail);
		return "/post/post_update";
	}
	
	@PostMapping("/update")
	public String updateProc(@ModelAttribute PostDto postDto) throws Exception {
		postSvc.update(postDto);
		return "redirect:/list";
	}
}
