package com.site.ex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TotalDto {
	
	private BoardDto boardDto;
	private MemberDto memberDto;
	
}
