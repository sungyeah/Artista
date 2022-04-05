package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.ArtistApply;

@Mapper
@Repository
public interface ArtistApplyDAO {
	
	public Integer maxApplyId() throws Exception;
	public void insertArtistApply(ArtistApply artistApply) throws Exception;
	
	public ArtistApply selectArtistApplyByNo(int applyNo) throws Exception;
	public int ArtistApplyNum() throws Exception;
	public List<ArtistApply> selectArtistApplyList(int startrow) throws Exception; 	//select 아티스트 신청 리스트
	
	public void deleteArtistApplyById(int applyNo);
	public void updateRefuseResults(Map map)throws Exception;


	/*public Integer getFileId() throws Exception;
	public void insertFile(ArtistWorld worldImg) throws Exception;
	public List<ArtistWorld> artistWorld(String id) throws Exception;*/
}
