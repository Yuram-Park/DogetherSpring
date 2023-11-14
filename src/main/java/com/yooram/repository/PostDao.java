package com.yooram.repository;

import java.util.List;

import com.yooram.domain.PostDto;

public interface PostDao {
	public List<PostDto> getList(String board_id) throws Exception;
	public PostDto getDetail(PostDto postDto) throws Exception;
	public void update(PostDto postDto) throws Exception;
	public void post(PostDto postDto) throws Exception;
}
