package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistWorld;

public interface ArtistWorldService {
	 int getArtistWorldId() throws Exception;
	 void insertArtistWorldFile(ArtistWorld worldImg) throws Exception;
	 List<ArtistWorld> getArtistWorlds(String id) throws Exception;
	 
	 
	 public ArtistWorld worlds(String id) throws Exception;
}
