package com.example.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.service.MailService;
import com.example.service.MemberService;

import lombok.extern.java.Log;

@Log
@RequestMapping("/mail/*")
@Controller
public class MailController {

	@Autowired
	private MailService mailService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/doSend")
	@ResponseBody
	public String doSend(String email) {

		Random random = new Random();

		String randomNum = "" + random.nextInt(10000);

		if (randomNum.length() != 5) {
			int addNum = 5 - randomNum.length();
			if (addNum > 0) {
				for (int i = 0; i < addNum; i++) {
					randomNum = "0" + randomNum;
					System.out.println("randomNum == " + randomNum);
				}
			}
		}

		Map<String, Object> sendRs = mailService.send(email, randomNum);

		memberService.addRandom(randomNum);

		return (String) sendRs.get("msg");
	}
	
	@RequestMapping("/pwFindSend")
	@ResponseBody
	public String pwFindSend(String email, String pw) {

		log.info("email = " + email);
		
		Map<String, Object> sendRs = mailService.pwFindSend(email, pw);

		return (String) sendRs.get("msg");
	}
}