package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Funding;

public interface FundingService {
	public Funding queryFunding(String id);
	public List<Funding> queryMyFunding(String id);
	public List<Funding> queryappfunding(String id);
	public void insertfunding(Funding funding); //펀딩 등록
	//펀딩 예정, 종료, 진행 검색
	public List<Funding> queryuc(Funding funding);
	public List<Funding> queryov(Funding funding);
	public List<Funding> querytm(Funding funding);
	public Funding queryovdetail(int fundingNo);
	public Funding queryucdetail(int fundingNo);
	public Funding querytmdetail(int fundingNo);
}
