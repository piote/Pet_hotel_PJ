package com.myboot.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface UserController {

	public ModelAndView modMember(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView pw_change(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String userMain(Model model);
}
