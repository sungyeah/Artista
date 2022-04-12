package com.mulcam.artista.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.Work;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.ArtistWorldService;
import com.mulcam.artista.service.SubPageService;
import com.mulcam.artista.service.WorkService;

@Controller
public class ArtistsController {
	
	@Autowired
	ArtistService artistservice;
	
	@Autowired
	ArtistWorldService artistworldservice;
	
	@Autowired
	WorkService workserivce;
	
	@Autowired
	SubPageService subPageService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("artistslist")
	public String artistslist(Model model) {
//		System.out.println(id);
		try {
			List<Artist> Artistlist = artistservice.artists();
			List<String> ImgNames = new ArrayList<String>();
			for(int i=0;i<Artistlist.size();i++) {
				Artist artist=Artistlist.get(i);
				String id=artist.getId();
				ArtistWorld artistworld = artistworldservice.worlds(id);
				System.out.println(artistworld);
				String ImgName = artistworld.getImgName();
				ImgNames.add(ImgName);
			}
			model.addAttribute("atistList", Artistlist);
			model.addAttribute("ImgNames", ImgNames);
			System.out.println(Artistlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "artists/artistslist";
	}
	
	@GetMapping("artistdetail/{artistNo}")
	public String artistdetail(@PathVariable int artistNo, Model model) {
		String id2 = (String) session.getAttribute("id");
		try {
			List<Work> WorkList = workserivce.works(artistNo);
			Artist artist = artistservice.Artistinfo(artistNo);
			String id = artist.getId();
			ArtistWorld artistworld = artistworldservice.worlds(id);
			String Img = artistworld.getImgName();
			int follower = subPageService.followercnt(artist.getId());
			int following = subPageService.followingcnt(artist.getId());
			boolean check=subPageService.checkFollow(id, id2);
			model.addAttribute("following", following);
			model.addAttribute("follower", follower);
			model.addAttribute("check", check);
			model.addAttribute("Img", Img);
			model.addAttribute("artist", artist);
			model.addAttribute("worklist", WorkList);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "artists/artistdetail";
	}
}
