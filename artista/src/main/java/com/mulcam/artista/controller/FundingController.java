package com.mulcam.artista.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.service.FundingService;
import com.mulcam.artista.service.SubPageService;

@RequestMapping("funding")
@Controller
public class FundingController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	SubPageService subPageService;
	
	@Autowired
	FundingService fundingService;
	
	@Autowired
	private ServletContext servletContext;
	
	//펀딩 리스트
	@GetMapping("/fundinguc")
	public String fundinguc(@ModelAttribute Funding funding, Model model) {
		List<Funding> list=fundingService.queryuc(funding);
		model.addAttribute("list", list);
		return "funding/fundinguc";
	}
	
	@GetMapping("/fundingucdetail")
	public String fundingucdetail(@RequestParam("fundingNo") int fundingNo, Model model) {
		Funding funding=fundingService.queryucdetail(fundingNo);
		model.addAttribute("funding", funding);
		return "funding/fundingucdetail";
	}
	
	@ResponseBody
	@PostMapping("alarm")
	public boolean alarm(@RequestParam(value="fundingNo") int fundingNo) {
		String id = (String) session.getAttribute("id");
		System.out.println(fundingNo);
		boolean checkAlarm = false;
		try {
			if(fundingService.checkAlarm(fundingNo, id)) {
				fundingService.deleteAlarm(fundingNo, id);
				checkAlarm = false;
			}else {
				fundingService.insertAlarm(fundingNo, id);
				checkAlarm = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkAlarm;
	}
	
	@GetMapping("/fundingov")
	public String fundingov (@ModelAttribute Funding funding, Model model){
		List<Funding> list=fundingService.queryov(funding);
		model.addAttribute("list", list);
		return "funding/fundingov";
	}
	
	
	@GetMapping("/fundingovdetail")
	public String fundingovdetail(@RequestParam("fundingNo") int fundingNo, Model model) {
		Funding funding=fundingService.queryovdetail(fundingNo);
		System.out.println(fundingNo);
		int count = fundingService.querySponCount(fundingNo);
		model.addAttribute("funding", funding);
		model.addAttribute("count", count);
		return	"funding/fundingovdetail";
	}
	
	@GetMapping("/fundingtm")
	public String fundingtm(@ModelAttribute Funding funding, Model model) {
		List<Funding> list=fundingService.querytm(funding);
		System.out.println(list);
		model.addAttribute("list", list);
		return "funding/fundingtm";
	}
	
	@GetMapping("/fundingtmdetail")
	public String fundingtmdetail(@RequestParam("fundingNo") int fundingNo, Model model) {
		Funding funding=fundingService.querytmdetail(fundingNo);
		model.addAttribute("funding", funding);
		return "funding/fundingtmdetail";
	}
	
	
	//펀딩 결제
	//가격 
	@PostMapping("/fundingpay")
	public String fundingpay(@RequestParam(value="sponsorAmount") int sponsorAmount, Model model,
			@RequestParam(value="fundingNo") int fundingNo) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("mem", mem);
			model.addAttribute("sponsorAmount", sponsorAmount);
			model.addAttribute("fundingNo", fundingNo);
		} catch (Exception e) {
			e.printStackTrace();
		}		

		return "funding/fundingpay";
	}

	
	@PostMapping("/fundingpay2")
	public String fundingpay2(Model model, @RequestParam(value="fundingNo") int fundingNo, @RequestParam(value="sponsorAmount") int sponsorAmount) {
		String id=(String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			Funding funding=fundingService.queryFundingNo(fundingNo);
			model.addAttribute("mem", mem);
			model.addAttribute("funding", funding);
			System.out.println(funding);
			model.addAttribute("sponsorAmount", sponsorAmount);
			model.addAttribute("fundingNo", fundingNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "funding/fundingpay2";
	}
	
	
	//완료페이지 action, post
	@PostMapping("/succesamount")
	public String succesamount(@RequestParam(value="sponsorAmount")String sponsorAmount,
			@RequestParam(value="fundingNo")int fundingNo,@RequestParam(value="email")String email) {
		String id=(String) session.getAttribute("id");
		int sponsAmount = Integer.parseInt(sponsorAmount);
		fundingService.insertfundingspon(sponsAmount, fundingNo, email, id);
		return "funding/succesamount";
	}
	
	@GetMapping("succesapply")
	public String succesapply() {
		return "funding/succesapply";
	}
	
	@GetMapping(value="/thumbview/{filename}")
	public void fileview(@PathVariable String filename, 
			HttpServletRequest request, HttpServletResponse response)
	{
		String path = servletContext.getRealPath("/fundingApp/");
		File file = new File(path+filename);
		String sfilename = null;
		FileInputStream fis = null;
		
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename = URLEncoder.encode(file.getName(), "utf-8");
			} else {
				sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/octet-stream;charset=utf-8");
			//response.setHeader("Content-Disposition", "attachment; filename=\""+sfilename+"\";");
			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out = response.getOutputStream();
			fis= new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {}
			}
		}		
	}	
		
}

