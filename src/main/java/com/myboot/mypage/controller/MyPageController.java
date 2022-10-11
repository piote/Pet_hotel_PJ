package com.myboot.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MyPageController {
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response)  throws Exception;
    public ModelAndView checkReserve(HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
