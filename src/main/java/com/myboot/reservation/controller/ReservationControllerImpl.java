package com.myboot.reservation.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("reservationController")
public  class ReservationControllerImpl {

//	@RequestMapping("/reservation.do") 
//		public String ReservationMain(Model model){
// 
//		return "reservationMain"; 
//    	}

	@RequestMapping(value= "/reservationForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ReservationMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
//		mav.setViewName(viewName);
		System.out.println(viewName);
		
		return mav;
		
	}

	@RequestMapping("/reservationcomplete.do")
		public String ReservationComplete(Model model){
	
		return "reservationComplete";
		}
	
}

