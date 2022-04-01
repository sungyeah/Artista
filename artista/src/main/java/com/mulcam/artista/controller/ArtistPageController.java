package com.mulcam.artista.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.service.ArtistPageServiceImpl;
import com.mulcam.artista.service.SubPageServiceImpl;

@RequestMapping("artistpage")
@Controller
public class ArtistPageController {
	
	@Autowired
	SubPageServiceImpl subPageService;
	
	@Autowired
	ArtistPageServiceImpl artistPageService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;

	// 아티스트의 작품
	@GetMapping({"", "/", "artistpage/mywork"})
	public String artistpageMain() {
		return "artistpage/mywork";
	}
	@GetMapping("artistpage/enrollwork")
	public String artistpageEnrollWork() {
		return "artistpage/enrollwork";
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
		
		@PostMapping("applyfunding")
		public String applyfunding1(@ModelAttribute Funding funding, Model model) {
			String path = servletContext.getRealPath("/fundingApp/");
//			 File destFile = new File(path+file.getOriginalFilename());
			try {
				artistPageService.insertApply(funding);
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
		public String modifyfunding(@ModelAttribute Funding funding, Model model) {
			String id=(String) session.getAttribute("id");
			try {
				Member mem = subPageService.queryId(id);
				model.addAttribute("mem", mem);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "artistpage/modifyfunding";
		}
		
		@PostMapping("modifyfunding")
		public String modifyfunding2(@ModelAttribute Funding funding, Model model) {
			String path = servletContext.getRealPath("/fundingApp/");
//			 File destFile = new File(path+file.getOriginalFilename());
			try {
				artistPageService.insertApply(funding);
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
