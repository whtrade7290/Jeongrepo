package com.example.domain;



import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailsVo {
   
   private int num;
   private String orderId;
   private String orderDetailTitle;
   private int totalPrice;
   private String buyer;
   private Timestamp regDate;
   
}