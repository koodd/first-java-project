package com.site.ex.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	private int no;
	private String title;
	private String name;
	private Timestamp date;
	private int hit;
	
	public BoardDto() {}
	public BoardDto(int no, String title, String name, Timestamp date, int hit) {
		this.no = no;
		this.title = title;
		this.name = name;
		this.date = date;
		this.hit = hit;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	

}
