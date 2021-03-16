package com.example.domain;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderHistoryVo {
   
   private int num;
   private String buyer;
   private String product;
   private int quantity;
   private int salePrice;
   private String orderId;
   
}