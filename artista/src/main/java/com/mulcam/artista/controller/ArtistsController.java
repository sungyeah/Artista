package com.mulcam.artista.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mulcam.artista.service.WorkApplyService;

@RequestMapping("artistpage")
@Controller
public class ArtistsController {
	
	@Autowired
	WorkApplyService workapplyService;
	
	
}
