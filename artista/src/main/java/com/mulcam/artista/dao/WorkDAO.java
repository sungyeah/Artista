package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Work;

@Mapper
@Repository
public interface WorkDAO {
	public Integer maxWorkNo() throws Exception;
	public void insertWork(Work work) throws Exception;
	public Work woriInfo(int workNo) throws Exception;
	public List<Work> getMultiWorkinfo(String workNo) throws Exception; //안쓸듯
	public List<Work> selectWorkByNo(int artistNo) throws Exception;
	public List<Work> selectProductByNo(int artistNo) throws Exception;
	public List<Work> selectSoldProductByNo(int artistNo) throws Exception;
	
	public void updateSale(Map map)throws Exception;
}
