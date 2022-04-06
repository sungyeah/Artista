package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public Work workinfo(int workNo) throws Exception {
		return workDAO.woriInfo(workNo);
	}

	@Override
	public List<Work> getWorkinfo(String workNo) throws Exception  {
		return workDAO.getMultiWorkinfo(workNo);
	}
	
	
	@Override
	public List<Work> getWorkByNoList(int artistNo) throws Exception {
		return workDAO.selectWorkByNo(artistNo);
	}

	@Override
	public List<Work> getProductByNoList(int artistNo) throws Exception {
		return workDAO.selectProductByNo(artistNo);
	}

	@Override
	public List<Work> getSoldProductByNoList(int artistNo) throws Exception {
		return workDAO.selectSoldProductByNo(artistNo);
	}

	@Override
	public void updateSale(int orderNo, int workNo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("orderNo", orderNo);
		map.put("workNo", workNo);
		workDAO.updateSale(map);
	}
	
	
}
