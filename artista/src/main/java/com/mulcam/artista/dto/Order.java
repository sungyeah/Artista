package com.mulcam.artista.dto;

public class Order {
	int orderNo;
	String id;
	int workNo;
	String workName;
	int workPrice;
	String orderName;
	String orderAddress;
	String orderAddress2;
	String orderNum;
	String orderEmail;
	int deliveryCharge;
	String payment;
	int orderCost;
	String orderStatus;
	String trackingNo;
	String orderDate;
	String workImg;
	String pickupAddress;
	
	public Order() {}
	public Order(int orderNo,String id,int workNo,String workName,int workPrice,String orderName,String orderAddress,String orderAddress2,String orderNum
			,String orderEmail,int deliveryCharge,String payment,int orderCost,String orderStatus,String trackingNo,String orderDate,String workImg,String pickupAddress) {
		this.orderNo=orderNo;
		this.id=id;
		this.workNo=workNo;
		this.workName=workName;
		this.workPrice=workPrice;
		this.orderName=orderName;
		this.orderAddress=orderAddress;
		this.orderAddress2=orderAddress2;
		this.orderNum=orderNum;
		this.orderEmail=orderEmail;
		this.deliveryCharge=deliveryCharge;
		this.payment=payment;
		this.orderCost=orderCost;
		this.orderStatus=orderStatus;
		this.trackingNo=trackingNo;
		this.orderDate=orderDate;
		this.workImg=workImg;
		this.pickupAddress=pickupAddress;
		
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
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
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderAddress2() {
		return orderAddress2;
	}
	public void setOrderAddress2(String orderAddress2) {
		this.orderAddress2 = orderAddress2;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public int getDeliveryCharge() {
		return deliveryCharge;
	}
	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getOrderCost() {
		return orderCost;
	}
	public void setOrderCost(int orderCost) {
		this.orderCost = orderCost;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getTrackingNo() {
		return trackingNo;
	}
	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getWorkImg() {
		return workImg;
	}
	public void setWorkImg(String workImg) {
		this.workImg = workImg;
	}
	public String getPickupAddress() {
		return pickupAddress;
	}
	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}
}
