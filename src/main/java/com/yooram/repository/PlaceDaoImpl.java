package com.yooram.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yooram.domain.Place;

@Repository
public class PlaceDaoImpl implements PlaceDao {

    private SqlSession sqlSession;
    private static final String NAMESPACE = "com.yooram.mybatis.placeMapper";
    
    @Autowired
    public PlaceDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Place> list() {
        return sqlSession.selectList(NAMESPACE + ".list");
    }

}
