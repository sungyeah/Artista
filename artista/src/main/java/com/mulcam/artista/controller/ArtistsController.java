package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.service.ArtistService;
import com.mulcam.artista.service.ArtistWorldService;

@Controller
public class ArtistsController {
	
	@Autowired
	ArtistService artistservice;
	
	@Autowired
	ArtistWorldService artistworldservice;
	
	@GetMapping("artistslist")
	public String artistslist(Model model) throws Exception {
		List<Artist> Artistlist = artistservice.artists();
		/* List<Worlds> Wldlist = artistworldservice.worlds(); */
		try {
			model.addAttribute("atistList", Artistlist);
			System.out.println(Artistlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "artists/artistslist";
	}
	
	@GetMapping("artistdetail/{artistNo}")
	public String artistdetail(@PathVariable int artistNo, Model model) throws Exception {
		try {
			Artist artist = artistservice.Artistinfo(artistNo);
			model.addAttribute("artist", artist);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "artists/artistdetail";
	}
}
