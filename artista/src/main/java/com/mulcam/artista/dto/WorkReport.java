package com.mulcam.artista.dto;

import java.util.List;

public class WorkReport {
	private Work work;
	private Order order;
	public Work getWork() {
		return work;
	}
	public void setWork(Work work) {
		this.work = work;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
}
