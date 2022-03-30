package com.mulcam.artista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager")
public class ManagerController {

	/* 결제 작품 관리 */
	@GetMapping("/paymentlist")
	public String paymentList() {
		System.out.println("hello");
		return "manager/paymentlist";
	}
	@GetMapping("/paycompletelist")
	public String paycompleteList() {
		return "manager/paycompletelist";
	}
	@GetMapping("/productapplylist")
	public String productApplyList() {
		return "manager/productapplylist";
	}
	
	/* 펀딩 관리 */
	@GetMapping({"/fundinglist", "/fundingapplylist" })
	public String fundingApplyList() {
		return "manager/fundingapplylist";
	}
	@GetMapping("/fundingupcoming")
	public String fundingUpcoming() {
		return "manager/fundingupcoming";
	}
	@GetMapping("/fundingproceeding")
	public String fundingupCurrent() {
		return "manager/fundingproceeding";
	}
	@GetMapping("/fundingended")
	public String fundingEnded() {
		return "manager/fundingended";
	}
	
	/* 전시 관리 */
	@GetMapping("/exhibitionlist")
	public String exhibitiontList() {
		return "manager/exhibitionlist";
	}
	@GetMapping("/exhibitionapplylist")
	public String exhibitiontApplyList() {
		return "manager/exhibitionapplylist";
	}
	
	/* 회원 관리 */
	@GetMapping("/memberlist")
	public String memberList() {
		return "manager/memberlist";
	}
	@GetMapping("/artistlist")
	public String artistList() {
		return "manager/artistlist";
	}
	@GetMapping(value="/artistapplylist")
	public String artistApplyList() {
		return "manager/artistapplylist";
	}
}
