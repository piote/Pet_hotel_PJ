package com.myboot.reservation.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface ReservationController {
	public ModelAndView reservationMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reservationComplete(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView reservationAdd(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public String reservationComplete(Model model);
}
