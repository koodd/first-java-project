package com.site.ex.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EventDto {
	
	private int eventNo;
	private String id;
	private String etitle;
	private String econtent;
	private Date startDate;
	private Date endDate;
	private int estatus;
	private String ip;
	private String eupload;
	private String eupload2;
	
}
