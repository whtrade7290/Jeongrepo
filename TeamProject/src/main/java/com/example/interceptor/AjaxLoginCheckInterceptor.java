package com.example.interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.google.gson.Gson;

@Component
public class AjaxLoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			return true;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("isLogin", false);
		
		Gson gson = new Gson();
		String strJson = gson.toJson(map);
		
		System.out.println("strJson: " + strJson);
		
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println(strJson);
		out.close();
		
		return false;
		
	}
	
}
