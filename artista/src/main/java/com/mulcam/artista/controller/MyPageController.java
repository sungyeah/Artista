package com.mulcam.artista.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Member;
import com.mulcam.artista.service.SubPageServiceImpl;

@RequestMapping("mypage")
@Controller
public class MyPageController {
	
	@Autowired
	SubPageServiceImpl subPageService;
	
	@Autowired
	HttpSession session;

//	@GetMapping({"/", ""})
//	public String mypageMain(@RequestParam("check") String check,  Model model) {
//		String id = (String) session.getAttribute("id");
//		try {
//			Member mem = subPageService.queryId(id);
//			model.addAttribute("check", check);
//			model.addAttribute("name",mem.getName());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "mypage/mypage";
//	}
	
	@GetMapping({"/", ""})
	public String mypageMain(Model model) {
		String id = (String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
//			model.addAttribute("check", check);
			model.addAttribute("name",mem.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mypage/mypage";
	}
	
	/* 예선 : 작가등록 신청 */
	@GetMapping("apply")
	public String mypageApplyArtist() {
		return "mypage/apply";
	}
	
	@GetMapping("mypagemodify")
	public String mypagemodify() {
		return "mypage/mypagemodify";
	}
	@GetMapping("paymentinfo")
	public String paymentinfo() {
		return "mypage/paymentinfo";
	}
}
