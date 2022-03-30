package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("artistpage")
@Controller
public class ArtistPageController {

	@GetMapping({"", "/", "/myworklist"})
	public String artistpageMain() {
		System.out.println("artistpage controller 추가");
		return "artistpage/myworklist";
	}
	
//	@GetMapping("mypagemodify")
//	public String mypagemodify() {
//		return "artistpage/mypagemodify";
//	}
//	@GetMapping("paymentinfo")
//	public String paymentinfo() {
//		return "artistpage/paymentinfo";
//	}
	
	
}
