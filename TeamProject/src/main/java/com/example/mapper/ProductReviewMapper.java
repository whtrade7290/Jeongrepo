package com.example.mapper;

import java.util.List;

import com.example.domain.ProductReviewVo;

public interface ProductReviewMapper {

	// ========================================select

	List<ProductReviewVo> getProductReviewByname(String goodsPk); // 선택한 상품에 대한 게시글 모두 가져오기

	List<ProductReviewVo> getProductReviewAll(); // 모든 상품에 대한 리뷰게시물 가져오기

	int getCountAll(); // 게시글 갯수 가져오기

	// ========================================select

	// ========================================insert

	void addProductReview(ProductReviewVo productReviewVo); // 리뷰 게시글 한개 insert하기

	// ========================================insert

	// ========================================delete

	void deleteProductReviewByNum(int num); // 해당 리뷰게시글 삭제하기

	void deleteCategoryProductReview(String goodsPk); // 해당 카테고리 리뷰게시글 삭제하기

	void deleteAllProductReview(); // 모든 리뷰게시글 삭제하기

	// ========================================delete

	// ========================================update

	void updatelookupcount(int num); // 조회수 증가시키고 업데이트하기

	void updateProductReview(ProductReviewVo productReviewVo); // 리뷰게시글 업데이트하기

	// ========================================update

}
