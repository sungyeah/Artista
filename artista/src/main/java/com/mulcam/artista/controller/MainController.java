package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@GetMapping("main")
	public String main() {
		return "main";
	}
	
	@GetMapping("artista")
	public String index() {
		return "index";
	}
}
