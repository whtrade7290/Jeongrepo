package com.example.mapper;

import java.util.List;

import com.example.domain.AttachVo;
import com.example.domain.BasketVo;
import com.example.domain.GoodsVo;



public interface GoodsMapper {

//	 전체 상품 가져오기
	List<AttachVo> getNewGoods();
	
	List<AttachVo> getBestGoods();
	
	List<AttachVo> getRowPriceGoods();
	
	List<AttachVo> getDiscountPriceGoods();
	
	List<AttachVo> getMainCategory(String mainCategory);
	
	List<AttachVo> getSubCategory(String mainCategory, String subCategory);
	
	GoodsVo getJollygoodsAndAttaches(String goodsName);

	void goodsWrite(GoodsVo goodsVo);
	
	void deleteGoodsByName(String goodsName);
	
	void updateGoods(GoodsVo goodsVo);
	
	void updateSaleQ(List<BasketVo> basketVoList);
	
	List<AttachVo> getGoodsSerch(String goodsSerch);

}
