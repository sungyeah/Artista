package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExhibitionController {
	
	@GetMapping("exhibitionview")
	public String exhibitionview() {
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
