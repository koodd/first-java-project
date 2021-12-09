package com.hphfarm.www.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CancelDto {
	
	
	private int c_no;
	private String c_reason;
	private String c_pic;
	private Date c_reqdate;
	private String c_appr;
	private Date c_apprdate;
	private int cc_no;
	private int py_no;
	

}
