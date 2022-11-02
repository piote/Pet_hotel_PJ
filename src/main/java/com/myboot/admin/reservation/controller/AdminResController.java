package com.myboot.admin.reservation.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.reservation.vo.AdminResFullVO;


public interface AdminResController {
	
	public ModelAndView ResList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView ResReed(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public List<AdminResFullVO> adminResListById(@RequestBody Map<String,Object> searchMap,
			  HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//
	
	public ModelAndView adminResMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView adminResUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

                  