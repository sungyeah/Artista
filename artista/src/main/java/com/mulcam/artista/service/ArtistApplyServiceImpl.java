package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.ArtistApplyDAO;
import com.mulcam.artista.dto.ArtistApply;

@Service
public class ArtistApplyServiceImpl implements ArtistApplyService {
	@Autowired
	ArtistApplyDAO artistapplyDAO;
	
	@Override
	public int getApplyArtistId() throws Exception {
		Integer id = artistapplyDAO.maxApplyId();
		if(id==null) id = 0;
		return id+1;
	}
	
	@Override
	public void insertArtistApply(ArtistApply artistApply) throws Exception {
		artistapplyDAO.insertArtistApply(artistApply);
	}
	
}
