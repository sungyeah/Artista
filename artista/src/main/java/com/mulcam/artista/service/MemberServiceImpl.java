package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.mulcam.artista.dao.MemberDAO;

public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;
}
