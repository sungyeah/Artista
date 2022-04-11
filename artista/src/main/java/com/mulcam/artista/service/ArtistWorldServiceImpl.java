package com.mulcam.artista.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.ArtistWorldDAO;
import com.mulcam.artista.dto.ArtistWorld;

@Service
public class ArtistWorldServiceImpl implements ArtistWorldService {

	@Autowired
	ArtistWorldDAO artistworldDAO;

	@Override
	public int getArtistWorldId() throws Exception {
		Integer id = artistworldDAO.getFileId();
		if(id==null) id = 0;
		return id+1;
	}

	@Override
	public void insertArtistWorldFile(ArtistWorld worldImg) throws Exception {
		artistworldDAO.insertFile(worldImg);
	}

	@Override
	public List<ArtistWorld> getArtistWorlds(String id) throws Exception {
		return artistworldDAO.artistWorld(id);
	}

	@Override
	public ArtistWorld worlds(int artistNo) throws Exception {
		return artistworldDAO.worlds(artistNo);
	}

	
}
