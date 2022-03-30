package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.mulcam.artista.dao.MyPageDAO;

public class MyPageServiceImpl implements MypageService{
	@Autowired
	MyPageDAO mypageDAO;

}
