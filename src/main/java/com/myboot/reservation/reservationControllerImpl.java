package com.myboot.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("reservationController")
public  class reservationControllerImpl {

	@RequestMapping("/reservation.do") 
		public String reservationMain(Model model){
 
		return "reservationMain"; 
    	}

	@RequestMapping("/reservationcomplete.do")
		public String reservationComplete(Model model){
	
		return "reservationComplete";
		}
	
}

