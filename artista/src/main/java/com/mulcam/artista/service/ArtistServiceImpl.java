package com.mulcam.artista.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.ArtistDAO;
import com.mulcam.artista.dao.ArtistWorldDAO;
import com.mulcam.artista.dao.FundingDAO;
import com.mulcam.artista.dto.Artist;
import com.mulcam.artista.dto.ArtistWorld;
import com.mulcam.artista.dto.PageInfo;

@Service
public class ArtistServiceImpl implements ArtistService {
	@Autowired
	ArtistDAO artistDAO;
	
	@Autowired
	ArtistWorldDAO artistworldDAO;
	
	@Autowired
	FundingDAO fundingDAO;

	@Override
	public void insertArtist(Artist artist) throws Exception {
		artistDAO.insertArtist(artist);
	}

	@Override
	public int getArtistMaxId() throws Exception {
		Integer id = artistDAO.maxArtistNo();
		if(id==null) id=0;
		return id+1;
	}
	
	@Override
	public Integer getArtistNo(String id) throws Exception {
		return artistDAO.selectArtistNo(id);
	}

	@Override
	public String getArtistName(String id) throws Exception {
		return artistDAO.selectArtistName(id);
	}

	@Override
	public List<Artist> artistList(int page, PageInfo pageInfo) throws Exception {
		int listCount =  artistDAO.ArtistNum();
		int maxPage = (int)Math.ceil((double)listCount/9);
		int startPage=(((int) ((double)page/9+0.9))-1)*9+1;
		int endPage=startPage+9-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*9;
		return artistDAO.selectArtistList(startrow);
	}

	@Override
	public Artist selectArtistByNo(int artistNo) throws Exception {
		return artistDAO.selectArtistByNo(artistNo);
	}

	@Override
	public List<Artist> artists() throws Exception {
		return artistDAO.nameartist();
	}

	@Override
	public Artist Artistinfo(int artistNo) throws Exception {
		return artistDAO.artistInfo(artistNo);
	}
	
	

	public Artist artistInfo(String id) throws Exception {
		return artistDAO.artistInfo(id);
	}

	@Override
	public List<ArtistWorld> selectArtistWorldById(String id) throws Exception {
		return artistworldDAO.artistWorld(id);
	}

}
