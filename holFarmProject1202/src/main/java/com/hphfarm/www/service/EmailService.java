package com.hphfarm.www.service;

public interface EmailService {
	// 회원 이메일 검증하기
	String sendEmail(String u_id,String u_email, String u_email2) throws Exception;

}
