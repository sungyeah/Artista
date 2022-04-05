package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.PageInfo;

public interface ArtistApplyService {
	
	public int getApplyArtistId() throws Exception;
	public void insertArtistApply(ArtistApply artistApply) throws Exception;
	
	public ArtistApply selectArtistApplyById(int applyNo) throws Exception;
	public List<ArtistApply> getArtistApplyList(int page, PageInfo pageInfo) throws Exception;
	
	public void deleteArtistApplyById(int applyNo) throws Exception;
	
}
