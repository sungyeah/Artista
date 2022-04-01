package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("artistpage")
@Controller
public class ArtistPageController {

	// 아티스트의 작품
	@GetMapping({"", "/", "/mywork"})
	public String artistpageMain() {
		return "artistpage/mywork";
	}
	@GetMapping("enrollwork")
	public String artistpageEnrollWork() {
		return "artistpage/enrollwork";
	}
	
	// 아티스트의 작품 판매
	@GetMapping("myproduct")
	public String artistpageProduct() {
		return "artistpage/myproduct";
	}
	@GetMapping("enrollproduct")
	public String artistpageEnrollProduct() {
		return "artistpage/enrollproduct";
	}
	@GetMapping("myproductsold")
	public String artistpageProductSold() {
		return "artistpage/myproductsold";
	}
	
	// 아티스트의 펀딩
	@GetMapping("myfunding")
	public String artistpageFunding() {
		return "artistpage/myfunding";
	}
	@GetMapping("applyfunding")
	public String applyfunding() {
		return "artistpage/applyfunding";
	}
	
//	@PostMapping("applyfunding")
//	public String fundingwrite() {
//		return "artistpage/applyfunding";
//	}
//	
	@GetMapping("modifyfunding")
	public String modifyfunding() {
		return "artistpage/modifyfunding";
	}
	
	@GetMapping("search")
	public String succes() {
		return "artistpage/search";
	}
	
	@PostMapping("search")
	public String succesapply() {
		return "artistpage/search";
	}
	

	
	// 아티스트의 전시
	@GetMapping("myexhibition")
	public String artistpageExhibition() {
		return "artistpage/myexhibition";
	}
	@GetMapping("enrollexhibition")
	public String artistpageEnrollExhibition() {
		return "artistpage/enrollexhibition";
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
