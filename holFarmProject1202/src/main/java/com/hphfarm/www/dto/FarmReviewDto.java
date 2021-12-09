package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FarmReviewDto {

	private int frv_no;
	private String frv_nickname, frv_content;
	private int frv_grade;
	private Date frv_date;
	private int fr_no;
	
	private int uc_no;
}
