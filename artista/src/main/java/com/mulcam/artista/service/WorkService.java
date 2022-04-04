package com.mulcam.artista.service;

import com.mulcam.artista.dto.Work;

public interface WorkService {
	public void insertWork(Work work) throws Exception;
	public int getWorkMaxId() throws Exception;
}
