package com.mulcam.artista.service;

import java.util.List;
import java.util.Map;

import com.mulcam.artista.dto.PageInfo;
import com.mulcam.artista.dto.WorkApply;

public interface WorkApplyService {
	public void insertWorkApply(WorkApply workapply) throws Exception;
	public int getWorkApplyMaxId() throws Exception;
	public void deleteWorkApply(int workapplyNo) throws Exception;
	public void refuseWorkApply(int workapplyNo, int applyState, String refusedContents) throws Exception;
	
	public WorkApply selectWorktApplyByNo(int applyNo) throws Exception;
	public List<WorkApply> getWorkApplyList(int page, PageInfo pageInfo) throws Exception;
	public List<WorkApply> getWorkApplyListbyArtist(int artistNo) throws Exception;
}
