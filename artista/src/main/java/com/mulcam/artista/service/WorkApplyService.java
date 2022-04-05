package com.mulcam.artista.service;

import com.mulcam.artista.dto.WorkApply;

public interface WorkApplyService {
	public void insertWorkApply(WorkApply workapply) throws Exception;
	public int getWorkApplyMaxId() throws Exception;
	public void deleteWorkApply(int workapplyNo) throws Exception;
	
}
