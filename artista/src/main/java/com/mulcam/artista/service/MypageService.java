package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Order;

public interface MypageService {
	List<Order> orderList(String id) throws Exception; //전체주문조회
	Order orderInfo(int oderNo) throws Exception;      //주문상세조회
	void deleteOrder(int orderNo) throws Exception;   //결제취소
	List<Funding> fundingList(String id)throws Exception;
	String sponDate(int fundingNo)throws Exception;
}
