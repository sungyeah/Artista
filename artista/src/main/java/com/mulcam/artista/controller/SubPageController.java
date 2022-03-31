package com.mulcam.artista.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dto.Member;
import com.mulcam.artista.service.SubPageServiceImpl;

@Controller
public class SubPageController {
	
	@Autowired
	SubPageServiceImpl subPageService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("login")
	public String loginForm() {
		return "login";
	}
	@ResponseBody
	@PostMapping("login")
	public ModelAndView login(@RequestParam Map<String,String> info) {
		ModelAndView mv = new ModelAndView("mypage/mypage");
		try {
			String id=info.get("id");
			String password=info.get("password");
			if(subPageService.accessMember(id, password)) {
				session.setAttribute("id", id);
			}else {
				mv.setViewName("login");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;   //나중에 메인으로 변경
	}
	@GetMapping("naverlogin")
	public String naverlogin() {
		return "login";
	}
	
	@ResponseBody
	@PostMapping("naverlogin")
	public String naverlogincheck(@RequestParam (value="id")String id,@RequestParam (value="name")String name,
			@RequestParam (value="email")String email) {
		try {
			if(subPageService.memoverlap(id)) {
				session.setAttribute("id",id);
			}else {
				subPageService.makemember2(id,name,email);
				session.setAttribute("id",id);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return "login";
	}
	
	@GetMapping("callback")
	public String callback(HttpSession session) {
		return "mypage/mypage";
	}
	
	@GetMapping("join")
	public String joinForm() {
		return "join";
	}
	@PostMapping("join")
	public ModelAndView join(@ModelAttribute Member mem) {
		ModelAndView mv = new ModelAndView("login");
		System.out.println(mem);
		try {
			subPageService.makemember(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@ResponseBody
	@PostMapping("memidoverlap")
	public String memidoverlap(@RequestParam(value="id")String id) {
		boolean overlap=false;
		try {
			overlap=subPageService.memoverlap(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(overlap);
	}
	
	@GetMapping("cart")
	public String cart() {
		return "subpage/cart";
	}
	@GetMapping("payment")
	public String payment() {
		return "subpage/payment";
	}
	@GetMapping("paymentsuc")
	public String paymentsuc() {
		return "subpage/paymentsuc";
	}
}
