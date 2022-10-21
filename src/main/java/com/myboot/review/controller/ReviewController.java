package com.myboot.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public  interface ReviewController {
	public ModelAndView reviewDetail_1(HttpServletRequest request, HttpServletResponse response) throws Exception ;

	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
	String reviewForm(Model model);
	
	
	
	
}
