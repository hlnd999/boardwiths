package com.kh.boardwiths.admin.common;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage msg;
	private MimeMessageHelper msgHelper;
	
	// 생성자
	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		msg = this.mailSender.createMimeMessage();
		msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
	}
	
	// 이메일 제목
	public void setSubject(String subject) throws MessagingException {
		msgHelper.setSubject(subject);
	}
	
	// 이메일 내용(text)
	public void setText(String htmlContent) throws MessagingException {
		msgHelper.setText(htmlContent, true);
	}
	
	// 송신자 정보
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		msgHelper.setFrom(email, name);
	}
	
	// 수신자 정보
	public void setTo(String email) throws MessagingException {
		msgHelper.setTo(email);
	}
	
	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		msgHelper.addInline(contentId, dataSource);
	}
	
	// 메일 전송시키는 메소드
	public void send() {
		try {
			mailSender.send(msg);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
