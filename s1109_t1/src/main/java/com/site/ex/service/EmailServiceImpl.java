package com.site.ex.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired //메일전송 클래스
	JavaMailSender javaMailSender;
	
	
	@Override //이메일 전송메소드
	public String sendEmail(String id, String email) throws Exception {
		//임시비밀번호 생성
		String pwCode="";
		pwCode = getCreateKey();
		
		//이메일전송 관련 2가지 형태 1. text만 가능
		//SimpleMailMessage message2 = new SimpleMailMessage();
		// html코드 전송가능
		MimeMessage mail = javaMailSender.createMimeMessage();
		MimeMessageHelper message = new MimeMessageHelper(mail,true,"utf-8");
		
		//보내는 주소
		message.setTo(email);
		//보내는 사람주소
		message.setFrom("kanamda123@gmail.com");
		//메일 제목
		message.setSubject(id+"님의 회원가입 이메일인증 확인번호 안내");
		//메일 전송 내용
		String emailTxt = mailContent(id, email, pwCode);
		message.setText(emailTxt,true);
		//메일 전송
		javaMailSender.send(mail);
		System.out.println("이메일이 전송되었습니다.");
		return pwCode;
	}
	
	//html소스 코드 추가메소드
	public String mailContent(String id, String email,String pwCode) {
		StringBuffer emailTxt = new StringBuffer();
		emailTxt.append("<!DOCTYPE html>");
        emailTxt.append("<html>");
        emailTxt.append("<head>");
        emailTxt.append("</head>");
        emailTxt.append("<body>");
        emailTxt.append(
				"<div style=\"font-family:'Apple SD Gothic Neo', 'sans-serif' !important; width: 500px; height: 600px; border-top: 4px solid #02b875; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"+ 
				"<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"																															+ 
				"<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">ONLINE SHOP</span><br />"																													+ 
				"<span style=\"color: #02b875\">메일인증</span> 안내입니다."																																				+ 
				"</h1>"																																																+ 
				"<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"																													+ 
				id + "님 안녕하세요.<br>"																																													+ 
				"온라인쇼핑몰에 가입해 주셔서 진심으로 감사드립니다.<br>"																																						+ 
				"아래 <b style=\"color: #02b875\">'메일 인증'</b> 번호를 입력해 주세요.<br>"																													+ 
				"감사합니다.</p>"																																																	+ 
				"<div style=\"text-align:center;\">"	+
				"<p style=\"width:310px; height:45px; color:#fff; margin:30px 5px 40px; background:#02b875; line-height:45px; vertical-align:middle; font-size:16px;\">" + 
				"메일 인증 비밀번호 : "+pwCode+"</p>"	+ 
				"</div>"																																																	+
				"<div style=\"border-top: 4px solid #DDD; padding: 5px;\"></div>"+
				"</div>"
		);
        emailTxt.append("</body>");
        emailTxt.append("</html>");
		return emailTxt.toString();
	}
	
	
	//비밀번호 생성
	public String getCreateKey() {
		String pwCode="";
		char[] charSet = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx=0;
		for(int i=0;i<10;i++) {
			idx=(int)(Math.random()*36); //  0-35
			pwCode += charSet[idx];      //  0h14f4rga
		}
		return pwCode;
	}

}//class