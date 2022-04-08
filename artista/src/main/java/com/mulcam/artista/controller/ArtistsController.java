package com.mulcam.artista.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.service.ArtistService;

@Controller
public class ArtistsController {
	
	@Autowired
	ArtistService artistservice;
	
	@GetMapping("artistslist")
	public String artistslist(Model model) throws Exception {
		List<Artist> Artistlist = artistservice.artists();
		try {
			model.addAttribute("atistList", Artistlist);
			System.out.println(Artistlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "artists/artistslist";
	}
	
	@GetMapping("artistdetail")
	public String artistdetail() {
		return "artists/artistsdetail";
	}
}
