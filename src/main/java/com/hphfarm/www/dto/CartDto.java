package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
	
	private int ct_no;
	private int u_no;
	private int p_no;
	private int ct_num;
	private Date ct_date;
	private int ct_tp;

}
