package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.Work;

@Mapper
@Repository
public interface StoreDAO {
	public List<Work> workList()throws Exception;
	public String artistName(int workNo)throws Exception;
	public Artist artistInfo(String artistName)throws Exception;
	public String artistImg(int artistNo)throws Exception;
	public void insertCart(Map map)throws Exception;
	public boolean checkCart(Map map)throws Exception;
}
