package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.PageInfo;

public interface ArtistApplyService {
	
	public int getApplyArtistNo() throws Exception;
	public void insertArtistApply(ArtistApply artistApply) throws Exception;
	
	public ArtistApply selectArtistApplyByNo(int applyNo) throws Exception;
	public List<ArtistApply> getArtistApplyList(int page, PageInfo pageInfo) throws Exception;
	
	public void deleteArtistApplyById(int applyNo) throws Exception;
	public void refuseArtistApply(int applyNo, String refusedContents) throws Exception;	// 일반회원->아티스트변경
	public void deleteArtistWorld(String artistId) throws Exception;
	
	public List<ArtistWorld> selectArtistWorldApplyByNo(String id) throws Exception;
	
}
