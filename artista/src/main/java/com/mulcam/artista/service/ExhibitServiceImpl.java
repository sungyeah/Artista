package com.mulcam.artista.service;

import java.util.List;

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
	public int maxExhibitApplyId() throws Exception {
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
	public int maxExhibitId() throws Exception {
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

	

}
