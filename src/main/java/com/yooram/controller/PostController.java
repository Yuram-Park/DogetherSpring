package com.yooram.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yooram.domain.PostDto;
import com.yooram.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService postSvc;
	
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		List<PostDto> list = postSvc.getList();
		model.addAttribute("list", list);
		return "/post/post_list";
	}
	
	@GetMapping("/post")
	public String post() {
		return "/post/post_post";
	}
	
	@PostMapping("/post")
	public String postProc() {
		return "redirect:/list";
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
