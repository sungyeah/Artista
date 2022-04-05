package com.mulcam.artista.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Funding;

@Mapper
@Repository
public interface FundingDAO {
	public void insertApply(Funding funding) throws Exception; //작가가 펀딩 신청
	public Funding queryFunding(String id);
	public void updatefundingapp(Funding funding);
	public void insertupdate(Funding funding);
	public void updateapplyStatus(Funding funding);
	public void insertfunding(Funding funding); //펀딩 등록
	public void updatefundingState(int fundingState);
}
