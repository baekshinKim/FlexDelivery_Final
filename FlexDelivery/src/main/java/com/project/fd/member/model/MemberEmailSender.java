package com.project.fd.member.model;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MemberEmailSender {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String subject,String content,String receiver,
			String sender) throws MessagingException { //이름 아무렇게나 만드셈
		MimeMessage mimeMsg=mailSender.createMimeMessage();
		mimeMsg.setSubject(subject);
		//mimeMsg.setText(content);
		//--이메일 내용에 태그 적용하기
		//void setText(String text, String charset, String subtype)
		mimeMsg.setText(content, "utf-8","html");
		mimeMsg.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		mimeMsg.setFrom(new InternetAddress(sender));
		mailSender.send(mimeMsg);
	}
}
