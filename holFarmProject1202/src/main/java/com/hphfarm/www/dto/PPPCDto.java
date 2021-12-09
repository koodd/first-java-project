package com.hphfarm.www.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PPPCDto {
	
	PayDto payDto;
	PurchaseListDto purchaseListDto;
	List<PPPCDto> pppcDtos;
	ProductDto productDto;
	CancelDto cancelDto;
}
