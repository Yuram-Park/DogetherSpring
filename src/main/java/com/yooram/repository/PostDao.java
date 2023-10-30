package com.yooram.repository;

import com.yooram.domain.PostDto;

public interface PostDao {
	public PostDto getList() throws Exception;
}
