package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.StoreDAO;
import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.Cart;
import com.mulcam.artista.dto.Work;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDAO storeDAO;
	
	@Override
	public List<Work> workList() throws Exception {
		return storeDAO.workList();
	}

	@Override
	public String artistName(int workNo) throws Exception {
		return storeDAO.artistName(workNo);
	}

	@Override
	public Artist artistInfo(String artistName) throws Exception {
		return storeDAO.artistInfo(artistName);
	}

	@Override
	public String artistImg(int artistNo) throws Exception {
		return storeDAO.artistImg(artistNo);
	}
	
	@Override
	public void insertCart(Map cart) throws Exception {
		storeDAO.insertCart(cart);
	}

	@Override
	public boolean checkCart(String id, String workName) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("workName", workName);
		return storeDAO.checkCart(map);
	}
}
