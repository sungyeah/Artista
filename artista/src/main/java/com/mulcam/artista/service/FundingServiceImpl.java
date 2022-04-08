package com.mulcam.artista.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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

}
