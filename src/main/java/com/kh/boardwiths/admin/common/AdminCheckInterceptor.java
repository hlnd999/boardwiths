package com.kh.boardwiths.admin.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.boardwiths.users.model.vo.Users;

public class AdminCheckInterceptor implements HandlerInterceptor{
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception { // 관리자 컨텐츠 요청시 관리자인지 확인
		
		HttpSession session = request.getSession();
		
		Users loginUser = (Users)session.getAttribute("loginUser");
		if(loginUser == null || !loginUser.getIsManager().equals("Y")) {
			session.setAttribute("msg", "관리자 로그인 후 이용해주세요.");
			response.sendRedirect("loginView.us");
		} 
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
