package com.mulcam.artista.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.MyPageDAO;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Order;

@Service
public class MyPageServiceImpl implements MypageService{
	@Autowired
	MyPageDAO mypageDAO;

	@Override
	public List<Order> orderList(String id) throws Exception {
		return mypageDAO.orderList(id);
	}

	@Override
	public Order orderInfo(int oderNo) throws Exception {
		return mypageDAO.queryorder(oderNo);
	}

	@Override
	public void deleteOrder(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Funding> fundingList(String id) throws Exception {
		return mypageDAO.fundingList(id);
	}

	@Override
	public String sponDate(int fundingNo) throws Exception {
		return mypageDAO.sponDate(fundingNo);
	}


}
