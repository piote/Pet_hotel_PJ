package com.myboot.admin.reservation.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.reservation.vo.AdminResFullVO;


public interface AdminResController {
	
	public ModelAndView ResList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView adminResMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String adminReservationUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String ReservaitionCheck2(String res_num, String user_Id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public String ReservaitionCheck(String res_num, String user_Id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public HashMap SearchReservationNum(String reserNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public String ResPageAjax(Map<String, Object> searchMap, Model model) throws Exception;

	
}

                  