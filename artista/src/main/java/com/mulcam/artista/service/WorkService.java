package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Work;

public interface WorkService {
	public void insertWork(Work work) throws Exception;
	public int getWorkMaxNo() throws Exception;
	public List<Work> getWorkByNoList(int artistNo) throws Exception;
	public List<Work> getProductByNoList(int artistNo) throws Exception;
}
