package com.mulcam.artista.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.StoreService;
import com.mulcam.artista.service.SubPageService;
import com.mulcam.artista.service.WorkService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	WorkService workService;
	
	@Autowired
	SubPageService subPageService;
	
	@Autowired
	ArtistService artistService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("storelist")
	public String storelist(Model model	) {
		try {
			List<Work> work = storeService.workList();
			model.addAttribute("works",work);
			List<String> imgList = new ArrayList<String>();
			for (int i = 0; i< work.size(); i++) {
				int height = 0;
				if (i < 4) {
					height = work.get(i).getWorkHeight();
				} else {
					height = work.get(i-4).getWorkHeight() + work.get(i).getWorkHeight();
				}
				work.get(i).setWorkHeight(height);
			}
			for(int i=0;i<work.size();i++) {
				int artistNo=work.get(i).getArtistNo();
				String Img = storeService.artistImg(artistNo);
				imgList.add(Img);
			}
			model.addAttribute("img",imgList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "store/storelist";
	}
	
	@GetMapping("storedetail")
	public String storedetail() {
		return "store/storedetail";
	}
	
	@GetMapping("storedetail/{workNo}")
	public String storedetail(@PathVariable int workNo, Model model) {
		try {
			String id=(String) session.getAttribute("id");
			Work work = workService.workinfo(workNo);
			int artistNo = work.getArtistNo();
			Artist artist = artistService.Artistinfo(artistNo);
			int follower = subPageService.followercnt(artist.getId());
			int following = subPageService.followingcnt(artist.getId());
			String artistId= artist.getId();
			boolean check=subPageService.checkFollow(artistId, id);
			model.addAttribute("following", following);
			model.addAttribute("follower", follower);
			model.addAttribute("check", check);
			model.addAttribute("artist", artist);
			model.addAttribute("work", work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "store/storedetail";
	}
	
	@ResponseBody
	@PostMapping("addCart")
	public String addCart(@RequestBody Map<String, String> cart) {
		try {
			boolean check = storeService.checkCart(cart.get("id"), cart.get("workName"));
			if(check==true) {
				return "true";
			}else {
				storeService.insertCart(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}
}
