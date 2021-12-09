package com.hphfarm.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseListDto {
	
	private int pl_no;
	private int p_no;
	private int pl_num;
	private String pl_delivery;
	private String pl_status;
	private int py_no; 

}
