package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.PageInfo;

public interface ArtistService {
	public void insertArtist(Artist artist) throws Exception;
	public int getArtistMaxId() throws Exception;
	public Integer getArtistNo(String id) throws Exception;
	public String getArtistName(String id) throws Exception;
	
	public List<Artist> artistList(int page, PageInfo pageInfo) throws Exception;
	public Artist selectArtistByNo(int artistNo) throws Exception;
	
	List<Artist> artists() throws Exception;
}
