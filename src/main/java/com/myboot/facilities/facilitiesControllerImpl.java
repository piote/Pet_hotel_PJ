package com.myboot.facilities;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("facilitesController")
public  class facilitiesControllerImpl {

@RequestMapping("/facilities.do") 
  public String facilities(Model model){
 
    return "facilities"; 
  }
}