package com.mulcam.artista.dto;

public class Work {
	int workNo;
	int artistNo;
	String artistName;
	String workName;
	String workImg;
	String workType;
	String workTech;
	String workSize;
	String workIntro;
	String pickupAddress;
	int workPrice;
	boolean workForSale;
	
	public Work() {} 
	public Work(int workNo, int artistNo, String artistName, String workName, String workImg, String workType, String workTech,
			String workSize, String workIntro, String pickupAddress, int workPrice, boolean workForSale) {
		this.workNo = workNo;
		this.artistNo = artistNo;
		this.artistName = artistName;
		this.workName = workName;
		this.workImg = workImg;
		this.workType = workType;
		this.workTech = workTech;
		this.workSize = workSize;
		this.workIntro = workIntro;
		this.pickupAddress = pickupAddress;
		this.workPrice = workPrice;
		this.workForSale = workForSale;
		
	}
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
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
	public String getPickupAddress() {
		return pickupAddress;
	}
	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}
	public int getWorkPrice() {
		return workPrice;
	}
	public void setWorkPrice(int workPrice) {
		this.workPrice = workPrice;
	}
	public boolean isWorkForSale() {
		return workForSale;
	}
	public void setWorkForSale(boolean workForSale) {
		this.workForSale = workForSale;
	}
	
}
