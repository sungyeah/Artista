package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

	@Controller
	public class FundingController {
		
		//펀딩 리스트
		@GetMapping("fundinguc")
		public String fundinguc() {
			return "funding/fundinguc";
		}
		
		@GetMapping("fundingucdetail")
		public String fundingucdetail() {
			return "funding/fundingucdetail";
		}
		
		@GetMapping("fundingov")
		public String fundingov (){
			return "funding/fundingov";
		}
		
		@GetMapping("fundingovdetail")
		public String fundingovdetail() {
			return	"funding/fundingovdetail";
		}
		
		@GetMapping("fundingtm")
		public String fundingtm() {
			return "funding/fundingtm";
		}
		
		@GetMapping("fundingtmdetail")
		public String fundingtmdetail() {
			return "funding/fundingtmdetail";
		}
		
		
		//펀딩 결제
		@GetMapping("fundingpay")
		public String fundingpay() {
			return "funding/fundingpay";
		}
		
		@GetMapping("fundingpay2")
		public String fundingpay2 () {
			return "funding/fundingpay2";
		}
		
		
		//완료페이지
		@GetMapping("succesamount")
		public String succesamount() {
			return "funding/succesamount";
		}
		
		@GetMapping("succesapply")
		public String succesapply() {
			return "funding/succesapply";
		}
		

		
	}

