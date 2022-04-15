package com.mulcam.artista.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.PageInfo;
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
	
	@Value("${upload.filepath.ncloud}")
	private boolean bcloud;
	
	@Value("${upload.filepath}")
	private String filepath;
	
	@Value("${funupload.filepath}")
	private String funpath;

	// 펀딩 리스트
	@GetMapping("/fundinguc")
	public ModelAndView fundinguc(@ModelAttribute Funding funding,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("funding/fundinguc");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Funding> list = fundingService.queryuc(funding, page, pageInfo);
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("list", null);
		}

		return mv;
	}
	
	@ResponseBody
	@PostMapping("/loadFundinguc")
	public List<Funding> loadFundinguc(@RequestParam("startrow") int startrow, @RequestParam("endrow") int endrow) {
		List<Funding> list = new ArrayList<Funding>();
		try {
			list=fundingService.queryloadmoreuc(startrow, endrow);
			System.out.println(list.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 들어올때부터 버튼 설정
	@GetMapping("/fundingucdetail")
	public String fundingucdetail(@RequestParam("fundingNo") int fundingNo, Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		Funding funding = fundingService.queryucdetail(fundingNo);
		Integer alarm = fundingService.alarmCheck(fundingNo, id);
		model.addAttribute("funding", funding);
		model.addAttribute("alarm", alarm);
		int count = subPageService.queryCount(fundingNo);
		model.addAttribute("count", count);
		return "funding/fundingucdetail";
	}

	@ResponseBody
	@GetMapping("alarm")
	public Map<String, Object> alarm(@RequestParam(value = "fundingNo") int fundingNo) {
		String id = (String) session.getAttribute("id");
		System.out.println(fundingNo);
		Map<String, Object> json = new HashMap<>();
		boolean checkAlarm = false;
		int cnt = 0;
		try {
			if (fundingService.checkAlarm(fundingNo, id)) {
				fundingService.deleteAlarm(fundingNo, id);
				cnt = subPageService.queryCount(fundingNo);
				checkAlarm = false;
				json.put("checkAlarm", checkAlarm);
				json.put("cnt", cnt);
			} else {
				fundingService.insertAlarm(fundingNo, id);
				cnt = subPageService.queryCount(fundingNo);
				checkAlarm = true;
				json.put("checkAlarm", checkAlarm);
				json.put("cnt", cnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@PostMapping("/loadFundingov")
	public List<Funding> loadFundingov(@RequestParam("startrow") int startrow, @RequestParam("endrow") int endrow) {
		List<Funding> list = new ArrayList<Funding>();
		try {
			list=fundingService.queryloadmoreov(startrow, endrow);
			System.out.println(list.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

	@GetMapping("/fundingov")
	public ModelAndView fundingov(@ModelAttribute Funding funding,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("funding/fundingov");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Funding> list = fundingService.queryov(funding, page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("list", null);
		}
		return mv;
	}

	@GetMapping("/fundingovdetail")
	public String fundingovdetail(@RequestParam("fundingNo") int fundingNo, Model model) {
		Funding funding = fundingService.queryovdetail(fundingNo);
		System.out.println(fundingNo);
		int count = fundingService.querySponCount(fundingNo);
		model.addAttribute("funding", funding);
		model.addAttribute("count", count);
		return "funding/fundingovdetail";
	}

	@GetMapping("/fundingtm")
	public ModelAndView fundingtm(@ModelAttribute Funding funding,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("funding/fundingtm");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Funding> list = fundingService.querytm(funding, page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("list", null);
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/loadFundingtm")
	public List<Funding> loadFundingtm(@RequestParam("startrow") int startrow, @RequestParam("endrow") int endrow) {
		List<Funding> list = new ArrayList<Funding>();
		try {
			list=fundingService.queryloadmoretm(startrow, endrow);
			System.out.println(list.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@GetMapping("/fundingtmdetail")
	public String fundingtmdetail(@RequestParam("fundingNo") int fundingNo, Model model) {
		Funding funding = fundingService.querytmdetail(fundingNo);
		int count = fundingService.querySponCount(fundingNo);
		model.addAttribute("funding", funding);
		model.addAttribute("count", count);
		return "funding/fundingtmdetail";
	}

	// 펀딩 결제
	// 가격
	@PostMapping("/fundingpay")
	public String fundingpay(@RequestParam(value = "sponsorAmount") int sponsorAmount, Model model,
			@RequestParam(value = "fundingNo") int fundingNo) {
		String id = (String) session.getAttribute("id");
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
	public String fundingpay2(Model model, @RequestParam(value = "fundingNo") int fundingNo,
			@RequestParam(value = "sponsorAmount") int sponsorAmount) {
		String id = (String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			Funding funding = fundingService.queryFundingNo(fundingNo);
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

	// 완료페이지 action, post
	@PostMapping("/succesamount")
	public String succesamount(@RequestParam(value = "sponsorAmount") String sponsorAmount,
			@RequestParam(value = "fundingNo") int fundingNo, @RequestParam(value = "email") String email) {
		String id = (String) session.getAttribute("id");
		int sponsAmount = Integer.parseInt(sponsorAmount);
		fundingService.insertfundingspon(sponsAmount, fundingNo, email, id);
		fundingService.sumAmount(fundingNo, id, sponsAmount);
		// sumamount 서비스 만들고 더해서 넣기

		return "funding/succesamount";
	}

	@GetMapping("succesapply")
	public String succesapply() {
		return "funding/succesapply";
	}

	@GetMapping(value = "/thumbview/{filename}")
	public void fileview(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		if(bcloud) {
			path = funpath;
		} else {
			path = servletContext.getRealPath(funpath);
		}
		File file = new File(path + filename);
		String sfilename = null;
		FileInputStream fis = null;

		try {
			if (request.getHeader("User-Agent").indexOf("MSIE") > -1) {
				sfilename = URLEncoder.encode(file.getName(), "utf-8");
			} else {
				sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/octet-stream;charset=utf-8");
			// response.setHeader("Content-Disposition", "attachment;
			// filename=\""+sfilename+"\";");
			response.setHeader("Content-Disposition", "attachment; filename=" + sfilename);
			OutputStream out = response.getOutputStream();
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}
	}

}
