package com.kh.boardwiths.common.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class InterceptorTest implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(InterceptorTest.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("===================== START ======================");
		logger.debug(request.getRequestURI());;
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("---------------------- view ----------------------");
		// 본수업에서는 ajax 로 되어있는 부분은 modelAndView가 없기 때문에, boardwiths는 ajax로 X
//		if(modelAndView != null) {
//			logger.debug(modelAndView.getModel().toString());
//			logger.debug(modelAndView.getViewName());
//		}
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.debug("====================== END =======================");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
