package com.myboot.introduce;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class introduceControllerImpl {

	 @RequestMapping("/introduce.do")
	  public String review(Model model){
		System.out.println("호텔 소개");
		return "introduce";
	  }
}