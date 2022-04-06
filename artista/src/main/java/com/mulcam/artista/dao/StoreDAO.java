package com.mulcam.artista.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Work;

@Mapper
@Repository
public interface StoreDAO {
	public List<Work> workList()throws Exception;
}
