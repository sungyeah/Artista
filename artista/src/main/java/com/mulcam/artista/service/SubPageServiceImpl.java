package com.mulcam.artista.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		// TODO Auto-generated method stub
		return subpageDAO.queryAlarmlist(id);
	}

	
}
