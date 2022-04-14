package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Fundingspon;
import com.mulcam.artista.dto.PageInfo;

public interface FundingService {
	public Funding queryFunding(String id);
	public List<Funding> queryMyFunding(String id);
	public List<Funding> queryappfunding(String id);
	public List<Funding> querysponlist(String id);
	public void insertfunding(Funding funding); //펀딩 등록
	//펀딩 예정, 종료, 진행 검색
	public List<Funding> queryuc(Funding funding, int page, PageInfo pageInfo);
	public List<Funding> queryov(Funding funding, int page, PageInfo pageInfo);
	public List<Funding> querytm(Funding funding, int page, PageInfo pageInfo);
	public Funding queryovdetail(int fundingNo);
	public Funding queryucdetail(int fundingNo);
	public Funding querytmdetail(int fundingNo);
	public void insertfundingspon(int sponsorAmount,int fundingNo,String email,String id);
	public Funding queryFundingNo(int fundingNo);
	public int querySponCount(int fundingNo);
	boolean checkAlarm(int fundingNo, String id);
	public void deleteAlarm(int fundingNo, String id);
	public void insertAlarm(int fundingNo, String id);
	public int sumAmount(int fundingNo, String id, int sponsAmount);


	public List<Funding> fundingAppList()  throws Exception;//관리자 펀딩 신청리스트
	public List<Funding> fundingExpectList()  throws Exception;//관리자 펀딩 예정리스트
	public List<Funding> fundingNowList()  throws Exception;//관리자 펀딩 진행중리스트
	public List<Funding> fundingEndedList()  throws Exception;//관리자 펀딩 마감리스트
	public Funding querytfundingApp(int fundingNo)  throws Exception;
	public void updateFundingApplyEnroll(int fundingNo) throws Exception;
	public void updateFundingApplyModifyEnroll(int fundingNo) throws Exception;
	public void refuseFundingApply(int fundingNo, String refusedContents) throws Exception;
	public void deleteFundingApply(int applyNo)  throws Exception;
	public void updateFundingModiy(Funding funding) throws Exception;
	
	public int getfundingAppNo() throws Exception;
	public int getfundingNo() throws Exception;
	public List<Fundingspon> sponList(int fundingNo)throws Exception;
	public Integer alarmCheck(int fundingNo, String id) throws Exception;
	public void fundingRefund(int fundingNo);
	public void fundingSponRefund(int fundingNo);
//	public List<Funding> fundingovList(int fundingNo);
	public List<Funding> queryloadmoreov(int startrow, int endrow) throws Exception;
	public List<Funding> queryloadmoretm(int startrow, int endrow) throws Exception;
	public List<Funding> queryloadmoreuc(int startrow, int endrow) throws Exception;
	public List<Funding> queryovMain(Funding funding);

	
}

