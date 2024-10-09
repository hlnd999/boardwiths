package com.kh.boardwiths.admin.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.boardwiths.admin.model.exception.AdminException;

public class DailySearchInterceptor implements HandlerInterceptor{
	@Override // 메소드 실행 전 전달받은 파라미터의 확인
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String beginDt = request.getParameter("beginDt"); // 파라미터가 비어져있을 때는 ""로 찍힘
		String endDt = request.getParameter("endDt");
		if(beginDt != null && endDt != null) {
			if(beginDt.equals("") || endDt.equals("")) throw new AdminException("검색 조건을 다시 확인해주세요.");
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
