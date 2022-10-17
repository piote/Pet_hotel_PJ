package com.myboot.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("reservationController")
public  class ReservationControllerImpl {

	@RequestMapping("/reservation.do") 
		public String ReservationMain(Model model){
 
		return "reservationMain"; 
    	}

	@RequestMapping("/reservationcomplete.do")
		public String ReservationComplete(Model model){
	
		return "reservationComplete";
		}
	
}

