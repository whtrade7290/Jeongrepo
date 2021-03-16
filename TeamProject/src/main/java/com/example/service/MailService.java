package com.example.service;

import java.util.Map;

public interface MailService {
	// 인증메일
	public Map<String, Object> send(String email, String randomNum);
	
	// 비밀번호 확인 메일
	public Map<String, Object> pwFindSend(String email, String pw);
}