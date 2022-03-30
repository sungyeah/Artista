package com.mulcam.artista.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.artista.dto.Member;

@Mapper
@Repository
public interface SubPageDAO {
	public void insertMember(Member mem)throws Exception;  //회원가입
	public Member queryMember(String id)throws Exception;  //아이디 조회
	public void changePw(Map map)throws Exception;         //비밀번호 수정
	public void updateMember(Member mem)throws Exception;  //회원정보 수정
	public String checkPw(String id)throws Exception;      //비밀번호 체크
	public List<Member> memberList()throws Exception;      //회원목록 조회
	public void deleteId(String id)throws Exception;       //아이디 삭제
}
