package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.ExhibitionDAO;
import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;

@Service
public class ExhibitServiceImpl implements ExhibitService {
	
	@Autowired
	ExhibitionDAO exhibitDAO;
	
	@Override
	public int maxExhibitApplyNo() throws Exception {
		Integer id = exhibitDAO.maxExhibitionApplyId();
		if(id==null) id = 0;
		return id+1;
	}
	
	@Override
	public void insertExhibitApply(ExhibitionApply exhibitionapply) throws Exception {
		exhibitDAO.insertExhibitApply(exhibitionapply);		
	}

	@Override
	public ExhibitionApply selectExhibitApply(int applyNo) throws Exception {
		return exhibitDAO.queryExhibitApply(applyNo);
	}

	@Override
	public List<ExhibitionApply> ExhibitApplyList() throws Exception {
		return exhibitDAO.selectExhibitApplyList();
	}
	
	@Override
	public void deleteExhibitApply(int applyNo) throws Exception {
		exhibitDAO.deleteExhibitApply(applyNo);
	}
	
	
	@Override
	public void refuseExhibitApply(int applyNo, String refusedContents) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("applyNo", applyNo);
		map.put("refusedContents", refusedContents);
		exhibitDAO.updateExhibitApplyRefuse(map);
	}

	@Override
	public int maxExhibitNo() throws Exception {
		Integer id = exhibitDAO.maxExhibitionId();
		if(id==null) id = 0;
		return id+1;
	}

	@Override
	public void insertExhibit(Exhibition exhibition) throws Exception {
		exhibitDAO.insertExhibit(exhibition);
	}

	@Override
	public Exhibition selectExhibit(int exhibitNo) throws Exception {
		return exhibitDAO.queryExhibit(exhibitNo);
	}

	@Override
	public List<Exhibition> ExhibiList() throws Exception {
		return exhibitDAO.selectExhibitList();
	}

	@Override
	public void deleteExhibit(int exhibitNo) throws Exception {
		exhibitDAO.deleteExhibit(exhibitNo);
	}

	@Override
	public List<Exhibition> ExhibitListByArtist(int artistNo) throws Exception {
		return exhibitDAO.selectExhibitListByArtistNo(artistNo);
	}

	@Override
	public List<ExhibitionApply> ExhibitApplyListByArtist(int artistNo) throws Exception {
		return exhibitDAO.selectExhibitApplyListByArtistNo(artistNo);
	}

	


	

}
