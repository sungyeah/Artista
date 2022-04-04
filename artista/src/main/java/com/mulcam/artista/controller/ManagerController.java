package com.mulcam.artista.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.service.FundingService;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Autowired
	FundingService fundingService;

	/* 결제 작품 관리 */
	@GetMapping({"", "/", "/paymentlist"})
	public String paymentList() {
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
	
	//펀딩 요청 왔을 때 받아서 펀딩에 넣어주기
//	@PostMapping("/fundinglist")
//	public String fundingApplyList2(@ModelAttribute Funding funding){
//		Funding fun = FundingService.queryfunding(fundingNo);
//		fundingService.insertfunding(fun);
//		return "manager/fundingapplylist";
//	}
	
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
