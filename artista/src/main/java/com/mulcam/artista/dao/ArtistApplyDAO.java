package com.mulcam.artista.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.ArtistApply;

@Mapper
@Repository
public interface ArtistApplyDAO {
	
	public Integer maxApplyId() throws Exception;
	public void insertArtistApply(ArtistApply artistApply) throws Exception;
	/*public Integer getFileId() throws Exception;
	public void insertFile(ArtistWorld worldImg) throws Exception;
	public List<ArtistWorld> artistWorld(String id) throws Exception;*/
}
