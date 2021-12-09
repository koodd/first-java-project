package com.hphfarm.www.dto;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
	
	// =========================== 상품 ===========================
	
	private int p_no;
	private String p_name;
	private String p_way;
	private int p_num;
	private Date p_term;
	private int pc_no;
	private int p_price;
	private String p_info;
	private String p_pic;
	private String p_picd;
	private String p_picd2;
	private String p_picd3;
	private String p_picd4;
	private String p_picd5;

}
