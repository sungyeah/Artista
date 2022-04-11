package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Funding;

@Mapper
@Repository
public interface FundingDAO {
	public void insertApply(Funding funding) throws Exception; //작가가 펀딩 신청
	public Funding queryFunding(String id);
	public List<Funding> queryMyFunding(String id);
	public List<Funding> queryappfunding(String id);
	public void updatefundingapp(Funding funding);
	public void insertupdate(Funding funding);
	public void updateapplyStatus(Funding funding);
	public void insertfunding(Funding funding); //펀딩 등록
	public List<Funding> queryuc(Funding funding);
	public List<Funding> queryov(Funding funding);
	public List<Funding> querytm(Funding funding);
	public Funding queryovdetail(int fundingNo);
	public Funding queryucdetail(int fundingNo);
	public Funding querytmdetail(int fundingNo);
	public void insertfundingspon(Map map);
	public Funding queryFundingNo(int fundingNo);
	public int querySponCount(int fundingNo);
	public boolean checkAlarm(Map map);
	public void deleteAlarm(String id);
	public void insertAlarm(Map map);
}
