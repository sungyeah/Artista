package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.PageInfo;
import com.mulcam.artista.dto.Work;

public interface WorkService {
	public void insertWork(Work work) throws Exception;
	public int getWorkMaxNo() throws Exception;
	Work workinfo(int workNo) throws Exception;
	public List<Work> getWorkinfo(String workNo) throws Exception ; //안쓸듯
	public List<Work> getWorkByNoList(int artistNo) throws Exception;
	public List<Work> getProductByNoList(int artistNo) throws Exception;
	public List<Work> getSoldProductByNoList(int artistNo) throws Exception;
	
	public List<Work> SoldProductList(int page, PageInfo pageInfo) throws Exception;
	
	public void updateSale(int orderNo,int workNo)throws Exception;
	public void workPayed(int workNo)throws Exception;
	
	public void updateWork(Work work) throws Exception;
	public List<Work> works(int artistNo) throws Exception;	// 작가 디테일 - 작품들
	
}