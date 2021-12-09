package com.hphfarm.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardTotalDto {

	private MemberDto memberDto;
	private BoardDto boardDto;
}
