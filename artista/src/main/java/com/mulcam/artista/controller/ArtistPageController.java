package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("artistpage")
@Controller
public class ArtistPageController {

	@GetMapping({"", "/", "/mywork"})
	public String artistpageMain() {
		return "artistpage/mywork";
	}
	
	@GetMapping("myproduct")
	public String artistpageProduct() {
		return "artistpage/myproduct";
	}
	@GetMapping("myproductsold")
	public String artistpageProductSold() {
		return "artistpage/myproductsold";
	}
	
	@GetMapping("myfunding")
	public String artistpageFunding() {
		return "artistpage/myfunding";
	}
	@GetMapping("myexhibition")
	public String artistpageExhibition() {
		return "artistpage/myexhibition";
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
