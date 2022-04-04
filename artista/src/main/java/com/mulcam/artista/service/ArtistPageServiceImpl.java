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
		fundingDAO.insertApply(funding);		
	}

	@Override
	public void updatefundingapp(Funding funding) {
		// TODO Auto-generated method stub
		fundingDAO.updatefundingapp(funding);
	}

	@Override
	public void updateapplyStatus(Funding funding) {
		fundingDAO.updateapplyStatus(funding);
		
	}

}
