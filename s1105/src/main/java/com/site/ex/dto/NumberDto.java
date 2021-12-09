package com.site.ex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NumberDto {

	private int page;
	private int limit;
	private int numLimit;
	private int listCount;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int startrow;
	private int endrow;
	private String category;
	private String searchWord;
	
	
}
