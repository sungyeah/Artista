package com.mulcam.artista.dto;

public class Order {
	int orderNo;
	String id;
	int workNo;
	int deliveryCharge;
	int workPrice;
	int orderCost;
	String orderName;
	String orderNum;
	String orderEmail;
	String receiverName;
	String receiverNum;
	String receiverAddress;
	String receiverAddress2;
	String pay_method;
	String orderStatus;
	String trackingNo;
	String orderDate;
	String pickupAddress;
	String ordercount;
	
	public Order() {}
	public Order(int orderNo, String id, int workNo,int deliveryCharge,int workPrice,int orderCost,
			String orderName,String orderNum,String orderEmail,String receiverName,String receiverNum,String receiverAddress
			,String receiverAddress2,String pay_method,String orderStatus,String trackingNo,String orderDate,String pickupAddress,String ordercount) {
	this.orderNo=orderNo;
	this.id=id;
	this.workNo=workNo;
	this.deliveryCharge=deliveryCharge;
	this.workPrice=workPrice;
	this.orderCost=orderCost;
	this.orderName=orderName;
	this.orderNum=orderNum;
	this.orderEmail=orderEmail;
	this.receiverName=receiverName;
	this.receiverNum=receiverNum;
	this.receiverAddress=receiverAddress;
	this.receiverAddress2=receiverAddress2;
	this.pay_method=pay_method;
	this.orderStatus=orderStatus;
	this.trackingNo=trackingNo;
	this.orderDate=orderDate;
	this.pickupAddress=pickupAddress;
	this.ordercount=ordercount;
	}
	public String getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(String ordercount) {
		this.ordercount = ordercount;
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
	public int getDeliveryCharge() {
		return deliveryCharge;
	}
	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}
	public int getWorkPrice() {
		return workPrice;
	}
	public void setWorkPrice(int workPrice) {
		this.workPrice = workPrice;
	}
	public int getOrderCost() {
		return orderCost;
	}
	public void setOrderCost(int orderCost) {
		this.orderCost = orderCost;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
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
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverNum() {
		return receiverNum;
	}
	public void setReceiverNum(String receiverNum) {
		this.receiverNum = receiverNum;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverAddress2() {
		return receiverAddress2;
	}
	public void setReceiverAddress2(String receiverAddress2) {
		this.receiverAddress2 = receiverAddress2;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
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
	public String getPickupAddress() {
		return pickupAddress;
	}
	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}
	
}
