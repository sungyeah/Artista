package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;

public interface ExhibitService {
	public int maxExhibitApplyNo() throws Exception;
	public void insertExhibitApply(ExhibitionApply exhibitionapply) throws Exception;
	public ExhibitionApply selectExhibitApply(int applyNo) throws Exception;
	public List<ExhibitionApply> ExhibitApplyList() throws Exception;
	public void deleteExhibitApply(int applyNo) throws Exception;
	public void refuseExhibitApply(int applyNo, String refusedContents) throws Exception;
	
	public int maxExhibitNo() throws Exception;
	public void insertExhibit(Exhibition exhibition) throws Exception;
	public Exhibition selectExhibit(int exhibitNo) throws Exception;
	public List<Exhibition> ExhibiList() throws Exception;
	public void deleteExhibit(int exhibitNo) throws Exception;
	

	public List<Exhibition> exhibits() throws Exception;	// 전시회 리스트

	public List<Exhibition> ExhibitListByArtist(int artistNo) throws Exception;
	public List<ExhibitionApply> ExhibitApplyListByArtist(int artistNo) throws Exception;

}
