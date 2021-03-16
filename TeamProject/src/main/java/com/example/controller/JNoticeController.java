package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.JNoticeVo;
import com.example.service.JNoticeService;

@Controller
@RequestMapping("/jnotice/*")
public class JNoticeController {

	@Autowired
	private JNoticeService jnoticeService;

	@GetMapping("/content")
	public String content(int num, String pageNum, Model model) {
		JNoticeVo jnoticeVo = jnoticeService.getJNoticeByNum(num);

		String content = "";
		if (jnoticeVo.getContent() != null) {
			content = jnoticeVo.getContent().replace("\n", "<br>");
			jnoticeVo.setContent(content);
		}

		model.addAttribute("jnoticeVo", jnoticeVo);
		model.addAttribute("pageNum", pageNum);

		return "userBoard/jcontent";
	}
}