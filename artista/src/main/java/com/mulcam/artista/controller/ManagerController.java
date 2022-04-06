package com.mulcam.artista.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.OrderReport;
import com.mulcam.artista.dto.PageInfo;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.dto.WorkApply;
import com.mulcam.artista.service.ArtistApplyService;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.FundingService;
import com.mulcam.artista.service.SubPageServiceImpl;
import com.mulcam.artista.service.WorkApplyService;
import com.mulcam.artista.service.WorkService;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Autowired
	FundingService fundingService;
	
	@Autowired
	ArtistApplyService artistapplyService;
	@Autowired
	ArtistService artistService;
	
	@Autowired
	WorkApplyService workapplyService;
	@Autowired
	WorkService workService;
	
	@Autowired
	SubPageServiceImpl subPageService;

	/* 결제 작품 관리 */
	@GetMapping({"", "/", "/paymentlist"})
	public ModelAndView paymentList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("manager/paymentlist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Order> orderlist = subPageService.orderList(page, pageInfo);
			List<OrderReport> orderdetail = new ArrayList<OrderReport>(); 
			for(int i=0; i<orderlist.size(); i++) {
				OrderReport orderReport = new OrderReport();
				Order order = orderlist.get(i);
				orderReport.setOrder(order);
				String[] workNos = order.getWorkNo().split(",");
				List<Work> works = new ArrayList<Work>();
				for (int j = 0; j < workNos.length; j++) {
					int workno = Integer.parseInt(workNos[j]);
					Work work = workService.workinfo(workno);
					works.add(work);
				}
				orderReport.setWorks(works);
				orderdetail.add(orderReport);
			}
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("count", orderlist.size());
			mv.addObject("orderdetail", orderdetail);
		} catch(Exception e) {
			mv.addObject("orderlist", null);
		}
		return mv;
	}
	@GetMapping("/paymentInfo/{orderNo}")
	public ModelAndView paymentInfo(@PathVariable(value="orderNo") int orderNo) {
		ModelAndView mv = new ModelAndView("manager/productapplylist");
		PageInfo pageInfo = new PageInfo();
		try {
//			List<WorkApply> productapplylist = workapplyService.getWorkApplyList(page, pageInfo);
//			mv.addObject("pageInfo", pageInfo);
//			mv.addObject("productapplylist", productapplylist);
//			mv.addObject("count", productapplylist.size());
		} catch(Exception e) {
			mv.addObject("productapplylist", null);
		}
		return mv;
	}
	@GetMapping("/paycompletelist")
	public String paycompleteList() {
		return "manager/paycompletelist";
	}
	
	
	/* 상품 등록 신청 */
	@GetMapping("/productapplylist")
	public ModelAndView productApplyList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("manager/productapplylist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<WorkApply> productapplylist = workapplyService.getWorkApplyList(page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("productapplylist", productapplylist);
			mv.addObject("count", productapplylist.size());
		} catch(Exception e) {
			mv.addObject("productapplylist", null);
		}
		return mv;
	}
	@ResponseBody
	@PostMapping(value="productapplydetail")
	public ResponseEntity<WorkApply> productapplyDetail(@RequestParam(value="applyNo",required = false) int productapplyNo, Model model) {
		ResponseEntity<WorkApply> result = null;
		try {
			WorkApply workapply = workapplyService.selectWorktApplyByNo(productapplyNo);
			result = new ResponseEntity<WorkApply>(workapply, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<WorkApply>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	
	/* 상품 등록 허락 */
	@ResponseBody
	@PostMapping(value="productapplysuccess")
	public void productapplySuccess(@RequestParam(value="applyNo",required = false) int workapplyNo) {
		try {
			WorkApply workapply = workapplyService.selectWorktApplyByNo(workapplyNo);
			Work work = new Work(workService.getWorkMaxNo(), workapply.getArtistNo(), workapply.getArtistName(), workapply.getWorkName(),
					workapply.getWorkImg(), workapply.getWorkType(), workapply.getWorkTech(), 
					workapply.getWorkSize(), workapply.getWorkIntro(), workapply.getWorkPrice(), 1, -1);
			workService.insertWork(work);
			workapplyService.deleteWorkApply(workapplyNo);
		}catch(Exception e) {
		}
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
	public ModelAndView memberList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("manager/memberlist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Member> memberlist = subPageService.memberList(page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("memberlist", memberlist);
			mv.addObject("count", memberlist.size());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("memberlist", null);
		}
		return mv;
	}
	@GetMapping("/artistlist")
	public ModelAndView artistList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("manager/artistlist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Artist> artistlist = artistService.artistList(page, pageInfo);			
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("artistlist", artistlist);
			mv.addObject("count", artistlist.size());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("artistlist", null);
		}
		return mv;
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
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			result = new ResponseEntity<ArtistApply>(artistApply, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<ArtistApply>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 아티스트 등록 허락 */
	@ResponseBody
	@PostMapping(value="artistapplysuccess")
	public void artistapplySuccess(@RequestParam(value="applyNo",required = false) int artistapplyNo) {
		try {
			//artistapplyNo로 작가신청 내용 가져오기
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			System.out.println(artistApply.getId());
			
			System.out.println(artistService.getArtistMaxId());
			System.out.println(artistApply.getArtistNo());
			System.out.println(artistApply.getArtistName());
			System.out.println(artistApply.getArtistImg());
			System.out.println(artistApply.getArtistIntroduce());
			
			
			//artist data에 artistapply 내용 옮기고 artist에 등록하기
			Artist artist = new Artist(artistService.getArtistMaxId(), artistApply.getId(), artistApply.getArtistName(), artistApply.getArtistImg(),
						artistApply.getArtistType(), artistApply.getArtistIntroduce(), artistApply.getArtistRecord(), artistApply.getArtistInstagram(), 0);
			artistService.insertArtist(artist);
			System.out.println("hello" + artist.getId());
			//artistapply에 내용 삭제
			artistapplyService.deleteArtistApplyById(artistapplyNo);
			
			//member type "artist"로 변경
			subPageService.changeMemberType(artist.getId(), "artist");
			System.out.println(artist.getId());
			
			System.out.println("작가 등록 성공");
		}catch(Exception e) {
		}
	}
	
	/* 아티스트 등록 거절 */
	@ResponseBody
	@PostMapping(value="artistapplyfail")
	public void artistapplyFail(@RequestParam(value="applyNo") int artistapplyNo, @RequestParam(value="refusedContents") String refusedContents) {
		try {
			artistapplyService.refuseArtistApply(artistapplyNo, refusedContents);
			System.out.println("작가 등록 실패");
		}catch(Exception e) {
		}
	}
}