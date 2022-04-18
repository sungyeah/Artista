package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.sponInfo;

public interface MypageService {
	List<Order> orderList(String id) throws Exception; //전체주문조회
	Order orderInfo(int oderNo) throws Exception;      //주문상세조회
	void deleteOrder(int orderNo) throws Exception;   //결제취소
	List<sponInfo> fundingList(String id)throws Exception;
	String sponDate(int fundingNo)throws Exception;
	int sponState(int fundingNo)throws Exception;
	int succesFunding(int fundingNo)throws Exception;
}
