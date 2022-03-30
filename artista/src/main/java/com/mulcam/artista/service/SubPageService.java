package com.mulcam.artista.service;

import java.util.List;

import com.mulcam.artista.dto.Member;

public interface SubPageService {
	boolean memoverlap(String id) throws Exception;    //아이디 중복체크
	void makemember(Member mem) throws Exception;     //회원가입
	String checkPw(String id) throws Exception;      //비밀번호 체크
	Member queryId(String id) throws Exception;     //아이디 조회
	void deleteId(String id) throws Exception;     //아이디 삭제
	Member updateMember(Member mem) throws Exception;   //회원정보 수정
	void changePw(String id, String password) throws Exception; //비밀번호 수정
	List<Member> memberList() throws Exception;             //회원전체조회
}
