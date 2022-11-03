package com.myboot.facilities.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface FacilitiesController {
	public ModelAndView facilitiesView (HttpServletRequest request, HttpServletResponse response) 
	throws Exception;
	
	public ModelAndView modfacilities (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) 
	throws Exception;
}