package com.mulcam.artista.service;

import com.mulcam.artista.dto.ArtistApply;

public interface ArtistApplyService {
	
	public int getApplyArtistId() throws Exception;
	public void insertArtistApply(ArtistApply artistApply) throws Exception;
	 
}
