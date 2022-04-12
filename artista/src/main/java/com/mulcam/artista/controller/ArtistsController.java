package com.mulcam.artista.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.ArtistWorldService;

@Controller
public class ArtistsController {
	
	@Autowired
	ArtistService artistservice;
	
	@Autowired
	ArtistWorldService artistworldservice;
	
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
		try {
			Artist artist = artistservice.Artistinfo(artistNo);
			String id = artist.getId();
			ArtistWorld artistworld = artistworldservice.worlds(id);
			String Img = artistworld.getImgName();
			model.addAttribute("Img", Img);
			
			model.addAttribute("artist", artist);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "artists/artistdetail";
	}
}
