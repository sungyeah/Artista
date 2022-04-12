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
	public void deleteAlarm(Map map);
	public void insertAlarm(Map map);
	public List<Funding> queryAlarmlist(String id);
	
	public List<Funding> fundingAppList()  throws Exception;//관리자 펀딩 신청리스트
	public List<Funding> fundingExpectList()  throws Exception;//관리자 펀딩 예정리스트
	public List<Funding> fundingNowList()  throws Exception;//관리자 펀딩 진행중리스트
	public List<Funding> fundingEndedList()  throws Exception;//관리자 펀딩 마감리스트
	public Funding querytfundingApp(int fundingNo)  throws Exception;//관리자 펀딩신청 상세보기
	public void updateFundingApplyRefuse(Map map)throws Exception;
	public void deleteFundingApply(int applyNo) throws Exception;
	
	public Integer maxfundingNo() throws Exception;
	public Integer maxfundingAppNo() throws Exception;
}
