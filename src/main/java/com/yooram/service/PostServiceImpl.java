package com.yooram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yooram.domain.FileDto;
import com.yooram.domain.PostDto;
import com.yooram.repository.PostDao;
import com.yooram.util.FileUtils;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;
	
	@Autowired
	private FileUtils fileUtils;
	
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
	public void post(PostDto postDto, MultipartFile[] postFiles) throws Exception {
		postDao.post(postDto);
		
		List<FileDto> list = fileUtils.insertFileInfo(postDto, postFiles);
		int size = list.size();
		for(int i=0; i<size; i++) {
			postDao.insertFile(list.get(i));
		}
	}

}
