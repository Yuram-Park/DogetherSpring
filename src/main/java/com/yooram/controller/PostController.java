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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yooram.domain.FileDto;
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
	public String postProc(@ModelAttribute PostDto postDto, MultipartFile[] postFiles, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String user_nickname = userSvc.getNickname(user_id);
		postDto.setUser_id(user_id);
		postDto.setUser_nickname(user_nickname);
		
		postSvc.post(postDto, postFiles);
		return "redirect:/post/list?board_id="+postDto.getBoard_id();
	}
	
	@GetMapping("/detail")
	public String detail(@ModelAttribute PostDto postDto, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String user_nickname = userSvc.getNickname(user_id);
		PostDto user = new PostDto();
		user.setUser_nickname(user_nickname);
		
		PostDto detail = postSvc.getDetail(postDto);		
		List<FileDto> fileList = postSvc.getFile(postDto.getPost_id());
		model.addAttribute("detail", detail);
		model.addAttribute("fileList", fileList);
		model.addAttribute("user", user);
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
	
	@GetMapping("/delete")
	public String delete(@ModelAttribute PostDto postDto) throws Exception {
		postSvc.delete(postDto);
		return "redirect:/post/list?board_id="+postDto.getBoard_id();
	}
}
