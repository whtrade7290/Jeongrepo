package com.example.service;


import java.util.HashMap;
import java.util.Map;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.handler.MailHandler;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender sender;

	public Map<String, Object> send(String email, String randomNum) {

		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("no-reply@norepy.com", "StoreJolly");
			mail.setTo(email);
			mail.setSubject("Store Jolly 인증메일 입니다.");
			mail.setText("고객님의 인증번호는 " + randomNum + " 입니다.<br>" + "정확하게 입력부탁드립니다.");
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String resultCode = "S-1";
		String msg = "메일이 발송되었습니다.<br>" + "<script language='javascript'>" + "alert('인증메일이 발송 되었습니다.');"
				+ "self.close();" + "</script>";
		
		// 맵을 여러개 발송 아래의 코드와 같음(36행과 , 40행(그루비 Maps))
      Map<String, Object> rs = new HashMap<>();
      rs.put("resultCode", resultCode);
      rs.put("msg", msg);
      
      return rs;
//		return Maps.of("resultCode", resultCode, "msg", msg);
	}
	
	public Map<String, Object> pwFindSend(String email, String pw) {

		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("no-reply@norepy.com", "StoreJolly");
			mail.setTo(email);
			mail.setSubject("Store Jolly 비밀번호 찾기 메일입니다.");
			mail.setText("고객이 찾으시는 비밀번호는 [" + pw + "] 입니다.<br>" + "정확하게 입력부탁드립니다.");
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String resultCode = "S-1";
		String msg = "메일이 발송되었습니다.<br>" + "<script language='javascript'>" + "alert('인증메일이 발송 되었습니다.');"
				+ "self.close();" + "</script>";
		
      Map<String, Object> rs = new HashMap<>();
      rs.put("resultCode", resultCode);
      rs.put("msg", msg);
      
      return rs;
	}
	
}