package com.example.domain;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BasketVo {
   
   private int cartId;
   private String consumerId;
   private String goodsName;
   private int amount;
   private int salePrice;
   private int originPrice;
   private String uuid;
   private String filename1;
   private String uploadpath;
   
}