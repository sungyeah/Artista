package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.WorkApplyDAO;
import com.mulcam.artista.dto.PageInfo;
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
	

	@Override
	public void refuseWorkApply(int workapplyNo, String refusedContents) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("applyNo", workapplyNo);
		map.put("refusedContents", refusedContents);
		workapplyDAO.updateWorkApplyRefuse(map);
	}

	@Override
	public List<WorkApply> getWorkApplyList(int page, PageInfo pageInfo) throws Exception {
		int listCount = workapplyDAO.WorkApplyNum();
		int maxPage = (int)Math.ceil((double)listCount/9);
		int startPage=(((int) ((double)page/9+0.9))-1)*9+1;
		int endPage=startPage+9-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*9;
		
		return workapplyDAO.selectWorkApplyList(startrow);
	}

	@Override
	public WorkApply selectWorktApplyByNo(int applyNo) throws Exception {
		return workapplyDAO.selectWorkApplyByNo(applyNo);
	}

	@Override
	public List<WorkApply> getWorkApplyListbyArtist(int artistNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
