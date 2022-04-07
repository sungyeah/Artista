package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;

public interface ExhibitService {
	public int maxExhibitApplyId() throws Exception;
	public void insertExhibitApply(ExhibitionApply exhibitionapply) throws Exception;
	public ExhibitionApply selectExhibitApply(int applyNo) throws Exception;
	public List<ExhibitionApply> ExhibitApplyList() throws Exception;
	
	public int maxExhibitId() throws Exception;
	public void insertExhibit(Exhibition exhibition) throws Exception;
	public Exhibition selectExhibit(int exhibitNo) throws Exception;
	public List<Exhibition> ExhibiList() throws Exception;
}
