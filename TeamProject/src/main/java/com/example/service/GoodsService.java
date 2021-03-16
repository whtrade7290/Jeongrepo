package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.AttachVo;
import com.example.domain.GoodsVo;

import com.example.mapper.AttachMapper;
import com.example.mapper.GoodsMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private AttachMapper attachMapper;

//	public List<GoodsVo> getAllGoods() {
//		List<GoodsVo> goodsVos = goodsMapper.getAllGoods();
//		return goodsVos;
//	}

	public List<AttachVo> getNewGoods() {
		List<AttachVo> attachVos = goodsMapper.getNewGoods();
		return attachVos;
	}

	public List<AttachVo> getBestGoods() {
		List<AttachVo> attachVos = goodsMapper.getBestGoods();
		return attachVos;
	}

	public List<AttachVo> getRowPriceGoods() {
		List<AttachVo> attachVos = goodsMapper.getRowPriceGoods();
		return attachVos;
	}

	public List<AttachVo> getDiscountPriceGoods() {
		List<AttachVo> attachVos = goodsMapper.getDiscountPriceGoods();
		return attachVos;
	}

	public List<AttachVo> getMainCategory(String mainCategory) {
		List<AttachVo> attachVos = goodsMapper.getMainCategory(mainCategory);
		return attachVos;
	}

	public List<AttachVo> getSubCategory(String mainCategory, String subCategory) {
		List<AttachVo> attachVos = goodsMapper.getSubCategory(mainCategory, subCategory);
		return attachVos;
	}

	public GoodsVo getJollygoodsAndAttaches(String goodsName) {
		return goodsMapper.getJollygoodsAndAttaches(goodsName);
	}

//  게시판 주글 쓰기
	public void addGoodsAndAttaches(GoodsVo goodsVo, List<AttachVo> attachList) {
		goodsMapper.goodsWrite(goodsVo);

		for (AttachVo attachVo : attachList) {
			attachMapper.insertAttach(attachVo);
		}
	}

	public void ckUpload(AttachVo attachVo) {

		attachMapper.insertAttach(attachVo);

	}

	@Transactional
	public void deleteGoodsAndAttaches(String goodsName) {
		goodsMapper.deleteGoodsByName(goodsName);
		attachMapper.deleteAttachesByName(goodsName);
	}

//	@Transactional
	public int updateGoodsAndAddAttachesAndDeleteAttaches(GoodsVo goodsVo, List<AttachVo> attachList) {
		int result = 0;
		goodsMapper.updateGoods(goodsVo);

		for (AttachVo attachVo : attachList) {
			result = attachMapper.insertAttach(attachVo);
		}
//		
//		if (delFileNums != null) {
//			attachMapper.deleteAttachesByNums(delFileNums);
//		}
		return result;
	}

//	public void setgoodsMapper(GoodsMapper goodsMapper) {
//		this.goodsMapper = goodsMapper;
//	}

	public List<AttachVo> getGoodsSerch(String goodsSerch) {
		List<AttachVo> attachVos = goodsMapper.getGoodsSerch(goodsSerch);
		return attachVos;
	}

}
