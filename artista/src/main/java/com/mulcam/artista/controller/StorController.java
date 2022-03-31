package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StorController {
	
	@GetMapping("storelist")
	public String storelist() {
		return "store/storelist";
	}
	
	@GetMapping("storedetail")
	public String storedetail() {
		return "store/storedetail";
	}
}
