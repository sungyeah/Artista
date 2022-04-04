package com.mulcam.artista.service;

import com.mulcam.artista.dto.Funding;

public interface FundingService {

	public Funding queryFunding(String id);
	public void insertfunding(Funding funding); //펀딩 등록

}
