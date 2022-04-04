package com.mulcam.artista.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.ArtistPageService;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.FundingService;
import com.mulcam.artista.service.SubPageService;
import com.mulcam.artista.service.WorkService;

@RequestMapping("artistpage")
@Controller
public class ArtistPageController {
	
	@Autowired
	FundingService fundingService;
	
	@Autowired
	SubPageService subPageService;
	
	@Autowired
	ArtistPageService artistPageService;
	
	@Autowired
	WorkService workService;
	
	@Autowired
	ArtistService artistService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;

	// 아티스트의 작품
	@GetMapping({"", "/", "mywork"})
	public String artistpageMain() {
		return "artistpage/mywork";
	}
	@GetMapping("enrollwork")
	public String artistpageEnrollWork() {
		//String id=(String) session.getAttribute("id");
		return "artistpage/enrollwork";
	}
	@PostMapping("enrollworkComplete")
	public String enrollworkComplete(@ModelAttribute Work work, @RequestParam(value="workImgFile") MultipartFile artistImgFile) {
		
		String id=(String) session.getAttribute("id");	
		Integer artistNo = null;
		System.out.println(id);
		try {
			work.setWorkNo(workService.getWorkMaxId());
			artistNo = artistService.getArtistNo(id);
			System.out.println(artistNo);
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		
		/* 작품 대표이미지 저장 */
		String path = servletContext.getRealPath("/imgupload/artistWorks/");
		String[] mtypes = artistImgFile.getContentType().split("/");
		
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHm");
		Date time = new Date();
		String workEnrollTime = simpleDate.format(time);
		System.out.println(workEnrollTime);
		File destFile = new File(path + artistNo +"-"+ workEnrollTime +"."+ mtypes[1]);
		try {			
			artistImgFile.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String workImg = work.getArtistNo() + "-" + workEnrollTime +"."+ mtypes[1];
		work.setArtistNo(artistNo);
		work.setWorkImg(workImg);
		work.setWorkForSale(false); //판매용 아님
		
		// 작품 등록
		try {
			workService.insertWork(work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "artistpage/succesapply";
	}
	
	// 아티스트의 작품 판매
	@GetMapping("myproduct")
	public String artistpageProduct() {
		return "artistpage/myproduct";
	}
	@GetMapping("applyproduct")
	public String artistpageEnrollProduct() {
		return "artistpage/applyproduct";
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
	
	//펀딩 신청
		@GetMapping("applyfunding")
		public String applyfunding(Model model) {
			String id=(String) session.getAttribute("id");
			try {
				Member mem = subPageService.queryId(id);
				model.addAttribute("mem", mem);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "artistpage/applyfunding";
		}
		
		
		//비교해서 가지고 가야 된다 무조건 넣으면 안 됨
		//현재의 문제점은 지금 모든 걸 다 업데이트 하고 있음
		//artistNo을 그냥 빈 칸으로 넣고 나중에 고치기
		@PostMapping("applyfunding")
		public String applyfunding1(@ModelAttribute Funding funding, Model model) {
			String path = servletContext.getRealPath("/fundingApp/");
			String id=(String) session.getAttribute("id");
//			 File destFile = new File(path+file.getOriginalFilename());
			try {
				artistPageService.insertApply(funding);
//				Integer artistNo = artistService.getArtistNo(id);
//				System.out.println(artistNo);
//				if(id.equals(id)) {
//					artistService.updateArtistNo(artistNo, id);
//				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "artistpage/succesapply";
		}

		
		@ResponseBody
		@PostMapping("fundingApp")
		public Map<String, Object> fileupload(@RequestParam(value="fundingApp") MultipartFile file) {
			System.out.println(file.getOriginalFilename()+"---------------------");
			String path = servletContext.getRealPath("/fundingApp/");
			String filename = file.getOriginalFilename();
			File destFile = new File(path+filename);
			Map<String, Object> json = new HashMap<>();
			try {
				file.transferTo(destFile);
				json.put("uploaded", 1);
				json.put("fileName", filename);
				json.put("url", "/fileview/"+filename);
			} catch(IOException e) {
				e.printStackTrace();
			} 
			return json;
		}
		
		
		@GetMapping("modifyfunding")
		public String modifyfunding(Model model) {
			String id=(String) session.getAttribute("id");
			try {
				Member mem = subPageService.queryId(id);
				model.addAttribute("mem", mem);
				Funding funding = fundingService.queryFunding(id);
				model.addAttribute("funding", funding);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "artistpage/modifyfunding";
		}
		
		
		@RequestMapping(value="modifyfunding", method= {RequestMethod.POST})
		public String modifyfunding2(@ModelAttribute Funding funding) {
			String path = servletContext.getRealPath("/fundingApp/");
			String id=(String) session.getAttribute("id");
			funding.setId(id);
			System.out.println(id);
			try {			
				System.out.println(funding.getId());
				artistPageService.updatefundingapp(funding);				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "artistpage/succesapply";
		}
	
	

	
	// 아티스트의 전시
	@GetMapping("myexhibition")
	public String artistpageExhibition() {
		return "artistpage/myexhibition";
	}
	@GetMapping("applyexhibition")
	public String artistpageEnrollExhibition() {
		return "artistpage/applyexhibition";
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