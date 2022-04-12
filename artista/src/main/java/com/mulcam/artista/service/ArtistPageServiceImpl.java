package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.FundingDAO;
import com.mulcam.artista.dto.Funding;

@Service
public class ArtistPageServiceImpl implements ArtistPageService {
	
	@Autowired
	FundingDAO fundingDAO;

	@Override
	public void insertApply(Funding funding) throws Exception {
		System.out.println(funding.getStartDate());
		System.out.println(funding.getEndDate());
		fundingDAO.insertApply(funding);		
	}

	@Override
	public void modifyApply(Funding funding) {
		// TODO Auto-generated method stub
		fundingDAO.modifyApply(funding);
	}

	@Override
	public void updateapplyStatus(Funding funding) {
		fundingDAO.updateapplyStatus(funding);
		
	}

	@Override
	public void updatefundingapp(Funding funding) {
		fundingDAO.updatefundingapp(funding);
		
	}

}
