package com.kh.boardwiths.admin.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UsersSearchInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// dailyInfoSearch.ad 의 요청을 가로챌 인터셉터 작성
		// 시작날짜와 종료날짜를 모두 선택하지 않거나, 모두 선택하는 경우를 정상적인 경우로 판단해야한다.
		String beginDt = request.getParameter("beginDt");
		String endDt = request.getParameter("endDt");
		HttpSession session = request.getSession();
		if(beginDt != null && endDt != null) {
			if(beginDt.equals("") || endDt.equals("")) {
				session.setAttribute("msg", "시작날짜와 종료날짜는 모두 선택하거나, 모두 선택하지 않아야 합니다.");
				response.sendRedirect("weekSearchUsers.ad");
				return false;
			}
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
