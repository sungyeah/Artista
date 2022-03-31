package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ArtistsController {
	@GetMapping("artistslist")
	public String artistslist() {
		return "artists/artistslist";
	}
	
	@GetMapping("artistdetail")
	public String artistdetail() {
		return "artists/artistdetail";
	}
}
