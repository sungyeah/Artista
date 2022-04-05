package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.PageInfo;
import com.mulcam.artista.service.ArtistApplyService;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.FundingService;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Autowired
	FundingService fundingService;
	
	@Autowired
	ArtistApplyService artistapplyService;
	
	@Autowired
	ArtistService artistService;

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
	public ModelAndView artistApplyList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("manager/artistapplylist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<ArtistApply> artistapplylist = artistapplyService.getArtistApplyList(page, pageInfo);
			
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("artistapplylist", artistapplylist);
			mv.addObject("count", artistapplylist.size());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("artistapplylist", null);
		}
		return mv;
		
	}
	
	@ResponseBody
	@PostMapping(value="artistapplydetail")
	public ResponseEntity<ArtistApply> artistapplyDetail(@RequestParam(value="applyNo",required = false) int artistapplyNo, Model model) {
		ResponseEntity<ArtistApply> result = null;
		try {
			ArtistApply artistApply = artistapplyService.selectArtistApplyById(artistapplyNo);
			result = new ResponseEntity<ArtistApply>(artistApply, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<ArtistApply>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="artistapplysuccess")
	public ResponseEntity<ArtistApply> artistapplySuccess(@RequestParam(value="applyNo",required = false) int artistapplyNo, Model model) {
		ResponseEntity<ArtistApply> result = null;
		try {
			ArtistApply artistApply = artistapplyService.selectArtistApplyById(artistapplyNo);
			Artist artist = new Artist(artistService.getArtistMaxId(), artistApply.getId(), artistApply.getArtistName(), artistApply.getArtistImg(),
						artistApply.getArtistType(), artistApply.getArtistIntroduce(), artistApply.getArtistRecord(), artistApply.getArtistInstagram());
			artistService.insertArtist(artist);
			artistapplyService.deleteArtistApplyById(artistapplyNo);
			
		}catch(Exception e) {
			result = new ResponseEntity<ArtistApply>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
}