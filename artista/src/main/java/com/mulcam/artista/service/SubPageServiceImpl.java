package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.mulcam.artista.dao.SubPageDAO;

public class SubPageServiceImpl implements SubPageService{
	
	@Autowired
	SubPageDAO subpageDAO;

}
