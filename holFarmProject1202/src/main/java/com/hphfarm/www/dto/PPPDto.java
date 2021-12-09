package com.hphfarm.www.dto;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PPPDto {
	
	PayDto payDto;
	PurchaseListDto purchaseListDto;
	List<PPPDto> pppDtos;
	ProductDto productDto;
	
}
