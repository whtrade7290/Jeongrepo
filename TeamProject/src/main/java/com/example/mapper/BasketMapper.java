package com.example.mapper;

import java.util.List;

import com.example.domain.BasketVo;

public interface BasketMapper {

   // 장바구니 단일 상품 제거
   void deleteOne(String consumerId, String goodsName);

   // 장바구니 목록 추가
   void addBasket(String consumerId, String goodsName, int amount);

   // 회원 장바구니 정보 불러오기
   List<BasketVo> getMemberBasket(String consumerId);

   // 장바구니 선택 상품 제거
   void deleteSelection(String consumerId, List<String> delGoodsNames);
   
   // 장바구니 업데이트 하기
   void updateCart(List<BasketVo> basketVos);
   
   void deleteCartById(String id);

}