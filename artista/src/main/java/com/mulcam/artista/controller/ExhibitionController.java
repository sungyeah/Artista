package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.service.ExhibitService;


@Controller
public class ExhibitionController {
	
	@Autowired
	ExhibitService exhibitservice;
	
	@GetMapping("exhibitionview")
	public String exhibitionview(Model model) throws Exception {
		List<Exhibition> Exhibitlist = exhibitservice.exhibits();
		try {
			model.addAttribute("exhibitList", Exhibitlist);
			System.out.println(Exhibitlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exhibition/exhibitionview";
	}
	
	@GetMapping("exhibitionup")
	public String exhibitionup() {
		return "exhibition/exhibitionup";
	}
	
	@GetMapping("exhibitionterm")
	public String exhibitionterm() {
		return "exhibition/exhibitionterm";
	}
}
