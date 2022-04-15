package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.ArtistApplyDAO;
import com.mulcam.artista.dao.ArtistWorldDAO;
import com.mulcam.artista.dto.ArtistApply;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.PageInfo;

@Service
public class ArtistApplyServiceImpl implements ArtistApplyService {
	@Autowired
	ArtistApplyDAO artistapplyDAO;
	
	@Autowired
	ArtistWorldDAO artistworldDAO;
	
	@Override
	public int getApplyArtistNo() throws Exception {
		Integer id = artistapplyDAO.maxApplyNo();
		if(id==null) id = 0;
		return id+1;
	}
	
	@Override
	public void insertArtistApply(ArtistApply artistApply) throws Exception {
		artistapplyDAO.insertArtistApply(artistApply);
	}
	
	@Override
	public void insertArtistModify(ArtistApply artistApply) throws Exception{
		artistapplyDAO.insertArtistModify(artistApply);
	}

	@Override
	public List<ArtistApply> getArtistApplyList() throws Exception {
		return artistapplyDAO.selectArtistApplyList();
	}

	@Override
	public ArtistApply selectArtistApplyByNo(int applyNo) throws Exception {
		return artistapplyDAO.selectArtistApplyByNo(applyNo);
	}
	
	@Override
	public void deleteArtistApplyById(int applyNo) throws Exception {
		artistapplyDAO.deleteArtistApplyById(applyNo);
	}

	@Override
	public void refuseArtistApply(int applyNo, String refusedContents) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("applyNo", applyNo);
		map.put("refusedContents", refusedContents);
		artistapplyDAO.updateRefuseResults(map);
	}
	
	@Override
	public void deleteArtistWorld(String artistId) throws Exception{
		artistworldDAO.deleteArtistWorld(artistId);
	}
	
	@Override
	public ArtistWorld selectArtistWorldApplyByNo(String id) throws Exception {
		return artistworldDAO.artistWorld(id);
	}

	@Override
	public boolean checkArtistWorld(String id) throws Exception {
		return artistworldDAO.checkArtistWorld(id);
	}
	
}
