package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ProductReviewVo;
import com.example.mapper.ProductReviewMapper;

@Service
@Transactional
public class ProductReviewService {

	@Autowired
	private ProductReviewMapper productReviewMapper;

	// 리뷰게시판 쓰기
	public void addProductReview(ProductReviewVo productReviewVo) {
		productReviewMapper.addProductReview(productReviewVo);
	}

	// 선택한 상품에 대한 게시물 모두 가져오기
	public List<ProductReviewVo> getProductReviewByname(String goodsPk) {
		return productReviewMapper.getProductReviewByname(goodsPk);
	}

	// 모든 리뷰게시글 가져오기
	public List<ProductReviewVo> getProductReviewAll() {
		return productReviewMapper.getProductReviewAll();
	}

	// 게시물 갯수가져오기
	public int getCountAll() {
		int count = productReviewMapper.getCountAll();
		return count;
	}

	// 해당 리뷰 게시글 삭제하기
	void deleteProductReviewByNum(int num) {
		productReviewMapper.deleteProductReviewByNum(num);
	}

	// 해당 카테고리 리뷰게시물 삭제하기
	void deleteCategoryProductReview(String goodsPk) {
		productReviewMapper.deleteCategoryProductReview(goodsPk);
	}

	// 모든 리뷰게시글 삭제하기
	void deleteAllProductReview() {
		productReviewMapper.deleteAllProductReview();
	}

	// 조회수 증가시키고 업데이트하기
	void updatelookupcount(int num) {
		productReviewMapper.updatelookupcount(num);
	}

	// 해당 리뷰게시물 업데이트(수정) 하기
	void updateProductReview(ProductReviewVo productReviewVo) {
		productReviewMapper.updateProductReview(productReviewVo);
	}
}
