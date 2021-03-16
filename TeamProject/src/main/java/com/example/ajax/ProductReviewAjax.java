package com.example.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.ProductReviewVo;
import com.example.service.ProductReviewService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/ProductReview/*")
@Log
public class ProductReviewAjax {

	@Autowired
	private ProductReviewService productReviewService;
	
	@GetMapping("/Review/list/{두부}")
	public ResponseEntity<Map<String, Object>> list(@PathVariable("두부") String name){
		
		int totalcount = productReviewService.getCountAll();
		
		Map<String, Object> map = new HashMap<>();
		
		List<ProductReviewVo> productReviewList = productReviewService.getProductReviewByname(name);
		
		log.info("productReviewList" + productReviewList);
		log.info("totalcount" + totalcount);
		
		map.put("productReviewList", productReviewList);
		map.put("totalCount", totalcount);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
}
