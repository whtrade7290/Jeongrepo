package com.example.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.example.domain.BasketVo;
import com.example.domain.KakaoPayReadyDto;
import com.example.domain.OrderHistoryVo;
import com.example.mapper.BasketMapper;
import com.example.mapper.GoodsMapper;
import com.example.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class KakaoPayServiece {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BasketMapper basketMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	private static final String HOST = "https://kapi.kakao.com";
	private KakaoPayReadyDto kakaoPayReadyDto;
	
	public String kakaoPayReady(String id, List<BasketVo> basketVoList) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "1f8d0c292d9b1a1dd01d69dba9e40449");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        int totalPrice = 0;
        for (BasketVo basketVo : basketVoList) {
        	totalPrice += basketVo.getSalePrice() * basketVo.getAmount();
        }
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        if (basketVoList.size() > 1) {
        	params.add("item_name", basketVoList.get(0).getGoodsName() + "외" + (basketVoList.size() - 1) + "건");
        } else {
        	params.add("item_name", basketVoList.get(0).getGoodsName());
        }
        params.add("quantity", "1");
        params.add("total_amount", Integer.toString(totalPrice));
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8083/kakaoPaySuccess?jolly_user_id=" + id);
        params.add("cancel_url", "http://localhost:8083/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8083/kakaoPaySuccessFail");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
			kakaoPayReadyDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDto.class);
			
			log.info("kakaoPayReadyDto: " + kakaoPayReadyDto);
			
			return kakaoPayReadyDto.getNext_redirect_pc_url();
			
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		return "/pay";
	}

	public void afterPayment(String id, String orderId, String orderDetailTitle, int totalSalePrice, List<OrderHistoryVo> orderHistoryVoList, List<BasketVo> basketVoList) {

		memberMapper.addOrderDetailsPerPayment(id, orderId, orderDetailTitle, totalSalePrice);
		memberMapper.addOrderDetails(orderHistoryVoList);
		goodsMapper.updateSaleQ(basketVoList);
		basketMapper.deleteCartById(id);
		
	}
	
}
