package com.example.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BasketVo;
import com.example.domain.MemberVo;
import com.example.domain.OrderHistoryVo;
import com.example.service.BasketService;
import com.example.service.MemberService;
import com.google.gson.Gson;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BasketService basketService;

	@GetMapping("/joinView")
	public void joinView() {
	}

	@PostMapping(value = "/joinView", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public void joinView(HttpServletRequest request) throws IOException {
		log.info("Post - joinView() 호출됨");

		Gson gson = new Gson();

		BufferedReader reader = request.getReader(); // http메시지 body에서 JSON 문자열 가져오기
		MemberVo memberVo = gson.fromJson(reader, MemberVo.class);

		reader.close();

//	       회원가입 날짜 설정
		memberVo.setRegDate(new Timestamp(System.currentTimeMillis()));

		log.info("memberVo : " + memberVo);

		memberService.addMember(memberVo);

	}

	// 최종적으로 이 메서드가 요청하는 메서드를 클라이언트쪽에 어떠한 응답을 줄것인가 정하는것.
	@GetMapping(value = "/idDupChk", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody // 리턴 객체를 JSON 문자열로 변환해서 응답을 줌
	public Map<String, Boolean> ajaxJoinIdDupChk(String id) { // 제이슨문자열을 통으로 줄때는 @RequstBody애노테이션을 매개변수앞에 써줌

		log.info("Dubid = " + id);

		int count = memberService.getCountById(id);

		Map<String, Boolean> map = new HashMap<>();
		if (count == 0) {
			map.put("isIdDup", false);
		} else {
			map.put("isIdDup", true);
		}

		return map;

	}

	@GetMapping(value = "/pushIdDupChk", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }) // 최종적으로 이메서드가 요청하는 메서드를 클라이언트쪽에 어떠한응답을 줄것인가? 정하는것
	@ResponseBody // 리턴 객체를 JSON 문자열로 변환해서 응답을 줌
	public Map<String, Boolean> ajaxPushIdDupChk(String id) { // 제이슨문자열을 통으로 줄때는 @RequstBody애노테이션을 매개변수앞에 써줌

		log.info("Pushid = " + id);

		int count = memberService.getCountPushId(id);

		// id가 null이면 무조건 0
		// where조건이 공백이면 적립금이 들어가지 않도록.
		if (id.isEmpty()) {
			count = 0;
		}

		Map<String, Boolean> map = new HashMap<>();
		if (count == 0) {
			map.put("isIdDup", false);
		} else {
			map.put("isIdDup", true);
		}

		return map;

	}

	@GetMapping(value = "/randomNum", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody // 리턴 객체를 JSON 문자열로 변환해서 응답을 줌
	public Map<String, Boolean> randomNumChk(String randomNum) { // 제이슨문자열을 통으로 줄때는 @RequstBody애노테이션을 매개변수앞에 써줌

		log.info("RandomNum = " + randomNum);

		int count = memberService.getCountRandomNum(randomNum);

		Map<String, Boolean> map = new HashMap<>();
		if (count == 0) {
			map.put("isIdDup", false);
		} else {
			map.put("isIdDup", true);
		}

		// 테이블 전체 비우기(조회 성공 했을때만 실행)
		if (count == 1) {
			memberService.randomTruncate();
		}

		return map;
	}

	@GetMapping("/login")
	public void login() {
		log.info("GET - login() 호출됨");

	}

	@GetMapping("/modifyInfo")
	public void modifyInfo() {
		log.info("GET - modifyInfo() 호출됨");

	}

	@GetMapping("/modifyInfo2")
	public void modifyInfo2() {
		log.info("GET - modifyInfo2() 호출됨");

	}

	@GetMapping("/Findpass")
	public void Findpass() {
		log.info("GET - Findpass() 호출됨");
	}

	@GetMapping("/findPwResultView")
	public void findPwResultView() {
		log.info("GET - Findpass() 호출됨");
	}

	@PostMapping("/login")
	public ResponseEntity<String> login(String id, String pw,
			@RequestParam(name = "chk_security", defaultValue = "false") boolean keepLogin, HttpSession session,
			HttpServletResponse response) {

		System.out.println("keepLogin: " + keepLogin);

		String name = memberService.userCheck1(id);

		log.info("name = " + name);
		int check = memberService.userCheck(id, pw);

		if (check != 1) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");

			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("  alert('아이디 또는 패스워드가 일치하지 않습니다.');");
			sb.append("  history.back();");
			sb.append("</script>");

			return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
		}

		session.setAttribute("id", id); // 세션에 id 추가(로그인 됨)
		session.setAttribute("name", name);

		if (keepLogin) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 10);
			cookie.setPath("/");

			Cookie cookie2 = new Cookie("name", name);
			cookie2.setMaxAge(60 * 10);
			cookie2.setPath("/");

			response.addCookie(cookie);
			response.addCookie(cookie2);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/"); // 리다이렉트 경로를 Location으로 설정
		// 리다이렉트일 경우는 HttpStatus.FOUND 를 지정해야 함
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // login

	@GetMapping("/loginupdate")
	public void loginupdate() {
		log.info("GET - loginupdate() 호출됨");
	}

	@GetMapping("/findIdresutView")
	public void findIdresutView() {
		log.info("GET - login() 호출됨");

	}

	@PostMapping("/loginfind")
	   public String loginfind(Model model, String name, String email, HttpServletResponse response) throws IOException {
	      log.info("GET - loginfind() 호출됨");

	      String id = memberService.getFindId(name, email);
	      log.info("id : " + id);
	      if (id == null) {
	         //PrintWriter out 먼저 적어줘야 한글처리 가능
	         response.resetBuffer();
	         response.setCharacterEncoding("UTF-8");
	         response.setContentType("text/html;charset=UTF-8");
	         
	         PrintWriter out=response.getWriter();
	         
	         out.println("<script>"
	               + " alert('확인되지 않는 사용자 정보입니다.'); "
	               + " history.back(); "
	               + "</script>");
	         
	         response.flushBuffer();
	         
	         return "/member/findIdresutView";
	      }
	      
	      model.addAttribute("id", id);
	      
	      return "/member/findIdresutView";
	   }

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		// 세션 초기화
		session.invalidate();

		// 로그인 상태유지용 쿠키가 존재하면 삭제
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id")) {
					cookie.setMaxAge(0); // 유효시간 0
					cookie.setPath("/"); // 경로는 생성할때와 동일하게 설정해야 삭제됨

					response.addCookie(cookie); // 삭제할 쿠키정보를 추가
				}
			}

		}

		return "redirect:/";
	} // logout

	@GetMapping("/cart")
	public String cart(@RequestParam(name = "id") String consumerID, Model model) {

		Gson gson = new Gson();

		List<BasketVo> basketVoList = basketService.getMemberBasket(consumerID);

		String strbasketVos = gson.toJson(basketVoList);

		model.addAttribute("strbasketVos", strbasketVos);

		System.out.println("strbasketVos: " + strbasketVos);

		return "/goods/cart";

	}

	@PostMapping("/orderSheet")
	public String orderSheet(@RequestParam(name = "id") String consumerID, Model model) {
		log.info("================== kakaoPay(post) ==================");

		Gson gson = new Gson();

		List<BasketVo> basketVoList = basketService.getMemberBasket(consumerID);
		MemberVo memberVo = memberService.getMemberByID(consumerID);

		String strbasketVos = gson.toJson(basketVoList);

		model.addAttribute("strbasketVos", strbasketVos);
		model.addAttribute("memberVo", memberVo);

		System.out.println("strbasketVos: " + strbasketVos);

		return "/goods/orderSheet";

	}

	@GetMapping("/orderDetail")
	public void orderDetail(String id, String orderId, Model model) {
		log.info("GET - test() 호출됨" + id + "," + orderId);

		List<OrderHistoryVo> orderHistoryVos = memberService.getOrderHistory(id, orderId);

		System.out.println("orderHistoryVos: " + orderHistoryVos);

		model.addAttribute("orderHistoryVos", orderHistoryVos);
	}

	@PostMapping("/getCountFindPw")
	public String getCountFindPw(Model model, HttpServletResponse request, HttpServletResponse response, String name,
			String id, String email) throws IOException {
		String pw = memberService.getCountFindPw(name, id, email);

		log.info("pw = " + pw);

		if (pw == null) {

			// PrintWriter out 먼저 적어줘야 한글처리 가능
			response.resetBuffer();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>" + " alert('확인되지 않는 사용자 정보입니다.'); " + " history.back(); " + "</script>");

			response.flushBuffer();

			return "/member/findPwResultView";
		}

		model.addAttribute("pw", pw);
		model.addAttribute("email", email);

		return "/member/findPwResultView";
	}

}
