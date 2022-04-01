package com.mulcam.artista.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Work;

@Mapper
@Repository
public interface WorkDAO {
	public Integer maxWorkId() throws Exception;
	public void insertWork(Work work) throws Exception;
}
