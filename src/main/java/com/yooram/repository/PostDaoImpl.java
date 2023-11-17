package com.yooram.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yooram.domain.FileDto;
import com.yooram.domain.PostDto;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.yooram.mybatis.postMapper";
	
	@Override
	public List<PostDto> getList(String board_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", board_id);
	}

	@Override
	public PostDto getDetail(PostDto postDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".detail", postDto);
	}

	@Override
	public void update(PostDto postDto) throws Exception {
		sqlSession.update(NAMESPACE + ".update", postDto);
		
	}

	@Override
	public void post(PostDto postDto) throws Exception {
		sqlSession.insert(NAMESPACE + ".post", postDto);
	}

	@Override
	public void insertFile(FileDto fileDto) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertFile", fileDto);
		
	}
	
	

}
