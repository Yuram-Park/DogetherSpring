package com.yooram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooram.domain.Place;
import com.yooram.repository.PlaceDao;

@Service
public class PlaceServiceImpl implements PlaceService {

    private PlaceDao placeDao;
    
    @Autowired
    public PlaceServiceImpl(PlaceDao placeDao) {
        this.placeDao = placeDao;
    }

    @Override
    public List<Place> list() {
        List<Place> places = placeDao.list();
        return places;
    }

}
