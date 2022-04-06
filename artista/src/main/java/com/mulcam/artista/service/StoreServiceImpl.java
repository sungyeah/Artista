package com.mulcam.artista.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.StoreDAO;
import com.mulcam.artista.dto.Work;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDAO storeDAO;
	
	@Override
	public List<Work> workList() throws Exception {
		return storeDAO.workList();
	}

}
