package com.mulcam.artista.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.WorkApplyDAO;
import com.mulcam.artista.dto.WorkApply;


@Service
public class WorkApplyServiceImpl implements WorkApplyService {

	@Autowired
	WorkApplyDAO workapplyDAO;
	
	@Override
	public void insertWorkApply(WorkApply workapply) throws Exception {
		workapplyDAO.insertWorkApply(workapply);
	}

	@Override
	public int getWorkApplyMaxId() throws Exception {
		Integer id = workapplyDAO.maxWorkApplyId();
		if(id==null) id=0;
		return id+1;
	}

	@Override
	public void deleteWorkApply(int workapplyNo) throws Exception {
		workapplyDAO.deleteWorkApply(workapplyNo);		
	}
}
