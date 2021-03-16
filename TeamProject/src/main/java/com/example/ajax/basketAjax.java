package com.example.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.BasketVo;
import com.example.service.BasketService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/basket/*")
@Log
public class basketAjax {

	@Autowired
	private BasketService basketService;

	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public void add(@RequestBody Map<String, Object> params, HttpSession session) {
		String consumerId = (String) session.getAttribute("id");

		basketService.addBasket(consumerId, (String) params.get("goodsName"), (int) params.get("amount"));
	}

	@DeleteMapping(value = "/delItem")
	public ResponseEntity<Map<String, Object>> delSingleItem(@RequestBody BasketVo basketVo) {
		System.out.println("basketVo: " + basketVo);
		List<BasketVo> basketVoList = basketService.DeleteAndBasketListLoad(basketVo.getCartId(),
				basketVo.getConsumerId(), basketVo.getGoodsName());

		Map<String, Object> map = new HashMap<>();
		map.put("basketVoList", basketVoList);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	@DeleteMapping(value = "/delItems")
	public ResponseEntity<Map<String, Object>> delSingleItem(@RequestBody Map<String, Object> params) {
		System.out.println("params: " + params);

		String consumerId = (String) params.get("consumerId");
		List<String> delGoodsNames = (List<String>) params.get("delGoodsNames");

		List<BasketVo> basketVoList = basketService.DeleteSelectionAndBasketListLoad(consumerId, delGoodsNames);

		Map<String, Object> map = new HashMap<>();
		map.put("basketVoList", basketVoList);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	@PostMapping(value = "/updateCart")
	public void updateCart(@RequestBody Map<String, Object> params) {
		
		System.out.println("updateCart, params: " + params);
		System.out.println("updateCart, params.get(\"basketVoList\"): " + params.get("basketVoList"));
		
		List<BasketVo> basketVos = (List<BasketVo>) params.get("basketVoList");
		
		basketService.updateCart(basketVos);
		
		System.out.println("test99, basketVos: " + basketVos);
		
	}

}