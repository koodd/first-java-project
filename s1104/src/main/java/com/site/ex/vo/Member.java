package com.site.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String hobby;
}
