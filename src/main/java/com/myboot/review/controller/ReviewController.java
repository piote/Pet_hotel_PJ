package com.myboot.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public  interface ReviewController {
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception ;

	String reviewForm(Model model);
	 
}
