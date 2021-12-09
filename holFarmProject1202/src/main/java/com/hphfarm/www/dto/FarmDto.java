package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FarmDto {

	// 농장 등록 dto
	private int fr_no;
	private String fr_addr, fr_name;
	private int fr_area, fr_block, fr_land;
	private String fr_certi, fr_appr;
	private int u_no;
	private Date fr_startdate, fr_enddate;
	private String fr_view, fr_view2, fr_view3, fr_view4;
	private int fr_price;
	private String fr_unique, fr_noplant, fr_service, fr_thumb;
	private Date fr_regidate;
	private double f_grade;
	// 유저 관련 Dto
	private String u_phone;
	private String u_name;
	// 예약 관련 Dto
	private int frs_no;
	private String frs_account;
	private Date frs_resdate, frs_startdate;
	// 결제 관련 Dto
	private int py_price;

}
