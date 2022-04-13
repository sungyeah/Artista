package com.mulcam.artista.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.FundingDAO;
import com.mulcam.artista.dto.Funding;

@Service
public class FundingServiceImpl implements FundingService {
	@Autowired
	FundingDAO fundingDAO;
	
	@Override
	public Funding queryFunding(String id) {
		// TODO Auto-generated method stub
		return fundingDAO.queryFunding(id);
	}
	
	@Override
	public List<Funding> queryMyFunding(String id) {
		// TODO Auto-generated method stub
		return fundingDAO.queryMyFunding(id);
	}

	@Override
	public void insertfunding(Funding funding) {
		fundingDAO.insertfunding(funding);
		
	}
	
	@Override
	public List<Funding> queryuc(Funding funding) {
		// TODO Auto-generated method stub
		return fundingDAO.queryuc(funding);
	}

	@Override
	public List<Funding> queryov(Funding funding) {
		// TODO Auto-generated method stub
		return fundingDAO.queryov(funding);
	}

	@Override
	public List<Funding> querytm(Funding funding) {
		// TODO Auto-generated method stub
		return fundingDAO.querytm(funding);
	}

	@Override
	public Funding queryovdetail(int fundingNo) {
		// TODO Auto-generated method stub
		return fundingDAO.queryovdetail(fundingNo);
	}

	@Override
	public Funding queryucdetail(int fundingNo) {
		// TODO Auto-generated method stub
		return fundingDAO.queryucdetail(fundingNo);
	}

	@Override
	public Funding querytmdetail(int fundingNo) {
		// TODO Auto-generated method stub
		return fundingDAO.querytmdetail(fundingNo);
	}

	@Override
	public List<Funding> queryappfunding(String id) {
		// TODO Auto-generated method stub
		return fundingDAO.queryappfunding(id);
	}
	
	//
	@Override
	public void insertfundingspon(int sponsorAmount,int fundingNo,String email,String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("sponsorAmount", sponsorAmount);
		map.put("fundingNo", fundingNo);
		map.put("email", email);
		map.put("id", id);
		fundingDAO.insertfundingspon(map);
	}

	@Override
	public Funding queryFundingNo(int fundingNo) {
		// TODO Auto-generated method stub
		return fundingDAO.queryFundingNo(fundingNo);
	}

	@Override
	public int querySponCount(int fundingNo) {
		// TODO Auto-generated method stub
		return fundingDAO.querySponCount(fundingNo);
	}

	@Override
	public boolean checkAlarm(int fundingNo, String id) {
		Map <String, Object> map = new HashMap<>();
		map.put("fundingNo", fundingNo);
		map.put("id", id);
		return fundingDAO.checkAlarm(map);
	}

	@Override
	public void deleteAlarm(int fundingNo, String id) {
		Map <String, Object> map = new HashMap<>();
		map.put("fundingNo", fundingNo);
		map.put("id", id);
		fundingDAO.deleteAlarm(map);
		
	}

	@Override
	public void insertAlarm(int fundingNo, String id) {
		Map <String, Object> map = new HashMap<>();
		map.put("fundingNo", fundingNo);
		map.put("id", id);
		fundingDAO.insertAlarm(map);
	}

	@Override
	public List<Funding> fundingAppList() throws Exception {
		return fundingDAO.fundingAppList();
	}

	@Override
	public List<Funding> fundingExpectList() throws Exception {
		return fundingDAO.fundingExpectList();
	}

	@Override
	public List<Funding> fundingNowList() throws Exception {
		return fundingDAO.fundingNowList();
	}

	@Override
	public List<Funding> fundingEndedList() throws Exception {
		return fundingDAO.fundingEndedList();
	}

	@Override
	public Funding querytfundingApp(int fundingNo) throws Exception {
		
		return fundingDAO.querytfundingApp(fundingNo);
	}

	@Override
	public int getfundingNo() throws Exception {
		Integer id = fundingDAO.maxfundingNo();
		if(id==null) id = 0;
		return id+1;
	}
	@Override
	public int 	getfundingAppNo() throws Exception {
		Integer id = fundingDAO.maxfundingAppNo();
		if(id==null) id = 0;
		return id+1;
	}
	
	//sumamount, sponamount
//	@Override
//	public int 	getfundingAppNo() throws Exception {
//		Integer id = fundingDAO.maxfundingAppNo();
//		if(id==null) id = 0;
//		return id+1;
//	}

	@Override
	public void deleteFundingApply(int applyNo) throws Exception {
		fundingDAO.deleteFundingApply(applyNo);
	}

	@Override
	public void refuseFundingApply(int fundingNo, String refusedContents) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("fundingNo", fundingNo);
		map.put("refusedContents", refusedContents);
		fundingDAO.updateFundingApplyRefuse(map);
	}

	@Override
	public void updateFundingApplyEnroll(int fundingNo) throws Exception {
		fundingDAO.updateFundingApplyEnroll(fundingNo);
	}

	@Override
	public void updateFundingApplyModifyEnroll(int fundingNo) throws Exception {
		fundingDAO.updateFundingApplyModifyEnroll(fundingNo);
	}

	@Override
	public void updateFundingModiy(Funding funding) throws Exception {
		fundingDAO.updateFundingModiy(funding);
	}
	@Override
	public List<Funding> querysponlist(String id) {
		// TODO Auto-generated method stub
		return fundingDAO.querysponlist(id);
	}
}
