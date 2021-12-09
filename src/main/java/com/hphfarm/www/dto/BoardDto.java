package com.hphfarm.www.dto;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	
	//게시판 통합
  private int bt_no;
  private String bt_title;
  private String bt_content;
  private Date bt_date;
  private int bt_hit;
  private int bt_group;
  private int bt_indent;
  private int bt_reply;
  private int bt_report;
  private String bt_upload;
  //유저 번호
  private int u_no;
  private int uc_no;
  
  	//게시판 분류 번호
  private int bc_no;
  private String bc_name;
  
  	//게시판 공지
  private int bn_no;
  private String bn_title;
  private String bn_content;
  private Date bn_date;
  private int bn_hit;
  private String bn_upload;

  //게시판 댓글
  private int bcm_no;
  private String bcm_nickname;
  private Date bcm_date;
  private String bcm_content;
 
}
