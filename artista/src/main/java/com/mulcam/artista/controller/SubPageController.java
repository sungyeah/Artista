package com.mulcam.artista.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.SubselectExpression;
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

	@PostMapping("login")
	public ModelAndView login(@RequestParam Map<String,String> info) {
		ModelAndView mv = new ModelAndView();
		try {
			String id=info.get("id");
			String password=info.get("password");
			if(subPageService.accessMember(id, password)) {
				session.setAttribute("id", id);
				mv.setViewName("redirect:/main");
			}else {
				mv.setViewName("login");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;   //나중에 메인으로 변경
	}
	
//	@ResponseBody
//	@PostMapping("login")
//	public boolean login(@RequestParam Map<String,String> info,Model model) {
//		boolean check = false;
//		try {
//			String id=info.get("id");
//			String password=info.get("password");
//			check = subPageService.accessMember(id, password);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return check;
//	}
	
//	@GetMapping("naverlogin")
//	public String naverlogin() {
//		return "login";
//	}
	
	@PostMapping("naverlogin")
	public ModelAndView naverlogincheck(@RequestParam (value="id")String id,@RequestParam (value="name")String name,
			@RequestParam (value="email")String email,Model model) {
		ModelAndView mv = new ModelAndView("redirect:/main");
		try {
			if(!subPageService.memoverlap(id)) {
				subPageService.makemember2(id,name,email);
			}
			session.setAttribute("id",id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@GetMapping("callback")
	public String callback(HttpSession session,Model model) {
		String id = (String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("name",mem.getName());
			session.setAttribute("id",id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("check","naver");
		
		return "main";
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
