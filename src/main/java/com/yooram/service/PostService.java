package com.yooram.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.yooram.domain.FileDto;
import com.yooram.domain.PostDto;

public interface PostService {
	public List<PostDto> getList(String board_id) throws Exception;
	public PostDto getDetail(PostDto postDto) throws Exception;
	public void update(PostDto postDto) throws Exception;
	public void delete(PostDto postDto) throws Exception;
	public void post(PostDto postDto, MultipartFile[] postFiles) throws Exception;
	public List<FileDto> getFile(int post_id) throws Exception;
}
