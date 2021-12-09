package com.site.ex.service;

import javax.mail.MessagingException;

public interface EmailService {

	//이메일 전송메소드
	String sendEmail(String id, String email) throws Exception;

}
