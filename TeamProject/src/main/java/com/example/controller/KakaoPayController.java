package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.BasketVo;
import com.example.domain.OrderHistoryVo;
import com.example.service.BasketService;
import com.example.service.KakaoPayServiece;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class KakaoPayController {

	@Autowired
	private KakaoPayServiece kakaoPayServiece;
	
	@Autowired
	private BasketService basketService;

	
	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("jolly_user_id") String id, @RequestParam("pg_token") String pg_token, Model model) {

		log.info("================== kakaoPaySuccess(get) ==================");
		log.info("kakaoPaySuccess   id: " + id);
		log.info("kakaoPaySuccess   pg_token: " + pg_token);
		
		List<BasketVo> basketVoList = basketService.getMemberBasket(id);
		List<OrderHistoryVo> orderHistoryVoList = new ArrayList<>();
		String orderId = UUID.randomUUID().toString();
		
		for (BasketVo basketVo : basketVoList) {
			
			OrderHistoryVo orderHistoryVo = new OrderHistoryVo();
			
			orderHistoryVo.setBuyer(id);
			orderHistoryVo.setProduct(basketVo.getGoodsName());
			orderHistoryVo.setQuantity(basketVo.getAmount());
			orderHistoryVo.setSalePrice(basketVo.getSalePrice() * basketVo.getAmount());
			orderHistoryVo.setOrderId(orderId);
			
			System.out.println("oderHistoryVo...: " + orderHistoryVo.toString());
			
			orderHistoryVoList.add(orderHistoryVo);
			
			System.out.println("orderHistoryVoList: " + orderHistoryVoList.toString());
		}
		
		String orderDetailTitle = basketVoList.get(0).getGoodsName();
		int totalSalePrice = basketVoList.get(0).getSalePrice();
		int orderSize = basketVoList.size();
		
		if (orderSize > 1) {
			orderDetailTitle = orderDetailTitle + "외" + (orderSize - 1) + "건";
			
			totalSalePrice = 0;
			for (BasketVo basketVo : basketVoList) {
				totalSalePrice += (basketVo.getSalePrice() * basketVo.getAmount());
			}
		}
		
		kakaoPayServiece.afterPayment(id, orderId, orderDetailTitle, totalSalePrice, orderHistoryVoList, basketVoList);
		
		return "redirect:/consumerBoard/cboard?id=" + id;

	}

	@PostMapping("/kakaoPay")
	public String kakaoPay(@RequestParam(name = "id") String id) {
		log.info("================== kakaoPay(post) ==================");
		
		System.out.println("id: " + id);
		
		List<BasketVo> basketVoList = basketService.getMemberBasket(id);
		
		System.out.println("basketVoList: " + basketVoList);
		
		return "redirect:" + kakaoPayServiece.kakaoPayReady(id, basketVoList);

	}

}
