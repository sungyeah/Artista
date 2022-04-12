package com.mulcam.artista.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.ArtistWorld;

@Mapper
@Repository
public interface ArtistWorldDAO {
	public Integer getFileId() throws Exception;
	public void insertFile(ArtistWorld worldImg) throws Exception;
	public List<ArtistWorld> artistWorld(String id) throws Exception;
	public void deleteArtistWorld(String artistId) throws Exception;
	/* public List<ArtistWorld> Wlds() throws Exception; */
	public ArtistWorld worlds(String id) throws Exception;
}
