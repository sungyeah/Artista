package com.mulcam.artista.dto;

public class Cart {
	int cartNo;
	String id;
	String productName;
	int productCost;
	String productStatus;
	int workNo;
	String workImg;
	String cartDate;
	
	public Cart() {}
	public Cart(int cartNo,String id,String productName,int productCost,String productStatus,int workNo,String workImg,String cartDate) {
		this.cartNo=cartNo;
		this.id=id;
		this.productName=productName;
		this.productCost=productCost;
		this.productStatus=productStatus;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductCost() {
		return productCost;
	}
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
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
