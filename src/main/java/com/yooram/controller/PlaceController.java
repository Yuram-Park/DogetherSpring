package com.yooram.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yooram.domain.Place;
import com.yooram.service.PlaceService;

@Controller
@RequestMapping("/place")
public class PlaceController {
    
    private final PlaceService placeService;
    
    @Autowired
    public PlaceController(PlaceService placeService) {
        this.placeService = placeService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Place> places = placeService.list();
        model.addAttribute("places", places);
        return "/place/place_list";
    }
}
