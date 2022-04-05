package com.mulcam.artista.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Artist;

@Mapper
@Repository
public interface ArtistDAO {
	public Integer maxArtistNo() throws Exception;
	public void insertArtist(Artist artist) throws Exception;
	public Integer selectArtistNo(String id) throws Exception;
	public String selectArtistName(String id) throws Exception;
	
}
