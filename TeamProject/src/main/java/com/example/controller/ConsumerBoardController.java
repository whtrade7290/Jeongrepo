package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.MemberVo;
import com.example.domain.OrderDetailsVo;
import com.example.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/consumerBoard/*")
public class ConsumerBoardController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/cboard")
	   public void cboard(String id, Model model) {
	      log.info("cobard===================호출됨");
	      
	      MemberVo memberVo = memberService.getMemberInfo(id);
	      
	      List<OrderDetailsVo> orderDetailsVos = memberService.getOrderDetails(id);
	      
	      model.addAttribute("orderDetailsVos", orderDetailsVos);
	      model.addAttribute("memberVo", memberVo);
	   }
	
	@GetMapping("/shipping")
	   public void shipping(HttpSession session, Model model) {
	      
	      String id = (String) session.getAttribute("id");
	      
	      MemberVo memberVo = memberService.getMemberInfo(id);
	      
	      model.addAttribute("memberVo", memberVo);
	      
	      log.info("shipping=================호출됨");
	   }
	
	@GetMapping("/alwaysLiving")
	public void alwaysLiving() {
		log.info("alwaysLiving=============호출됨");
	}
	
	@GetMapping("/goodsReview")
	public void goodsReview() {
		log.info("goodsReview==============호출됨");
	}
	
	@GetMapping("/savings")
	public void savings() {
		log.info("savings==================호출됨");
	}
	
	@GetMapping("/coupon")
	public void coupon() {
		log.info("coupon===================호출됨");
	}
	
	@GetMapping("/memberUpdate")
	   public void memberUpdate(HttpSession session, Model model) {
	      
	      String id = (String) session.getAttribute("id");
	      
	      MemberVo memberVo = memberService.getMemberInfo(id);
	      
	      model.addAttribute("memberVo", memberVo);
	      
	      log.info("memberUpdate=============호출됨");
	   }
}