package com.hphfarm.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	
	// =========================== 회원 ===========================
	
	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_nickname;
	private String u_phone;
	private String u_regno;
	private String u_email;
	private String u_addr;
	private String u_infoway;
	private String u_account;
	private String u_bank;
	private String u_accountno;
	private int uc_no;

}
