package com.myboot.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MyPageController {
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response)  throws Exception;
    public ModelAndView checkReserve(HttpServletRequest request, HttpServletResponse response)  throws Exception;
    public ModelAndView cancelMyReserve(@RequestParam("reservation_num")  String reservation_num,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
