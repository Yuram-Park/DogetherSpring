package com.yooram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooram.domain.PostDto;
import com.yooram.repository.PostDao;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;
	
	@Override
	public List<PostDto> getList(String board_id) throws Exception {
		List<PostDto> list = postDao.getList(board_id);
		return list;
	}

	@Override
	public PostDto getDetail(PostDto postDto) throws Exception {
		PostDto detail = postDao.getDetail(postDto);
		return detail;
	}

	@Override
	public void update(PostDto postDto) throws Exception {
		postDao.update(postDto);
	}

	@Override
	public void post(PostDto postDto) throws Exception {
		postDao.post(postDto);
	}

}
