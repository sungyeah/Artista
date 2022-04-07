package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.WorkDAO;
import com.mulcam.artista.dto.PageInfo;
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

	@Override
	public List<Work> SoldProductList(int page, PageInfo pageInfo) throws Exception {
		int listCount = workDAO.soldProductNum();
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
		return workDAO.soldProductList(startrow);
	}

	@Override
	public void workPayed(int workNo) throws Exception {
		workDAO.updateSalePayed(workNo);
	}
	
	
}
