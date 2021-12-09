package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayDto {
	
	private int py_no;
	private int py_price;
	private Date py_date;
	private String py_category;
	private int u_no;

}
