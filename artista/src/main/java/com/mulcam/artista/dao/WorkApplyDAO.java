package com.mulcam.artista.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.WorkApply;

@Mapper
@Repository
public interface WorkApplyDAO {
	public Integer maxWorkApplyId() throws Exception;
	public void insertWorkApply(WorkApply workapply) throws Exception;
	public void deleteWorkApply(int workapplyNo) throws Exception;
}
