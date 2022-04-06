package com.mulcam.artista.dto;

public class WorkApply {
	int workapplyNo;
	int artistNo;
	String artistName;
	String workName;
	String workImg;
	String workType;
	String workTech;
	String workSize;
	String workIntro;
	int workPrice;
	int applyState;
	String refusedContents;
	
	public WorkApply() {}
	public int getWorkapplyNo() {
		return workapplyNo;
	}
	public void setWorkapplyNo(int workapplyNo) {
		this.workapplyNo = workapplyNo;
	}
	public int getArtistNo() {
		return artistNo;
	}
	public void setArtistNo(int artistNo) {
		this.artistNo = artistNo;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getWorkImg() {
		return workImg;
	}
	public void setWorkImg(String workImg) {
		this.workImg = workImg;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getWorkTech() {
		return workTech;
	}
	public void setWorkTech(String workTech) {
		this.workTech = workTech;
	}
	public String getWorkSize() {
		return workSize;
	}
	public void setWorkSize(String workSize) {
		this.workSize = workSize;
	}
	public String getWorkIntro() {
		return workIntro;
	}
	public void setWorkIntro(String workIntro) {
		this.workIntro = workIntro;
	}
	public int getWorkPrice() {
		return workPrice;
	}
	public void setWorkPrice(int workPrice) {
		this.workPrice = workPrice;
	}
	public int getApplyState() {
		return applyState;
	}
	public void setApplyState(int applyState) {
		this.applyState = applyState;
	}
	public String getRefusedContents() {
		return refusedContents;
	}
	public void setRefusedContents(String refusedContents) {
		this.refusedContents = refusedContents;
	} 
	
}
