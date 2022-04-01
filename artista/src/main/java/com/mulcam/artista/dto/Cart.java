package com.mulcam.artista.dto;

public class Cart {
	int cartNo;
	String id;
	String workName;
	int workPrice;
	String workArtist;
	String WorkSize;
	int workNo;
	String workImg;
	String cartDate;
	
	public Cart() {}
	public Cart(int cartNo,String id,String workName,int workPrice,String workArtist, String WorkSize,int workNo,String workImg,String cartDate) {
		this.cartNo=cartNo;
		this.id=id;
		this.workName=workName;
		this.workPrice=workPrice;
		this.workArtist=workArtist;
		this.WorkSize=WorkSize;
		this.workNo=workNo;
		this.workImg=workImg;
		this.cartDate=cartDate;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public int getWorkPrice() {
		return workPrice;
	}
	public void setWorkPrice(int workPrice) {
		this.workPrice = workPrice;
	}
	public String getWorkArtist() {
		return workArtist;
	}
	public void setWorkArtist(String workArtist) {
		this.workArtist = workArtist;
	}
	public String getWorkSize() {
		return WorkSize;
	}
	public void setWorkSize(String workSize) {
		WorkSize = workSize;
	}
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}
	public String getWorkImg() {
		return workImg;
	}
	public void setWorkImg(String workImg) {
		this.workImg = workImg;
	}
	public String getCartDate() {
		return cartDate;
	}
	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	
}
