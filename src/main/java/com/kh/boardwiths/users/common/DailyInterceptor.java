package com.kh.boardwiths.users.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.boardwiths.users.model.exception.UsersException;
import com.kh.boardwiths.users.model.service.UsersService;

public class DailyInterceptor implements HandlerInterceptor{
	@Autowired
	private UsersService uService;
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception { // View를 렌더링한 직후에 실행
		
		HttpSession session = request.getSession();
		//Users loginUser = (Users)session.getAttribute("loginUser");
		if(session.getAttribute("loginUser") != null) {
			int result = uService.dailyInterceptor();
			
			if(result > 0) { // 오늘날짜 컬럼이 존재하는 경우 : update
				int uResult = uService.dailyUpdate();
				if(uResult < 1) {
					throw new UsersException("사용량 통계 서비스 요청에 실패하였습니다.");
				}
			} else { // 오늘날짜 컬럼이 존재하지 않는 경우 : insert
				int iResult = uService.dailyInsert();
				if(iResult < 1) {
					throw new UsersException("사용량 통계 서비스 요청에 실패하였습니다.");
				}
			}
		}
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	
	
	
	
	
	
	
	
	
	
}
