package com.mulcam.artista.dao;

import java.util.List;

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
	public int ArtistNum() throws Exception;
	public List<Artist> selectArtistList(int startrow) throws Exception;
	public Artist selectArtistByNo(int artistNo) throws Exception;
	
	public List<Artist> nameartist() throws Exception;

	public Artist artistinfo(int artistNo)throws Exception;

	public Artist artistInfo(String id)throws Exception;
	
	public Artist artistMain();	// 메인화면 아티스트 정보

}
