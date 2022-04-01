package com.mulcam.artista.dto;

public class ArtistApply {
	int artistNo;
	String id;
	String artistName;
	String artistImg;
	String artistIntroduce;
	String artistRecord;
	String artistInstagram;
	int applyResult;
	String refusedContents;
	
	ArtistApply(){}
	ArtistApply(String id, String artistName, String artistImg, String artistIntroduce,
			String artistRecord, String artistInstagram){
		this.id = id;
		this.artistName = artistName;
		this.artistImg = artistImg;
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
	public int getApplyResult() {
		return applyResult;
	}
	public void setApplyResult(int applyResult) {
		this.applyResult = applyResult;
	}
	public String getRefusedContents() {
		return refusedContents;
	}
	public void setRefusedContents(String refusedContents) {
		this.refusedContents = refusedContents;
	}
}
