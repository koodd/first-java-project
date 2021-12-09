package com.hphfarm.www.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpDto {
	
	// =========================== 체험 ===========================
	
	private int e_no;
	private String e_details;
	private Date e_startdate;
	private Date e_enddate;
	private String e_keyword;
	private String e_appr;
	private String e_term;
	private int e_price;
	private String e_thumb;
	private String e_name;
	private int u_no;
	private int fr_no;
	// 추가된 컬럼
	private Date e_regidate;
	
	// 유저에 해당되는 컬럼들 (테이블 명 : users)
	private String u_name;	//농장주명
	private String u_phone;	// 연락처
	// 농장에 해당되는 컬럼들 (테이블 명 : farmreg)
	private String fr_name;	//농장 명
	private String fr_addr;	//농장 줏조
}
