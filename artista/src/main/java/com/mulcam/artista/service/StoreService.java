package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.Work;

public interface StoreService {
	List<Work> workList()throws Exception;
	String artistName(int workNo) throws Exception;
	Artist artistInfo(String artistName)throws Exception;
}
