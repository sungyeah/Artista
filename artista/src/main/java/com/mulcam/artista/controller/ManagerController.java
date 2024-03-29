package com.mulcam.artista.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Fundingspon;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.OrderReport;
import com.mulcam.artista.dto.PageInfo;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.dto.WorkApply;
import com.mulcam.artista.dto.WorkReport;
import com.mulcam.artista.service.ArtistApplyService;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.ArtistWorldService;
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
	ArtistWorldService artistworldService;
	
	@Autowired
	MypageService myPageService;
	
	@Autowired
	ServletContext servletContext;
	
	@Value("${upload.filepath.ncloud}")
	private boolean bcloud;
	
	@Value("${upload.filepath}")
	private String filepath;
	

	/* 결제 작품 관리 */
	@GetMapping({"", "/", "/paymentlist"})
	public ModelAndView paymentList() {
		ModelAndView mv = new ModelAndView("manager/paymentlist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Order> orderlist = subPageService.orderList();
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
	public String paycompleteList(Model model) {
		PageInfo pageInfo = new PageInfo();
		try {
			List<Work> completelist = workService.SoldProductList();
			List<WorkReport> workReportList = new ArrayList<WorkReport>();
			for(int i=0; i<completelist.size(); i++) {
				WorkReport workreport = new WorkReport();
				Work work = completelist.get(i);
				Order order = subPageService.selectOrderByNo(work.getOrderNo());
				workreport.setWork(work);
				workreport.setOrder(order);
				workReportList.add(workreport);
				System.out.println(work.getArtistName());
			}
//			model.addAttribute("pageInfo", pageInfo);
//			model.addAttribute("count", completelist.size());
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
	
	/*운송장 번호 입력*/
	@ResponseBody
	@PostMapping(value="trackingNo")
	public boolean TrackingNo(@RequestParam(value="orderNo",required = false) int orderNo, @RequestParam(value="trackingNo",required = false) String trackingNo) {
		boolean result;
		try {
			subPageService.setTrackingNo(orderNo, trackingNo);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	
	/* 상품 등록 or 수정 신청 */
	@GetMapping("/productapplylist")
	public ModelAndView productApplyList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("manager/productapplylist");
		PageInfo pageInfo = new PageInfo();
		try {
			List<WorkApply> productapplylist = workapplyService.getWorkApplyList();
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("productapplylist", productapplylist);
			mv.addObject("count", productapplylist.size());
		} catch(Exception e) {
			mv.addObject("productapplylist", null);
		}
		return mv;
	}
	
	/* 상품 신청 삭제하기 */
	@ResponseBody
	@PostMapping(value="productApplyDelete")
	public void productApplyDelete(@RequestParam(value="checkarray[]") int[] productapplyNo) {
		for(int i=0; i<productapplyNo.length; i++) {
			try {
				workapplyService.deleteWorkApply(productapplyNo[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
						workapply.getWorkSize(), workapply.getWorkIntro(), workapply.getWorkPrice(), 1, -1, workapply.getWorkHeight());
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
	public String fundingApplyList(Model model) {
		List<Funding> fundingappList;
		try {
			fundingappList = fundingService.fundingAppList();
			model.addAttribute("fundingappList", fundingappList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "manager/fundingapplylist";
	}
	/* 펀딩 신청 상세보기 */
	@ResponseBody
	@PostMapping(value="fundingapplydetail")
	public Map<String, Object> fundingapplyDetail(@RequestParam(value="applyNo", required = false) int applyNo, Model model) {
		Map<String, Object> json = new HashMap<>();
		try {
			Funding fundingapply = fundingService.querytfundingApp(applyNo);
			Artist artist = artistService.Artistinfo(fundingapply.getArtistNo());
			String email = subPageService.queryId(artist.getId()).getEmail();
			json.put("fundingapply", fundingapply);
			json.put("artist", artist);
			json.put("email", email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	/* 펀딩 등록 허락 */
	@ResponseBody
	@PostMapping(value="fundingapplysuccess")
	public void fundingapplySuccess(@RequestParam(value="applyNo",required = false) int fundingNo) {
		try {
			//fundingNo로 펀딩등록신청 내용 가져오기
			Funding fundingapply = fundingService.querytfundingApp(fundingNo);
			Artist artist = artistService.Artistinfo(fundingapply.getArtistNo());
			int applyState = fundingapply.getApplyStatus();
			
			//등록 허락
			if(applyState==0) {
				//funding data에 fundingapply 내용 옮기고 funding에 등록하기
				Funding funding = new Funding(fundingService.getfundingNo(), artist.getArtistNo(), artist.getArtistName(), fundingapply.getProjTitle(),
						fundingapply.getProjIntro(), fundingapply.getProjBudget(), fundingapply.getProjArtist(), fundingapply.getTargetFunding(),fundingapply.getFundingDate(), fundingapply.getStartDate(), fundingapply.getEndDate(),
						fundingapply.getThumbImg(), fundingapply.getGetplace(), fundingapply.getGetplace2());
				fundingService.insertfunding(funding);	// 펀딩 등록
				fundingService.updateFundingApplyEnroll(fundingapply.getFundingNo()); // 
			}
			//수정 허락
			else if(applyState==2) {
				Funding funding = new Funding(fundingapply.getFundingOriginNo(), artist.getArtistNo(), artist.getArtistName(), fundingapply.getProjTitle(),
						fundingapply.getProjIntro(), fundingapply.getProjBudget(), fundingapply.getProjArtist(), fundingapply.getTargetFunding(),fundingapply.getFundingDate(), fundingapply.getStartDate(), fundingapply.getEndDate(),
						fundingapply.getThumbImg(), fundingapply.getGetplace(), fundingapply.getGetplace2());
				fundingService.updateFundingModiy(funding);	// 펀딩 수정
				fundingService.updateFundingApplyModifyEnroll(fundingapply.getFundingNo());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	/* 펀딩 등록 거절 */
	@ResponseBody
	@PostMapping(value="fundingapplyfail")
	public void fundingapplyFail(@RequestParam(value="applyNo",required = false) int fundingNo, @RequestParam(value="refusedContents",required = false) String refusedContents) {
		try {
			fundingService.refuseFundingApply(fundingNo, refusedContents);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//펀딩 요청 왔을 때 받아서 펀딩에 넣어주기
//	@PostMapping("/fundinglist")
//	public String fundingApplyList2(@ModelAttribute Funding funding){
//		Funding fun = FundingService.queryfunding(fundingNo);
//		fundingService.insertfunding(fun);
//		return "manager/fundingapplylist";
//	}
	
	@GetMapping("/fundingupcoming")
	public String fundingUpcoming(Model model) {
		List<Funding> fundingUpList;
		try {
			fundingUpList = fundingService.fundingExpectList();
			model.addAttribute("fundingUpList", fundingUpList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "manager/fundingupcoming";
	}
	@GetMapping("/fundingproceeding")
	public String fundingupCurrent(Model model) {
		List<Funding> fundingNowList;
		try {
			fundingNowList = fundingService.fundingNowList();
			model.addAttribute("fundingNowList", fundingNowList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "manager/fundingproceeding";
	}
	@GetMapping("/fundingended")
	public String fundingEnded(Model model) {
		List<Funding> fundingEndedList;
		try {
			fundingEndedList = fundingService.fundingEndedList();
			model.addAttribute("fundingEndedList", fundingEndedList);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	/* 전시 삭제하기 */
	@ResponseBody
	@PostMapping(value="exhibitionDelete")
	public void exhibitionDelete(@RequestParam(value="checkarray[]") int[] exhibitionNo) {
		for(int i=0; i<exhibitionNo.length; i++) {
			try {
				exhibitService.deleteExhibit(exhibitionNo[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
	
	@GetMapping("/enrollexhibition")
	public String enrollExhibition() {
		return "manager/enrollexhibition";
	}
	
	@PostMapping("exhibitionEnrollComplete")
	public String exhibitionEnrollComplete(@ModelAttribute Exhibition exhibit, 
			@RequestParam(value="posterImgFile") MultipartFile posterImgFile, 
			@RequestParam(value="exhibitDate") String exhibitDate, Model model) 
	{
		String path = "";
		if(bcloud) {
			path = filepath+"exhibition/";
		} else {
			path = servletContext.getRealPath(filepath+"exhibition/");
		}
		
		//포스터 이미지 등록
		//String path = servletContext.getRealPath("/imgupload/exhibition/");
		String[] mtypes = posterImgFile.getContentType().split("/");
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");		//등록 시간으로 이름 정하기
		Date time = new Date();
		String exhibitEnrollTime = simpleDate.format(time);
		int exhibitionNo;
		try {
			exhibitionNo = exhibitService.maxExhibitNo();
			File destFile = new File(path + exhibitEnrollTime +"."+ mtypes[1]);	//이미지 타입
			posterImgFile.transferTo(destFile);
			
			String exhibitposterImg = exhibitEnrollTime +"."+ mtypes[1];
			exhibit.setExhibitNo(exhibitionNo);
			exhibit.setExhibitPoster(exhibitposterImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String[] date = exhibitDate.split(" ~ ");
		DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(date[0]));
		System.out.println(Timestamp.valueOf(localDateTime));
		exhibit.setStartDate(Timestamp.valueOf(localDateTime).toString());
		localDateTime = LocalDateTime.from(formatDateTime.parse(date[1]));
		exhibit.setEndDate(Timestamp.valueOf(localDateTime).toString());
		exhibit.setFundingNo(-1);
		
		try {
			exhibitService.insertExhibit(exhibit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "manager/succesapply";
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
	
	/* 전시수정 삭제하기 */
	@ResponseBody
	@PostMapping(value="exhibitionApplyDelete")
	public void exhibitionApplyDelete(@RequestParam(value="checkarray[]") int[] applyNo) {
		for(int i=0; i<applyNo.length; i++) {
			try {
				exhibitService.deleteExhibitApply(applyNo[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
			int applyState = exhibitApply.getApplyStatus();
			
			//등록 허락
			if(applyState==0) {
				//exhibit data에 artistapply 내용 옮기고 artist에 등록하기
				Exhibition exhibit = new Exhibition(exhibitService.maxExhibitNo(), exhibitApply.getFundingNo(), exhibitApply.getArtistNo(), exhibitApply.getExhibitTitle(),
						exhibitApply.getExhibitPoster(), exhibitApply.getExhibitArtist() , exhibitApply.getStartDate(), exhibitApply.getEndDate(), exhibitApply.getExhibitPlace(), exhibitApply.getReserveLink());
				
				exhibitService.insertExhibit(exhibit);
				exhibitService.deleteExhibitApply(exhibitapplyNo);
			}
			//수정 허락
			else if(applyState==2) {
				//exhibit data에 artistapply 내용 옮기고 artist에 등록하기
				Exhibition exhibit = new Exhibition(exhibitApply.getExhibitNo(), exhibitApply.getFundingNo(), exhibitApply.getArtistNo(), exhibitApply.getExhibitTitle(),
						exhibitApply.getExhibitPoster(), exhibitApply.getExhibitArtist() , exhibitApply.getStartDate(), exhibitApply.getEndDate(), exhibitApply.getExhibitPlace(), exhibitApply.getReserveLink());

				exhibitService.updateExhibit(exhibit);
				exhibitService.deleteExhibitApply(exhibitapplyNo);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/* 전시 등록 거절 */
	@ResponseBody
	@PostMapping(value="exhibitapplyfail")
	public void exhibitapplyFail(@RequestParam(value="applyNo",required = false) int exhibitapplyNo, @RequestParam(value="refusedContents",required = false) String refusedContents) {
		try {
			System.out.println(exhibitapplyNo);
			//exhibitapplyNo로 전시등록신청 내용 가져오기
			ExhibitionApply exhibitApply = exhibitService.selectExhibitApply(exhibitapplyNo);
			exhibitService.refuseExhibitApply(exhibitapplyNo, refusedContents);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	/* 회원 관리 */
	@GetMapping("/memberlist")
	public ModelAndView memberList() {
		ModelAndView mv = new ModelAndView("manager/memberlist");
		try {
			List<Member> memberlist = subPageService.memberList();
			mv.addObject("memberlist", memberlist);
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("memberlist", null);
		}
		return mv;
	}
	
	/* 회원 탈퇴시키기 */
	@ResponseBody
	@PostMapping(value="memberDelete")
	public void memberDelete(@RequestParam(value="checkarray[]") List<String> id) {
		for(int i=0; i<id.size(); i++) {
			try {
				subPageService.deleteId(id.get(i));
				if(subPageService.memTypeInfo(id.get(i))=="artist") {
					int artistNo = artistService.artistInfo(id.get(i)).getArtistNo();
					artistService.deleteArtist(artistNo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping("/artistlist")
	public ModelAndView artistList() {
		ModelAndView mv = new ModelAndView("manager/artistlist");
		try {
			List<Artist> artistlist = artistService.artistList();
			for(int i=0;i<artistlist.size();i++) {
				int follower = subPageService.followercnt(artistlist.get(i).getId());
				artistlist.get(i).setFollowerNum(follower);
			}
			mv.addObject("artistlist", artistlist);
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("artistlist", null);
		}
		return mv;
	}
	
	/* 아티스트 삭제하기 */
	@ResponseBody
	@PostMapping(value="artistDelete")
	public void artistDelete(@RequestParam(value="checkarray[]") int[] artistNo) {
		for(int i=0; i<artistNo.length; i++) {
			try {
				String id = artistService.selectArtistByNo(artistNo[i]).getId();
				subPageService.changeMemberType(id, null);
				artistService.deleteArtist(artistNo[i]);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping(value="/artistapplylist")
	public ModelAndView artistApplyList() {
		ModelAndView mv = new ModelAndView("manager/artistapplylist");
		try {
			List<ArtistApply> artistapplylist = artistapplyService.getArtistApplyList();
			mv.addObject("artistapplylist", artistapplylist);
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("artistapplylist", null);
		}
		return mv;
		
	}
	
	@ResponseBody
	@PostMapping(value="artistapplydetail")
	public Map<String,Object> artistapplyDetail(@RequestParam(value="applyNo",required = false) int artistapplyNo, Model model) {
		Map<String,Object> result = new HashMap<>();
		try {
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			result.put("artistApply", artistApply);
			String artistworld = null;
			if(artistApply.getArtistWorld() !=null) {
				artistworld = artistApply.getArtistWorld();
				System.out.println("1" + artistworld);
			} else {
				artistworld = artistapplyService.selectArtistWorldApplyByNo(artistApply.getId()).getImgName();
			}
			result.put("artistApply", artistApply);
			if(artistworld!=null) {
				result.put("artistworld", artistworld);
			}
		}catch(Exception e) {
			result.put("null", "null");
		}
		return result;
	}
	
	/* 아티스트 등록 허락 */
	@ResponseBody
	@PostMapping(value="artistapplysuccess")
	public void artistapplySuccess(@RequestParam(value="applyNo",required = false) int artistapplyNo) {
		try {
			System.out.println(artistapplyNo);
			//artistapplyNo로 작가신청 내용 가져오기
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			
			//아티스트 등록하기
			if(artistApply.getApplyResult()==0) {
				//artist data에 artistapply 내용 옮기고 artist에 등록하기
				Artist artist = new Artist(artistService.getArtistMaxId(), artistApply.getId(), artistApply.getArtistName(), artistApply.getArtistImg(),
							artistApply.getArtistType(), artistApply.getArtistIntroduce(), artistApply.getArtistRecord(), artistApply.getArtistInstagram(), 0);
				//artist insert
				artistService.insertArtist(artist);
				
				//artistapply에 내용 삭제
				artistapplyService.deleteArtistApplyById(artistapplyNo);
				
				//member type "artist"로 변경
				subPageService.changeMemberType(artist.getId(), "artist");
			} 
			// 아티스트 수정 등록하기
			else if(artistApply.getApplyResult()==2) {
				Artist artist = new Artist(artistApply.getOriginArtistNo(), artistApply.getId(), artistApply.getArtistName(), artistApply.getArtistImg(),
						artistApply.getArtistType(), artistApply.getArtistIntroduce(), artistApply.getArtistRecord(), artistApply.getArtistInstagram());
				//artist update
				artistService.updateArtist(artist);
				
				String artistworld = null;
				if(artistApply.getArtistWorld() !=null) {
					artistworld = artistApply.getArtistWorld();
					
					// 세로운 아티스트 세계 추가
					ArtistWorld worldImg = new ArtistWorld();
					worldImg.setImgName(artistworld);
					worldImg.setId(artistApply.getId());
					artistworldService.artistWorldUpdate(worldImg);
				}			
				//artistapply에 내용 삭제
				artistapplyService.deleteArtistApplyById(artistapplyNo);
			}
			
		}catch(Exception e) {
		}
	}
	
	/* 아티스트 등록 거절 */
	@ResponseBody
	@PostMapping(value="artistapplyfail")
	public void artistapplyFail(@RequestParam(value="applyNo") int artistapplyNo, @RequestParam(value="refusedContents") String refusedContents) {
		try {
			ArtistApply artistApply = artistapplyService.selectArtistApplyByNo(artistapplyNo);
			String artistId = artistapplyService.selectArtistApplyByNo(artistapplyNo).getId();
			artistapplyService.refuseArtistApply(artistapplyNo, refusedContents);
			if(artistApply.getApplyResult()==0) {
				artistapplyService.deleteArtistWorld(artistId);
			}
		}catch(Exception e) {
		}
	}
	
	@ResponseBody
	@PostMapping(value="sponList")
	public List<Map> sponList(@RequestParam(value="fundingNo") int fundingNo) {
		List<Map> sponsorList = new ArrayList<Map>();
		try {
			List<Fundingspon> sponList = fundingService.sponList(fundingNo);
			for(int i=0;i<sponList.size();i++) {
				Map<String,Object> sponInfo = new HashMap<String,Object>();
				Fundingspon spon = sponList.get(i);
				String id = spon.getId();
				Member mem = subPageService.queryId(id);
				sponInfo.put("id", id);
				sponInfo.put("name", mem.getName());
				sponInfo.put("contact", mem.getContact());
				sponInfo.put("email", mem.getEmail());
				sponInfo.put("sponAmount", spon.getSponsorAmount());
				sponsorList.add(sponInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sponsorList;
	}
	
	//환불 예외처리
	@ResponseBody
	@PostMapping(value="refund")
	public void refund(@RequestParam(value="fundingNo") int fundingNo, Model model) {
		try {
			fundingService.fundingRefund(fundingNo);
			fundingService.fundingSponRefund(fundingNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
			

	
	
	
}