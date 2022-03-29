package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String main() {
		return "main";
	}
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
		return "cart";
	}
	@GetMapping("payment")
	public String payment() {
		return "payment";
	}
	@GetMapping("paymentsuc")
	public String paymentsuc() {
		return "paymentsuc";
	}
}
