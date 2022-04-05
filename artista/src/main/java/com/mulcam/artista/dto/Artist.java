package com.mulcam.artista.dto;

public class Artist {
	int artistNo;
	String id;
	String artistName;
	String artistImg;
	String artistType;
	String artistIntroduce;
	String artistRecord;
	String artistInstagram;
	
	public Artist() {}
	public Artist(int artistNo, String id, String artistName, String artistImg, String artistType, 
			String artistIntroduce, String artistRecord, String artistInstagram) {
		this.artistNo = artistNo;
		this.id = id;
		this.artistName = artistName;
		this.artistImg = artistImg;
		this.artistType = artistType;
		this.artistIntroduce = artistIntroduce;
		this.artistRecord = artistRecord;
		this.artistInstagram = artistInstagram;
	}
	
	public int getArtistNo() {
		return artistNo;
	}
	public void setArtistNo(int artistNo) {
		this.artistNo = artistNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getArtistImg() {
		return artistImg;
	}
	public void setArtistImg(String artistImg) {
		this.artistImg = artistImg;
	}
	public String getArtistType() {
		return artistType;
	}
	public void setArtistType(String artistType) {
		this.artistType = artistType;
	}
	public String getArtistIntroduce() {
		return artistIntroduce;
	}
	public void setArtistIntroduce(String artistIntroduce) {
		this.artistIntroduce = artistIntroduce;
	}
	public String getArtistRecord() {
		return artistRecord;
	}
	public void setArtistRecord(String artistRecord) {
		this.artistRecord = artistRecord;
	}
	public String getArtistInstagram() {
		return artistInstagram;
	}
	public void setArtistInstagram(String artistInstagram) {
		this.artistInstagram = artistInstagram;
	}
}
