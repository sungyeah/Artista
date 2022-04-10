package com.mulcam.artista.service;

import java.util.List;
import java.util.Map;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.Work;

public interface StoreService {
	List<Work> workList()throws Exception;
	String artistName(int workNo) throws Exception;
	Artist artistInfo(String artistName)throws Exception;
	String artistImg(int artistNo)throws Exception;
	void insertCart(Map cart)throws Exception;
	boolean checkCart(String id, String workName)throws Exception;
}
