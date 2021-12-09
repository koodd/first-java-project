package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FarmRegDto {

	private int fr_no;
	private String fr_addr;
	private String fr_name;
	private int fr_area;
	private int fr_block;
	private int fr_land;
	private String fr_appr;
	private int u_no;
	private Date fr_startdate;
	private Date fr_enddate;
	private String fr_view;
	private int fr_price;
	private String fr_unique;
	private String fr_noplant;
	private String fr_service;
	private String fr_thumb;

}
