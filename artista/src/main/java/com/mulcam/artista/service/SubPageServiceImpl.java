package com.mulcam.artista.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.FundingDAO;
import com.mulcam.artista.dao.SubPageDAO;
import com.mulcam.artista.dto.Cart;
import com.mulcam.artista.dto.Follow;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.PageInfo;

@Service
public class SubPageServiceImpl implements SubPageService{
	
	@Autowired
	SubPageDAO subpageDAO;
	
	@Autowired
	FundingDAO fundingDAO;

	@Override
	public boolean memoverlap(String id) throws Exception {
		Member mem=subpageDAO.queryMember(id);
		if(mem==null) return false;
		return true;
	}

	@Override
	public void makemember(Member mem) throws Exception {
		subpageDAO.insertMember(mem);
		
	}

	@Override
	public String checkPw(String id) throws Exception {
		return null;
	}

	@Override
	public Member queryId(String id) throws Exception {
		return subpageDAO.queryMember(id);
		
	}

	@Override
	public void deleteId(String id) throws Exception {
		subpageDAO.deleteId(id);
	}

	@Override
	public void updateMember(Member mem) throws Exception {
		subpageDAO.updateMember(mem);
	}

	@Override
	public void changePw(String id, String password) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		subpageDAO.changePw(map);
	}

	@Override
	public List<Member> memberList(int page, PageInfo pageInfo) throws Exception {
		int listCount =  subpageDAO.memberNum();
		int maxPage = (int)Math.ceil((double)listCount/9);
		int startPage=(((int) ((double)page/9+0.9))-1)*9+1;
		int endPage=startPage+9-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*9;
		return subpageDAO.memberList(startrow);
	}

	@Override
	public boolean accessMember(String id, String password) throws Exception {
		Member mem=subpageDAO.queryMember(id);
		if(mem==null||id.equals(mem.getId())&&!password.equals(mem.getPassword())) 
			return false;
			return true;
	}

	@Override
	public void makemember2(String id, String name, String email) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		subpageDAO.insertMember2(map);
		
	}

	@Override
	public List<Cart> cartList(String id) throws Exception {
		return subpageDAO.cartList(id);
	}

	@Override
	public void deleteCart(int cartNo) throws Exception {
		subpageDAO.deleteCart(cartNo);
		
	}
	
	// 예선 : 일반회원 -> 아티스트
	@Override
	public void changeMemberType(String id, String memberType) throws Exception  {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("membertype", memberType);
		subpageDAO.updateMemberType(map);
	}

	@Override
	public Cart cartInfo(int cartNo) throws Exception {
		return subpageDAO.cartinfo(cartNo);
	}

	@Override
	public Integer MaxOrderNum() throws Exception {
		Integer no = subpageDAO.MaxOrderNum();
		if(no==null) {
			no = 0;
		}else {
			no +=1;
		}
		return no;
	}

	@Override
	public void insertPayment(Order order) throws Exception {
		subpageDAO.insertPayment(order);
		
	}

	@Override
	public String memTypeInfo(String id) throws Exception {
		return subpageDAO.memTypeInfo(id);
	}


	@Override
	public List<Order> orderList(int page, PageInfo pageInfo) throws Exception {
		int listCount =  subpageDAO.totalOrderNum();
		int maxPage = (int)Math.ceil((double)listCount/9);
		int startPage=(((int) ((double)page/9+0.9))-1)*9+1;
		int endPage=startPage+9-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*9;
		return subpageDAO.orderList(startrow);
	}

	@Override
	public Order selectOrderByNo(int orderNo) throws Exception {
		return subpageDAO.selectOrderByNo(orderNo);
	}

	@Override
	public boolean checkFollow(String follower, String following) throws Exception {
		Map <String,String> map = new HashMap<>();
		map.put("follower", follower);
		map.put("following", following);
		return subpageDAO.checkFollow(map);
	}

	@Override
	public void follow(String follower, String following) throws Exception {
		Map <String,String> map = new HashMap<>();
		map.put("follower", follower);
		map.put("following", following);
		subpageDAO.follow(map);
	}

	@Override
	public void unfollow(String follower, String following) throws Exception {
		Map <String,String> map = new HashMap<>();
		map.put("follower", follower);
		map.put("following", following);
		subpageDAO.unfollow(map);
		
	}

	@Override
	public int followercnt(String id) throws Exception {
		return subpageDAO.followercnt(id);
	}

	@Override
	public int followingcnt(String id) throws Exception {
		return subpageDAO.followingcnt(id);
	}

	@Override
	public List<Follow> followInfo(String following) throws Exception {
		return subpageDAO.followInfo(following);
	}

	@Override
	public int workcnt(String artistName) throws Exception {
		return subpageDAO.workcnt(artistName);
	}

	public List<Funding> queryAlarmlist(String id) {
		return fundingDAO.queryAlarmlist(id);
	}
	
	public String getDeliveryStatus(String trackingNo) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://info.sweettracker.co.kr/tracking/4");
		
		urlBuilder.append("?" + URLEncoder.encode("t_key", "UTF-8") + "=bNly32iRmzS23mWeYOuvIw"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("t_code", "UTF-8") + "=04");
		urlBuilder.append("&" + URLEncoder.encode("t_invoice", "UTF-8") + "="
				+ URLEncoder.encode(trackingNo, "UTF-8")); 
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/html");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String a = sb.toString();
		Document doc = Jsoup.parse(a);
		String e = doc.getElementsByClass("info-parcel-text-active").html();
		return e;
	}

	@Override
	public void updateStatus(String orderStatus, int orderNo) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("orderStatus", orderStatus);
		map.put("orderNo", orderNo);
		subpageDAO.updateStatus(map);
	}

	@Override
	public int queryCount(int fundingNo) {
		// TODO Auto-generated method stub
		return fundingDAO.queryCount(fundingNo);
	}

	@Override
	public void setTrackingNo(int orderNo, String trackingNo) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("orderNo", orderNo);
		map.put("trackingNo", trackingNo);
		subpageDAO.setTrackingNo(map);
	}

	
}
