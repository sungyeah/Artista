package com.mulcam.artista.service;

import java.util.List;
import java.util.Map;

import com.mulcam.artista.dto.Cart;
import com.mulcam.artista.dto.Follow;
import com.mulcam.artista.dto.Funding;
import com.mulcam.artista.dto.Member;
import com.mulcam.artista.dto.Order;
import com.mulcam.artista.dto.PageInfo;

public interface SubPageService {
	boolean memoverlap(String id) throws Exception;    //아이디 중복체크
	void makemember(Member mem) throws Exception;     //회원가입
	String checkPw(String id) throws Exception;      //비밀번호 체크
	Member queryId(String id) throws Exception;     //아이디 조회
	void deleteId(String id) throws Exception;     //아이디 삭제
	void updateMember(Member mem) throws Exception;   //회원정보 수정
	void changePw(String id, String password) throws Exception; //비밀번호 수정
	List<Member> memberList(int page, PageInfo pageInfo) throws Exception;             //회원전체조회
	boolean accessMember(String id, String password) throws Exception; //로그인 확인
	void makemember2(String id,String name,String email) throws Exception;     //회원가입2
	
	List<Cart> cartList(String id) throws Exception; //카트리스트 조회
	void deleteCart(int cartNo)throws Exception;
	Cart cartInfo(int cartNo)throws Exception; //카트번호로 카트조회
	public void changeMemberType(String id, String memberType) throws Exception;	// 일반회원->아티스트변경

	Integer MaxOrderNum() throws Exception; //주문번호 조회
	void insertPayment(Order order) throws Exception;//주문완료
	String memTypeInfo(String id)throws Exception;
	
	public List<Order> orderList(int page, PageInfo pageInfo) throws Exception; //주문 내역 조회
	public Order selectOrderByNo(int orderNo) throws Exception;
	
	boolean checkFollow(String follower,String following)throws Exception;
	void follow(String follower,String following)throws Exception;
	void unfollow(String follower,String following)throws Exception;
	int followercnt(String id)throws Exception;
	int followingcnt(String id)throws Exception;
	List<Follow> followInfo(String following)throws Exception;
	int workcnt(String artistName)throws Exception;
	public List<Funding> queryAlarmlist(String id);
	
	String getDeliveryStatus(String trackingNo) throws Exception;
	void updateStatus(String orderStatus,int orderNo)throws Exception;
	public int queryCount(int fundingNo);
	
	public void setTrackingNo(int orderNo, String trackingNo) throws Exception;
}
