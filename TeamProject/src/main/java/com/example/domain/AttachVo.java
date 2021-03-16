package com.example.domain;

import lombok.Data;

@Data
public class AttachVo {

	private int num;
	private String uuid;
	private String filename1;
	private String uploadpath;
	private String image;
	private String attachName;
	private String main;
	
	// 상품 뿌려주기
	private String goodsName;
	private String subGoods;
	private String mainCategory;
	private String subCategory;
	private int salePrice;
	private int originPrice;
	private int discountRate;
}