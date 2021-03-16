package com.example.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsVo {
	private int num;
	private String goodsName;
	private String subGoods;
	private String mainCategory;
	private String subCategory;
	private int salePrice;
	private int originPrice;
	private int discountRate;
	private String salesUnit;
	private String volume;
	private String delClassification;
	private String packingType;
	private String allergy;
	private String shelfLife;
	private String contents1;
	private String contents2;
	private String fileUrl;
	private Timestamp upload;
	
	private List<AttachVo> attachList;  // JOIN 쿼리 1:N 관계

}
