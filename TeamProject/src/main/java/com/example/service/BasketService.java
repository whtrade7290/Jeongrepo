package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BasketVo;
import com.example.mapper.BasketMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class BasketService {

   @Autowired
   private BasketMapper basketMapper;

   public void addBasket(String consumerId, String goodsName, int amount) {

      basketMapper.deleteOne(consumerId, goodsName);
      basketMapper.addBasket(consumerId, goodsName, amount);

   }

   public List<BasketVo> getMemberBasket(String consumerId) {
      return basketMapper.getMemberBasket(consumerId);
   }
   
   public List<BasketVo> DeleteAndBasketListLoad(int cartId, String consumerId, String goodsName) {
      basketMapper.deleteOne(consumerId, goodsName);
      return basketMapper.getMemberBasket(consumerId);
   }
   
   public List<BasketVo> DeleteSelectionAndBasketListLoad(String consumerId, List<String> delGoodsNames) {
      basketMapper.deleteSelection(consumerId, delGoodsNames);
      return basketMapper.getMemberBasket(consumerId);
   }
   
   public void updateCart (List<BasketVo> basketVos) {
	   
	   System.out.println("updateCart Serviece basketVos: " + basketVos);
	   basketMapper.updateCart(basketVos);
	   
   }

}