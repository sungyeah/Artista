package com.mulcam.artista.service;

import com.mulcam.artista.dto.Artist;

public interface ArtistService {
	public void insertArtist(Artist artist) throws Exception;
	public int getArtistMaxId() throws Exception;
	public Integer getArtistNo(String id) throws Exception;
}
