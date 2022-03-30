package com.mulcam.artista.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.artista.dao.SubPageDAO;
import com.mulcam.artista.dto.Member;

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
		// TODO Auto-generated method stub
		subpageDAO.insertMember(mem);
		
	}

	@Override
	public String checkPw(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member queryId(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteId(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member updateMember(Member mem) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void changePw(String id, String password) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Member> memberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean accessMember(String id, String password) throws Exception {
		Member mem=subpageDAO.queryMember(id);
		if(mem==null||id.equals(mem.getId())&&!password.equals(mem.getPassword())) 
			return false;
			return true;
	}

}
