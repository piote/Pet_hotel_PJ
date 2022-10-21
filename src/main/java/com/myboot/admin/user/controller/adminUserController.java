package com.myboot.admin.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface adminUserController {
	public ModelAndView UserList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
