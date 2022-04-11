package com.mulcam.artista.dto;

public class FollowingInfo {
	String artistId;
	String artistName;
	int workcnt;
	int followercnt;
	String artistImg;
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public int getWorkcnt() {
		return workcnt;
	}
	public void setWorkcnt(int workcnt) {
		this.workcnt = workcnt;
	}
	public int getFollowercnt() {
		return followercnt;
	}
	public void setFollowercnt(int followercnt) {
		this.followercnt = followercnt;
	}
	public String getArtistImg() {
		return artistImg;
	}
	public void setArtistImg(String artistImg) {
		this.artistImg = artistImg;
	}
	public String getArtistId() {
		return artistId;
	}
	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}
	
}
