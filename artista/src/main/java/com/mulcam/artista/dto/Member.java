package com.mulcam.artista.dto;

public class Member {
	String id;
	String password;
	String name;
	String email;
	String contact;
	String address;
	String address2;
	String memberType;
	
	public Member() {}
	public Member(String id,String password,String name, String email, String contact,
				String address, String address2,String memberType) {
		this.id=id;
		this.password=password;
		this.name=name;
		this.email=email;
		this.contact=contact;
		this.address=address;
		this.address2=address2;
		this.memberType=memberType;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
}
