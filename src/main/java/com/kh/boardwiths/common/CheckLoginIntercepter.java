package com.kh.boardwiths.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.boardwiths.users.model.vo.Users;

public class CheckLoginIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Users loginUser = (Users)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			String url = request.getRequestURI();

			String msg = null;
			if(url.contains("selectBoard.bo")) {
//				System.out.println(url);
				msg = "로그인 후 이용하세요";
			} else {
				msg = "로그인 세션이 만료되어 로그인 화면으로 넘어갑니다";
			}
			
			session.setAttribute("msg", msg);
			response.sendRedirect("loginView.us"); 
			// 본수업 Spring에서, loginView.me에서 login으로 넘어가게 되기 때문에 msg를 login.jsp 에서 출력해야함
			// boardwiths에서는, loginView.jsp 에서 출력되도록 script로 
			return false;
		}	
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
