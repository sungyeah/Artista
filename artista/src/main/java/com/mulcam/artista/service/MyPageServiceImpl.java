package com.mulcam.artista.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mulcam.artista.dao.MyPageDAO;
import com.mulcam.artista.dto.Order;

public class MyPageServiceImpl implements MypageService{
	@Autowired
	MyPageDAO mypageDAO;

	@Override
	public List<Order> orderList(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order orderInfo(int oderNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOrder(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		
	}


}