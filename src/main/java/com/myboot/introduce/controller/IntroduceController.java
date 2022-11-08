package com.myboot.introduce.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface IntroduceController {
	public ModelAndView introduceView (HttpServletRequest request, HttpServletResponse response) 
	throws Exception;
	
	public ResponseEntity modintroduce (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) 
	throws Exception;
}