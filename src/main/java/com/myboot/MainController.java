package com.myboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public  class MainController {

  @RequestMapping("/") 
  public String home(){
    return "main"; 
  }

  @RequestMapping("/main.do")
  public String hello(Model model){
	return "main";
  }
  @RequestMapping("/membership.do")
  public String membership(Model model){
	  return "membership";
  }
  
}
