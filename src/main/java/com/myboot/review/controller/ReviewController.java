package com.myboot.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public  interface ReviewController {
	

	
	
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
	String reviewForm(Model model);


	public ModelAndView reviewDetail_1(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewDetail_2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewDetail_3(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView reviewForm(HttpServletRequest request, HttpServletResponse response) throws Exception;



	ResponseEntity removeReview(int reviewNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	
	
	
}
