package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

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