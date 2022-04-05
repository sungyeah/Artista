package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.WorkDAO;
import com.mulcam.artista.dto.Work;

@Service
public class WorkServiceImpl implements WorkService {
	@Autowired
	WorkDAO workDAO;

	@Override
	public void insertWork(Work work) throws Exception {
		workDAO.insertWork(work);
	}

	@Override
	public int getWorkMaxNo() throws Exception {
		Integer id = workDAO.maxWorkNo();
		if(id==null) id=0;
		return id+1;
	}
}
