package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Fundingspon;

@Mapper
@Repository
public interface FundingDAO {
	public void insertApply(Funding funding) throws Exception; //작가가 펀딩 신청
	public Funding queryFunding(String id);
	public List<Funding> queryMyFunding(String id);
	public List<Funding> queryappfunding(String id);
	public void updatefundingapp(Funding funding);
	public void modifyApply(Funding funding);
	public void updateapplyStatus(Funding funding);
	public void insertfunding(Funding funding); //펀딩 등록
	public List<Funding> queryuc(Map map);
	public List<Funding> queryov(Map map);
	public List<Funding> querytm(Map map);
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
	public void updateFundingApplyEnroll(int fundingNo) throws Exception;
	public void updateFundingApplyModifyEnroll(int fundingNo) throws Exception;
	public void updateFundingApplyRefuse(Map map)throws Exception;
	public void deleteFundingApply(int applyNo) throws Exception;
	public void updateFundingModiy(Funding funding) throws Exception;
	
	
	public Integer maxfundingNo() throws Exception;
	public Integer maxfundingAppNo() throws Exception;
	public int queryCount(int fundingNo);
	public List<Funding> querysponlist(String id);
	public List<Fundingspon> sponList(int fundingNo)throws Exception;
	public Integer getSumAmount(int fundingNo);
	public Integer getSponAmount(Map map);
	public int updateSumAmount(Map map);
	
	public Integer alarmCheck(Map map) throws Exception;
	public void fundingRefund(int fundingNo);
	public void fundingSponRefund(int fundingNo);
	public int fundingovCnt();
	public int fundingtmCnt();
	public int fundingucCnt();
	public List<Funding> queryovMain(Funding funding);

}
