package com.yooram.service;

import java.util.List;

import com.yooram.domain.PostDto;

public interface PostService {
	public List<PostDto> getList(String board_id) throws Exception;
	public PostDto getDetail(PostDto postDto) throws Exception;
	public void update(PostDto postDto) throws Exception;
	public void post(PostDto postDto) throws Exception;
}
