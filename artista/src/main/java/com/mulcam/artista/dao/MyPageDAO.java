package com.mulcam.artista.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Order;


@Mapper
@Repository
public interface MyPageDAO {
	public List<Order> orderList(String id) throws Exception;  //전체주문조회
	public Order queryorder(int orderNo) throws Exception;    //주문상세조회
	public void deleteOrder(int orderNo) throws Exception;     //결제취소
//	public List<Funding> fundingList(String id)
//	public List<Follow> followList()
	//팔로우는 나중에
	
}
