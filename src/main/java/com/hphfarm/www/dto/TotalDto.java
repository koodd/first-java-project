package com.hphfarm.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TotalDto {

	private ExpDto expDto;
	private MemberDto memberDto;
	private FarmRegDto farmregDto;
	private NumberDto numberDto;
}
