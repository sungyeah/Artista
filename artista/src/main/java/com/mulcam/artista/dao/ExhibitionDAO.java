package com.mulcam.artista.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Exhibition;
import com.mulcam.artista.dto.ExhibitionApply;


@Mapper
@Repository
public interface ExhibitionDAO {
	public Integer maxExhibitionApplyId() throws Exception;
	public void insertExhibitApply(ExhibitionApply exhibitionapply) throws Exception;
	public ExhibitionApply queryExhibitApply(int applyNo) throws Exception;
	public List<ExhibitionApply> selectExhibitApplyList() throws Exception;
	public void deleteExhibitApply(int exhibitapplyNo) throws Exception;
	
	public Integer maxExhibitionId() throws Exception;
	public void insertExhibit(Exhibition exhibition) throws Exception;
	public Exhibition queryExhibit(int exhibitNo) throws Exception;
	public List<Exhibition> selectExhibitList() throws Exception;
	public void deleteExhibit(int exhibitNo) throws Exception;
}
