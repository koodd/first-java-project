package com.site.ex.dto;

public class MemberDto {
	
	String id;
	String pw;
	String name;
	String email;
	String hobby;
	
	public MemberDto(){}
	
	public MemberDto(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public MemberDto(String id, String pw, String name, String email, String hobby) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.hobby = hobby;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	

}
