package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.service.ExhibitService;


@Controller
public class ExhibitionController {
	
	@Autowired
	ExhibitService exhibitservice;
	
	
	@GetMapping("exhibition/{view}")
	public String exhibitionview(@PathVariable String view, Model model) {
		try {
			List<Exhibition> Exhibitlist = exhibitservice.exhibits(view);
		
			model.addAttribute("exhibitList", Exhibitlist);
			model.addAttribute("status", view);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exhibition/exhibitionview";
	}
	
//	
//	
//	@GetMapping("exhibitionview")
//	public String exhibitionview(Model model) {
//		try {
//			List<Exhibition> Exhibitlist = exhibitservice.exhibits("view");
//		
//			model.addAttribute("exhibitList", Exhibitlist);
//			model.addAttribute("status", "ing");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "exhibition/exhibitionview";
//	}
//	
//	@GetMapping("exhibitionup")
//	public String exhibitionup(Model model) {
//		try {
//			List<Exhibition> Exhibitlist = exhibitservice.exhibits("up");
//
//			model.addAttribute("exhibitList", Exhibitlist);
//			model.addAttribute("status", "will");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "exhibition/exhibitionview";
//	}
//	
//	@GetMapping("exhibitionterm")
//	public String exhibitionterm(Model model) {
//		try {
//			List<Exhibition> Exhibitlist = exhibitservice.exhibits("term");
//
////			List<Exhibition> ExhibitonTermlist = new ArrayList<>();
////			for(int i=0; i<Exhibitlist.size();i++) {
////				Date sd = Date.valueOf(Exhibitlist.get(i).getStartDate());
////				Date ed = Date.valueOf(Exhibitlist.get(i).getEndDate());
////				Date now = new Date(System.currentTimeMillis());
////				if (sd.before(now) && ed.before(now)) {
////					ExhibitonTermlist.add(Exhibitlist.get(i));
////				}
////			}
//			model.addAttribute("exhibitList", Exhibitlist);
//			model.addAttribute("status", "end");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "exhibition/exhibitionview";
//	}
}
