package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.WorkApply;

@Mapper
@Repository
public interface WorkApplyDAO {
	public Integer maxWorkApplyId() throws Exception;
	public void insertWorkApply(WorkApply workapply) throws Exception;
	public void deleteWorkApply(int workapplyNo) throws Exception;
	public void updateWorkApplyRefuse(Map map) throws Exception;
	
	public WorkApply selectWorkApplyByNo(int applyNo) throws Exception;
	public int WorkApplyNum() throws Exception;
	public List<WorkApply> selectWorkApplyList() throws Exception;
	public List<WorkApply> selectWorkApplyListByNo(int artistNo) throws Exception;
} 

