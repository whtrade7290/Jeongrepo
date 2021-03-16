package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BasketVo;
import com.example.domain.MemberVo;
import com.example.domain.OrderDetailsVo;
import com.example.domain.OrderHistoryVo;

public interface MemberMapper {

	// 회원가입
	void addMember(MemberVo memberVo);

	// 아이디 중복확인
	int getCountById(String id);

	// 아이디 찾기
	String getFindId(@Param("name") String name, @Param("email") String email);
	
	// 비밀번호 찾기
	String getCountFindPw(String name, String id, String email);

	// 로그인
	String userCheck(String id);

	// 로그인된상태
	String userCheck1(String id);
	
	void addRandom(String randomNum);
	
	void randomTruncate();
	
	int getCountByPushId(String id);
	
	int getCountRandomNum(String randomNum);
	
	// 회원정보 가져오기
	MemberVo getMemberByID(String id);
	
	// 주문내역 추가하기
	void addOrderDetails(List<OrderHistoryVo> orderHistoryVoList);
	
	void addOrderDetailsPerPayment(String id, String orderId, String orderDetailTitle, int totalSalePrice);

	List<OrderDetailsVo> getOrderDetails(String id);

	List<OrderHistoryVo> getOrderHistory(String id, String orderId);
	
	MemberVo getJQuestionById(String id);
	
	MemberVo getMemberInfo(String id);
	
}
