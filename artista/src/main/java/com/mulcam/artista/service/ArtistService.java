package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.PageInfo;

public interface ArtistService {
	public void insertArtist(Artist artist) throws Exception;
	public void updateArtist(Artist artist) throws Exception;
	public void deleteArtist(int artistNo) throws Exception;
	public int getArtistMaxId() throws Exception;
	public Integer getArtistNo(String id) throws Exception;
	public String getArtistName(String id) throws Exception;
	
	public List<Artist> artistList(int page, PageInfo pageInfo) throws Exception;
	public Artist selectArtistByNo(int artistNo) throws Exception;
	public ArtistWorld selectArtistWorldById(String id) throws Exception;
	
	List<Artist> artists() throws Exception;
	public Artist Artistinfo(int artistNo) throws Exception;
	Artist artistInfo(String id) throws Exception;
	public Artist Artistmain() throws Exception;	// 메인화면 아티스트 정보
	
}
