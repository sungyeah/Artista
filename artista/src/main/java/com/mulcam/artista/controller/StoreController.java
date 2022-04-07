package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@GetMapping("storelist")
	public String storelist(Model model	) {
//		try {
//			List<Work> work = storeService.workList();
//			model.addAttribute("works",work);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return "store/storelist";
	}
	
	@GetMapping("storedetail/{workNo}")
	public String storedetail(@PathVariable int workNo) {
		return "store/storedetail";
	}
}
