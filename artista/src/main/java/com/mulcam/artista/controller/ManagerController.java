package com.mulcam.artista.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.OrderReport;
import com.mulcam.artista.dto.PageInfo;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.dto.WorkApply;
import com.mulcam.artista.dto.WorkReport;
import com.mulcam.artista.service.ArtistApplyService;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.ExhibitService;
import com.mulcam.artista.service.FundingService;
import com.mulcam.artista.service.MypageService;
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
	ExhibitService exhibitService;
	
	@Autowired
	SubPageServiceImpl subPageService;
	
	@Autowired
	MypageService myPageService;

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
		ModelAndView mv = new ModelAndView("manager/paymentinfo");
		try {
			Order order = myPageService.orderInfo(orderNo);
			mv.addObject("order",order);
			String[] arr = order.getWorkNo().split(",");
			List<Work> wor = new ArrayList<Work>();
			for(int i=0;i<arr.length;i++) {
				int workno = Integer.parseInt(arr[i]);
				Work work = workService.workinfo(workno);
				wor.add(work);
			}
			mv.addObject("works",wor);
		} catch(Exception e) {
			mv.addObject("works", null);
		}
		return mv;
	}
	@GetMapping("/paycompletelist")
	public String paycompleteList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Work> completelist = workService.SoldProductList(page, pageInfo);
			List<WorkReport> workReportList = new ArrayList<WorkReport>();
			for(int i=0; i<completelist.size(); i++) {
				WorkReport workreport = new WorkReport();
				Work work = completelist.get(i);
				Order order = subPageService.selectOrderByNo(work.getOrderNo());
				workreport.setWork(work);
				workreport.setOrder(order);
				workReportList.add(workreport);
			}
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", completelist.size());
			model.addAttribute("workreport", workReportList);
		}catch(Exception e) {
			model.addAttribute("workreport", null);
		}		
		return "manager/paycompletelist";
	}
	@ResponseBody
	@PostMapping(value="artistpaycomplete")
	public void artistpayComplete(@RequestParam(value="workNo",required = false) int workNo) {
		try {
			workService.workPayed(workNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/* 상품 등록 or 수정 신청 */
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
	public void productapplySuccess(@RequestParam(value="applyNo",required = false) int workapplyNo, 
			@RequestParam(value="applyState",required = false) int applyState) {
		try {			
			WorkApply workapply = workapplyService.selectWorktApplyByNo(workapplyNo);
			
			// 상품 등록 허락
			if(applyState==0) {
				Work work = null;
				work = new Work(workService.getWorkMaxNo(), workapply.getArtistNo(), workapply.getArtistName(), workapply.getWorkName(),
						workapply.getWorkImg(), workapply.getWorkType(), workapply.getWorkTech(), 
						workapply.getWorkSize(), workapply.getWorkIntro(), workapply.getWorkPrice(), 1, -1,workapply.getWorkHeight());
				workService.insertWork(work);
				workapplyService.deleteWorkApply(workapplyNo);
			}
			// 상품 수정 허락
			else if(applyState==2) {
				Work work = null;
				work = new Work(workapply.getWorkNo(), workapply.getArtistNo(), workapply.getArtistName(), workapply.getWorkName(),
						workapply.getWorkImg(), workapply.getWorkType(), workapply.getWorkTech(), 
						workapply.getWorkSize(), workapply.getWorkIntro(), workapply.getWorkPrice(), 1, -1,workapply.getWorkHeight());
				workService.updateWork(work);
				workapplyService.deleteWorkApply(workapplyNo);
			}
			
		}catch(Exception e) {
		}
	}
	
	/* 상품 등록 거절 */
	@ResponseBody
	@PostMapping(value="productapplyfail")
	public void productapplyFail(@RequestParam(value="applyNo",required = false) int workapplyNo,
			@RequestParam(value="applyState",required = false) int applyState, 
			@RequestParam(value="refusedContents",required = false) String refusedContents) {
		try {
			//exhibitapplyNo로 전시등록신청 내용 가져오기
			WorkApply workapply = workapplyService.selectWorktApplyByNo(workapplyNo);
			workapplyService.refuseWorkApply(workapplyNo, applyState+1, refusedContents);
		}catch(Exception e) {
			e.printStackTrace();
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
	public String exhibitiontList(Model model) {
		try {
			List<Exhibition> exhibitlist = exhibitService.ExhibiList();
			model.addAttribute("exhibitlist", exhibitlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "manager/exhibitionlist";
	}
	@ResponseBody
	@PostMapping(value="exhibitdetail")
	public ResponseEntity<Exhibition> exhibitDetail(@RequestParam(value="exhibitNo",required = false) int exhibitNo, Model model) {
		ResponseEntity<Exhibition> result = null;
		try {
			Exhibition exhibit = exhibitService.selectExhibit(exhibitNo);
			result = new ResponseEntity<Exhibition>(exhibit, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Exhibition>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	@GetMapping("/exhibitionapplylist")
	public String exhibitiontApplyList(Model model) {
		try {
			List<ExhibitionApply> applylist = exhibitService.ExhibitApplyList();
			model.addAttribute("applylist", applylist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "manager/exhibitionapplylist";
	}
	@ResponseBody
	@PostMapping(value="exhibitapplydetail")
	public ResponseEntity<ExhibitionApply> exhibitapplyDetail(@RequestParam(value="applyNo",required = false) int applyNo, Model model) {
		ResponseEntity<ExhibitionApply> result = null;
		try {
			ExhibitionApply exhibitapply = exhibitService.selectExhibitApply(applyNo);
			result = new ResponseEntity<ExhibitionApply>(exhibitapply, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<ExhibitionApply>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	/* 전시 등록 허락 */
	@ResponseBody
	@PostMapping(value="exhibitapplysuccess")
	public void exhibitapplySuccess(@RequestParam(value="applyNo",required = false) int exhibitapplyNo) {
		try {
			//exhibitapplyNo로 전시등록신청 내용 가져오기
			ExhibitionApply exhibitApply = exhibitService.selectExhibitApply(exhibitapplyNo);
			
			//exhibit data에 artistapply 내용 옮기고 artist에 등록하기
			Exhibition exhibit = new Exhibition(exhibitService.maxExhibitNo(), exhibitApply.getFundingNo(), exhibitApply.getArtistNo(), exhibitApply.getExhibitTitle(),
					exhibitApply.getExhibitPoster(), exhibitApply.getExhibitArtist() , exhibitApply.getStartDate(), exhibitApply.getEndDate(), exhibitApply.getExhibitPlace(), exhibitApply.getReserveLink());
			
			exhibitService.insertExhibit(exhibit);
			exhibitService.deleteExhibitApply(exhibitapplyNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/* 전시 등록 거절 */
	@ResponseBody
	@PostMapping(value="exhibitapplyfail")
	public void exhibitapplyFail(@RequestParam(value="applyNo",required = false) int exhibitapplyNo, @RequestParam(value="refusedContents",required = false) String refusedContents) {
		try {
			//exhibitapplyNo로 전시등록신청 내용 가져오기
			ExhibitionApply exhibitApply = exhibitService.selectExhibitApply(exhibitapplyNo);
			exhibitService.refuseExhibitApply(exhibitapplyNo, refusedContents);
		}catch(Exception e) {
			e.printStackTrace();
		}
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
	public ResponseEntity<Map<String,Object>> artistapplyDetail(@RequestParam(value="applyNo",required = false) int artistapplyNo, Model model) {
		//ResponseEntity<ArtistApply> result = null;
		Map<String,Object> result = new HashMap<>();
		try {
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			List<ArtistWorld> artistworld = artistapplyService.selectArtistWorldApplyByNo(artistApply.getId());
			result.put("artistApply", artistApply);
			result.put("artistworld", artistworld);
		}catch(Exception e) {
			result.put("null", "null");
		}
		return ResponseEntity.ok().body(result);
	}
	
	/* 아티스트 등록 허락 */
	@ResponseBody
	@PostMapping(value="artistapplysuccess")
	public void artistapplySuccess(@RequestParam(value="applyNo",required = false) int artistapplyNo) {
		try {
			//artistapplyNo로 작가신청 내용 가져오기
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			
			//artist data에 artistapply 내용 옮기고 artist에 등록하기
			Artist artist = new Artist(artistService.getArtistMaxId(), artistApply.getId(), artistApply.getArtistName(), artistApply.getArtistImg(),
						artistApply.getArtistType(), artistApply.getArtistIntroduce(), artistApply.getArtistRecord(), artistApply.getArtistInstagram(), 0);
			artistService.insertArtist(artist);
			
			//artistapply에 내용 삭제
			artistapplyService.deleteArtistApplyById(artistapplyNo);
			
			//member type "artist"로 변경
			subPageService.changeMemberType(artist.getId(), "artist");
		}catch(Exception e) {
		}
	}
	
	/* 아티스트 등록 거절 */
	@ResponseBody
	@PostMapping(value="artistapplyfail")
	public void artistapplyFail(@RequestParam(value="applyNo") int artistapplyNo, @RequestParam(value="refusedContents") String refusedContents) {
		try {
			String artistId = artistapplyService.selectArtistApplyByNo(artistapplyNo).getId();
			artistapplyService.refuseArtistApply(artistapplyNo, refusedContents);
			artistapplyService.deleteArtistWorld(artistId);
		}catch(Exception e) {
		}
	}
}