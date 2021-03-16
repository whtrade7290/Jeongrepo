package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BasketVo;
import com.example.domain.MemberVo;
import com.example.domain.OrderDetailsVo;
import com.example.domain.OrderHistoryVo;
import com.example.mapper.MemberMapper;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class MemberService {

	// 스프링 빈으로 등록된 객체중에서
	// 타입으로 객체의 참조를 가져와서 참조변수에 저장
	@Autowired
	private MemberMapper memberMapper;

	public void addMember(MemberVo memberVo) {
		memberMapper.addMember(memberVo);
	}

	public int getCountById(String id) {
		int count = memberMapper.getCountById(id);
		return count;
	}

	// 비밀번호 찾기
	public String getCountFindPw(String name, String id, String email) {
		String pw = memberMapper.getCountFindPw(name, id, email);
		return pw;
	}

	public int userCheck(String id, String pw) {
		int check = -1;

		String Passwd = memberMapper.userCheck(id);

		if (Passwd != null) {
			if (pw.equals(Passwd)) {
				check = 1;
			} else {
				check = 0;
			}
		} else { // dbPasswd == null
			check = -1;
		}
		return check;
	}

	public String getFindId(String name, String email) {
		String id = memberMapper.getFindId(name, email);
		return id; // 아이디 찾기
	}

	public String userCheck1(String id) {

		String name = memberMapper.userCheck1(id);
		return name;
	}

	public int getCountPushId(String id) {
		int count = memberMapper.getCountByPushId(id);
		return count;
	}

	public int getCountRandomNum(String randomNum) {
		int count = memberMapper.getCountRandomNum(randomNum);
		return count;
	}

	public void randomTruncate() {
		memberMapper.randomTruncate();
	}

	public void addRandom(String randomNum) {
		memberMapper.addRandom(randomNum);
	}

	public MemberVo getMemberByID(String id) {
		MemberVo memberVo = memberMapper.getMemberByID(id);
		return memberVo;
	}

	public List<OrderDetailsVo> getOrderDetails(String id) {
		return memberMapper.getOrderDetails(id);
	}

	public List<OrderHistoryVo> getOrderHistory(String id, String orderId) {
		return memberMapper.getOrderHistory(id, orderId);
	}
	
	   public MemberVo getJQuestionById(String id) {
		      MemberVo memberVo = memberMapper.getJQuestionById(id);
		      return memberVo;
		   }
	   
	   public MemberVo getMemberInfo(String id) {
           MemberVo memberVo = memberMapper.getMemberInfo(id);
           return memberVo;
        }

}
