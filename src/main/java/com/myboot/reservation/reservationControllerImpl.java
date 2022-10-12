package com.myboot.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("reservationController")
public  class reservationControllerImpl {

@RequestMapping("/reservation.do") 
  public String reservationMain(Model model){
 
    return "reservationMain"; 
  }

}
