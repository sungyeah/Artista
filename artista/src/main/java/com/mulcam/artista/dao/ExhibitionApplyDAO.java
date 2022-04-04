package com.mulcam.artista.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.ExhibitionApply;


@Mapper
@Repository
public interface ExhibitionApplyDAO {
	public Integer maxExhibitionApplyId() throws Exception;
	public void insertExhibitApply(ExhibitionApply exhibitionapply) throws Exception;
	public void deleteExhibitApply(int exhibitapplyNo) throws Exception;
}
