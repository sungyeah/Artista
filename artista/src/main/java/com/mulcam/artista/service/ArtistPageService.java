package com.mulcam.artista.service;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;


public interface ArtistPageService {
	public void insertApply(Funding funding) throws Exception; //작가가 펀딩 신청
	public void updatefundingapp(Funding funding); //작가 수정
	public void updateapplyStatus(Funding funding);
	
}
