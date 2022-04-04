package com.mulcam.artista.service;

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

}
