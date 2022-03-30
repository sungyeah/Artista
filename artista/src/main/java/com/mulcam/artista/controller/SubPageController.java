package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SubPageController {
	
	
	
	@GetMapping("join")
	public String join() {
		return "join";
	}
	@GetMapping("login")
	public String login() {
		return "login";
	}
	
	@GetMapping("cart")
	public String cart() {
		return "subpage/cart";
	}
	@GetMapping("payment")
	public String payment() {
		return "subpage/payment";
	}
	@GetMapping("paymentsuc")
	public String paymentsuc() {
		return "subpage/paymentsuc";
	}
}
