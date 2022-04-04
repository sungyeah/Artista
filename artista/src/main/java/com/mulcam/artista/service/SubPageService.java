package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Cart;
import com.mulcam.artista.dto.Member;

public interface SubPageService {
	boolean memoverlap(String id) throws Exception;    //아이디 중복체크
	void makemember(Member mem) throws Exception;     //회원가입
	String checkPw(String id) throws Exception;      //비밀번호 체크
	Member queryId(String id) throws Exception;     //아이디 조회
	void deleteId(String id) throws Exception;     //아이디 삭제
	void updateMember(Member mem) throws Exception;   //회원정보 수정
	void changePw(String id, String password) throws Exception; //비밀번호 수정
	List<Member> memberList() throws Exception;             //회원전체조회
	boolean accessMember(String id, String password) throws Exception; //로그인 확인
	void makemember2(String id,String name,String email) throws Exception;     //회원가입2
	
	List<Cart> cartList(String id) throws Exception; //카트리스트 조회
	void deleteCart(int cartNo)throws Exception;
	
	public void changeMemberType(String id, String memberType) throws Exception;	// 일반회원->아티스트변경
}