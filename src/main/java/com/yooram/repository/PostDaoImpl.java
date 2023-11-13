package com.yooram.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yooram.domain.PostDto;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.yooram.mybatis.postMapper";
	
	@Override
	public List<PostDto> getList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list");
	}

	@Override
	public PostDto getDetail(PostDto postDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".detail", postDto);
	}

	@Override
	public void update(PostDto postDto) throws Exception {
		sqlSession.update(NAMESPACE + ".update", postDto);
		
	}

}
