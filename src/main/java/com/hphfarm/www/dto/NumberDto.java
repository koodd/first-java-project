package com.hphfarm.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class NumberDto {

	// =========================== 페이징(넘버링) 통합 ===========================
	
	private int page;
	private int limit;
	private int numlimit;
	private int listcount;
	private int maxpage;
	private int startpage;
	private int endpage;
	private int startrow;
	private int endrow;
	private String category;
	private String searchword;
	//상품 관련
	private int pc_no;

	//농장 관련
	private String region;
	//게시판 관련	 11/26 수정
		private int bc_no;
		private int u_no;
	
	
	// 통합 넘버링 생성자
	public NumberDto(int page, int limit, int numlimit, int listcount, int maxpage, int startpage, int endpage,
			int startrow, int endrow, String category, String searchword) {
		super();
		this.page = page;
		this.limit = limit;
		this.numlimit = numlimit;
		this.listcount = listcount;
		this.maxpage = maxpage;
		this.startpage = startpage;
		this.endpage = endpage;
		this.startrow = startrow;
		this.endrow = endrow;
		this.category = category;
		this.searchword = searchword;
	}
	
	// 농장 목록 넘버링 생성자
	public NumberDto(int page, int limit, int numlimit, int listcount, int maxpage, int startpage, int endpage,
			int startrow, int endrow, String category, String searchword, String region) {
		super();
		this.page = page;
		this.limit = limit;
		this.numlimit = numlimit;
		this.listcount = listcount;
		this.maxpage = maxpage;
		this.startpage = startpage;
		this.endpage = endpage;
		this.startrow = startrow;
		this.endrow = endrow;
		this.category = category;
		this.searchword = searchword;
		this.region = region;
	}

	// 상품 관련 넘버링 생성자
	
	  public NumberDto(int page, int limit, int numlimit, int listcount, int
	  maxpage, int startpage, int endpage, int startrow, int endrow, String
	  category, String searchword, int pc_no) { super(); this.page = page;
	  this.limit = limit; this.numlimit = numlimit; this.listcount = listcount;
	  this.maxpage = maxpage; this.startpage = startpage; this.endpage = endpage;
	  this.startrow = startrow; this.endrow = endrow; this.category = category;
	  this.searchword = searchword; this.pc_no = pc_no; }
	 
	public NumberDto(int page, int limit, int numlimit, int listcount, int maxpage, int startpage, int endpage,
			int startrow, int endrow, String category, int bc_no,String searchword){
		super();
		this.page = page;
		this.limit = limit;
		this.numlimit = numlimit;
		this.listcount = listcount;
		this.maxpage = maxpage;
		this.startpage = startpage;
		this.endpage = endpage;
		this.startrow = startrow;
		this.endrow = endrow;
		this.category = category;
		this.bc_no = bc_no;
		this.searchword = searchword;
		
	}
	
	
}
