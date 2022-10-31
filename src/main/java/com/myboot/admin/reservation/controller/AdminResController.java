package com.myboot.admin.reservation.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;


public interface AdminResController {
	public ModelAndView adminResMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

}

                  