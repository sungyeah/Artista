package com.mulcam.artista.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.artista.dao.WorkDAO;
import com.mulcam.artista.dto.Cart;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.FundingService;
import com.mulcam.artista.service.MypageService;
import com.mulcam.artista.service.SubPageServiceImpl;
import com.mulcam.artista.service.WorkService;

@Controller
public class SubPageController {
	
	@Autowired
	SubPageServiceImpl subPageService;
	
	@Autowired
	MypageService myPageService;
	
	@Autowired
	WorkService workService;
	
	@Autowired
	FundingService fundingService;
	
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
				String membertype = subPageService.memTypeInfo(id);
				session.setAttribute("id", id);
				session.setAttribute("membertype", membertype);
				mv.setViewName("redirect:/main");
			}else {
				mv.setViewName("login");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;   //나중에 메인으로 변경
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("membertype");
		return "login";
	}
	
	@PostMapping("naverlogin")
	public String naverlogincheck(@RequestParam (value="id")String id,@RequestParam (value="name")String name,
			@RequestParam (value="email")String email,Model model) {
		try {
			System.out.println("네이버");
			if(!subPageService.memoverlap(id)) {
				subPageService.makemember2(id,name,email);
				String membertype = subPageService.memTypeInfo(id);
				session.setAttribute("membertype", membertype);
				session.setAttribute("id",id);
			}
			String membertype = subPageService.memTypeInfo(id);
			session.setAttribute("membertype", membertype);
			session.setAttribute("id",id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "main";
	}
	
	@GetMapping("callback")
	public String callback(Model model) {
		System.out.println("콜백이");
		model.addAttribute("check","naver");
		return "temp";
	}
	
	@GetMapping("join")
	public String joinForm() {
		return "join";
	}
	@PostMapping("join")
	public ModelAndView join(@ModelAttribute Member mem) {
		ModelAndView mv = new ModelAndView("redirect:/login");
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
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView("subpage/cart");
		String id = (String) session.getAttribute("id");
		try {
			List<Cart> carts = subPageService.cartList(id);
			mv.addObject("carts",carts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("delete")
	public void deleteCart(@RequestParam(value="no")int cartNo) {
		try {
			subPageService.deleteCart(cartNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/storedetail/payment")
	public String directpayment(@RequestParam(value="workNo")int workNo,Model model) {
		String id = (String) session.getAttribute("id");
		try {
			Member mem = subPageService.queryId(id);
			Work work = workService.workinfo(workNo);
			List<Work> workList = new ArrayList<>();
			workList.add(work);
			model.addAttribute("total",work.getWorkPrice());
			model.addAttribute("works",workList);
			model.addAttribute("mem",mem);
			model.addAttribute("count",1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "subpage/payment";
	}
	
	@PostMapping("/storedetail/paymentsuc")
	public String paymentsuc2(Order order,Model model) {
		try {
			subPageService.insertPayment(order);
			model.addAttribute("order",order);
			String str = order.getCartNo();
			String workNo = order.getWorkNo();
			String [] workNo2 = workNo.split(",");
			String[] cartNo = str.split(",");
			for(int i=0;i<cartNo.length;i++) {
				int cart = Integer.parseInt(cartNo[i]);
				subPageService.deleteCart(cart);
			}
			for(int i=0;i<workNo2.length;i++) {
				int work = Integer.parseInt(workNo2[i]);
				workService.updateSale(order.getOrderNo(), work);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "subpage/paymentsuc";
	}
	
	@PostMapping("payment")
	public String payment(@RequestParam(value="order_artwork") int[] workNo,Model model,
			@RequestParam(value="total")int total,@RequestParam(value="count")String count) {
		String id = (String) session.getAttribute("id");
		List<Work> works = new ArrayList<Work>();
		for( int i=0;i<workNo.length;i++) {
			int workNo2 = workNo[i];
			try {
				Work work = workService.workinfo(workNo2);
				works.add(work);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			Member mem = subPageService.queryId(id);
			model.addAttribute("mem",mem);
			model.addAttribute("works",works);
			model.addAttribute("total",total);
			model.addAttribute("count",count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "subpage/payment";
	}
//	@PostMapping("payment")
//	public String payment(@RequestParam(value="order_artwork") int[] cartNo,Model model,
//			@RequestParam(value="total")int total,@RequestParam(value="count")String count) {
//		String id = (String) session.getAttribute("id");
//		List<Cart> carts = new ArrayList<Cart>();
//		for( int i=0;i<cartNo.length;i++) {
//			int cartNo2 = cartNo[i];
//			try {
//				Cart cart = subPageService.cartInfo(cartNo2);
//				carts.add(cart);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		try {
//			Member mem = subPageService.queryId(id);
//			model.addAttribute("mem",mem);
//			model.addAttribute("carts",carts);
//			model.addAttribute("total",total);
//			model.addAttribute("count",count);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "subpage/payment";
//	}
	
	@ResponseBody
	@PostMapping("nocheck")
	public Integer nocheck() {
		Integer no = 0;
		try {
			no = subPageService.MaxOrderNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return no;
	}
	
	@GetMapping("paymentinfo/{orderNo}")
	public String paymentinfo(@PathVariable int orderNo,Model model) {
		try {
			Order order = myPageService.orderInfo(orderNo);
			model.addAttribute("order",order);
			String[] arr = order.getWorkNo().split(",");
			List<Work> wor = new ArrayList<Work>();
			for(int i=0;i<arr.length;i++) {
				int workno = Integer.parseInt(arr[i]);
				Work work = workService.workinfo(workno);
				wor.add(work);
			}
			model.addAttribute("works",wor);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "mypage/paymentinfo";
	}
//	@GetMapping("paymentsuc")
//	public String paymentsuc1() {
//		return "subpage/paymentsuc";
//	}
	@PostMapping("paymentsuc")
	public String paymentsuc(Order order,Model model) {
		try {
			subPageService.insertPayment(order);
			model.addAttribute("order",order);
			String str = order.getCartNo();
			String workNo = order.getWorkNo();
			String [] workNo2 = workNo.split(",");
			String[] cartNo = str.split(",");
			for(int i=0;i<cartNo.length;i++) {
				int cart = Integer.parseInt(cartNo[i]);
				subPageService.deleteCart(cart);
			}
			for(int i=0;i<workNo2.length;i++) {
				int work = Integer.parseInt(workNo2[i]);
				workService.updateSale(order.getOrderNo(), work);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "subpage/paymentsuc";
	}
	
	@ResponseBody
	@PostMapping("follow")
	public boolean follow(@RequestParam(value="follower")String follower) {
		String following = (String) session.getAttribute("id");
		boolean followcheck = false;
		try {
			if(subPageService.checkFollow(follower, following)) {
				subPageService.unfollow(follower, following);
				followcheck = false;
			}else {
				subPageService.follow(follower, following);
				followcheck = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return followcheck;
	}
}
