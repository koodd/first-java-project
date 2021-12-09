package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductReviewDto {
	
	private int pr_no;
	private int pr_grade;
	private String pr_nickname;
	private Date pr_date;
	private String pr_content;
	private int p_no; 

}
