package com.site.ex.dto;

import java.sql.Timestamp;

public class CommentDto {
	
	public CommentDto(){}
	public CommentDto(int cno, int bid, String id, String cpw, String ccontent, Timestamp cdate) {
		this.cno = cno;
		this.bid = bid;
		this.id = id;
		this.cpw = cpw;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}
	private int cno;
	private int bid;
	private String id;
	private String cpw;
	private String ccontent;
	private Timestamp cdate;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	
	
	

}
