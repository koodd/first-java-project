package com.site.ex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String hobby;

}
