package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.StoreService;
import com.mulcam.artista.service.WorkApplyService;
import com.mulcam.artista.service.WorkService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	WorkService workService;
	
	@GetMapping("storelist")
	public String storelist(Model model	) {
		try {
			List<Work> work = storeService.workList();
			model.addAttribute("works",work);
			
			for (int i = 0; i< work.size(); i++) {
				int height = 0;
				if (i < 4) {
					height = work.get(i).getWorkHeight();
				} else {
					height = work.get(i-4).getWorkHeight() + work.get(i).getWorkHeight();
				}
				work.get(i).setWorkPrice(height);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "store/storelist";
	}
	
	@GetMapping("storelist2")
	public String storelist2(Model model) {
		try {
			List<Work> work = storeService.workList();
			model.addAttribute("works",work);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "store/storelist2";
	}
	
	@GetMapping("storedetail")
	public String storedetail() {
		return "store/storedetail";
	}
	
	@GetMapping("storedetail/{workNo}")
	public String storedetail(@PathVariable int workNo,Model model) {
		try {
			Work work = workService.workinfo(workNo);
			model.addAttribute("work", work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "store/storedetail";
	}
}
