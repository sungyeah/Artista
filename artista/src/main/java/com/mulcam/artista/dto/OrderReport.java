package com.mulcam.artista.dto;

import java.util.List;

public class OrderReport {
	private Order order;
	private List<Work> works;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Work> getWorks() {
		return works;
	}
	public void setWorks(List<Work> works) {
		this.works = works;
	}
}
