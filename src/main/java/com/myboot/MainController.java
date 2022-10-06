package com.myboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public  class MainController {
@ResponseBody
  @RequestMapping("/") 
  public String home(){
    System.out.println("Hello Boot!!");
    return "Hello Boot!!"; 
  }

  @RequestMapping("/main.do")
  public String hello(Model model){
   System.out.println("안녕하세요");
   return "main";	
  }
  
}